import torch
import torch.nn as nn  # Thêm dòng này để import nn
from transformers import AutoTokenizer, AutoModel
from fastapi import FastAPI
from pydantic import BaseModel

# Định nghĩa mô hình
class FeedbackClassifier(nn.Module):
    def __init__(self, n_classes):
        super(FeedbackClassifier, self).__init__()
        self.bert = AutoModel.from_pretrained("vinai/phobert-base")
        self.drop = nn.Dropout(p=0.3)
        self.fc = nn.Linear(self.bert.config.hidden_size, n_classes)

    def forward(self, input_ids, attention_mask):
        _, output = self.bert(input_ids=input_ids, attention_mask=attention_mask, return_dict=False)
        output = self.drop(output)
        return self.fc(output)

# Khởi tạo FastAPI
app = FastAPI()

# Load mô hình và tokenizer
model = FeedbackClassifier(n_classes=3)
model.load_state_dict(torch.load("feedback_classifier.pth", map_location=torch.device('cpu')))
model.eval()

tokenizer = AutoTokenizer.from_pretrained("vinai/phobert-base")

# Định nghĩa kiểu dữ liệu đầu vào
class TextRequest(BaseModel):
    comment: str

# API dự đoán
@app.post("/predict/")
async def predict(request: TextRequest):
    text = request.comment

    # Token hóa văn bản
    inputs = tokenizer.encode_plus(
        text,
        add_special_tokens=True,
        max_length=120,
        return_token_type_ids=False,
        padding='max_length',
        return_attention_mask=True,
        return_tensors='pt'
    )
    
    input_ids = inputs['input_ids']
    attention_mask = inputs['attention_mask']

    # Dự đoán từ mô hình
    with torch.no_grad():
        outputs = model(input_ids=input_ids, attention_mask=attention_mask)
        _, prediction = torch.max(outputs, dim=1)  # Điều chỉnh lấy giá trị dự đoán
    return {
        "prediction": prediction.item(),
    }

# Chạy server FastAPI với Uvicorn
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8888)
