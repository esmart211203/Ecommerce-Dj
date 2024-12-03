E-Commerce Website with Customer Feedback Analysis
This project showcases a full-featured e-commerce web application built using Django for the web interface and FastAPI for customer feedback analysis. The API service utilizes a machine learning model to analyze customer reviews and provide insights into product performance.

Table of Contents
Overview
Features
Technologies Used
Project Structure
Installation
Usage
Future Improvements
Overview
This project is divided into two main components:

E-Commerce Website (web_e)

Built using Django, it includes functionalities for product browsing, cart management, and user authentication.
Provides an intuitive admin panel for managing products, categories, and orders.
Feedback Analysis API (api_v1)

Developed using FastAPI, it analyzes customer reviews submitted after purchases.
The API leverages a pre-trained sentiment analysis model to determine the overall sentiment (positive, negative, or neutral).
Features
Web Application (Django)
User registration and authentication (login/logout).
Product listing with categories and search functionality.
Cart and checkout system with order management.
Admin panel for managing products, orders, and customer data.
Responsive design powered by Bootstrap.
Feedback Analysis API (FastAPI)
Sentiment analysis for customer feedback.
Real-time RESTful API endpoints.
Comprehensive documentation with Swagger and ReDoc.
Technologies Used
Backend: Django, FastAPI
Frontend: Bootstrap, HTML, CSS
Database: MySQL
Machine Learning: Pre-trained sentiment analysis model (e.g., scikit-learn or Hugging Face Transformers)
Containerization: Docker for deployment
Version Control: Git
Project Structure
plaintext
Sao chép mã
├── api_v1/
│   ├── main.py               # FastAPI entry point
│   ├── models/               # Sentiment analysis model and utilities
│   ├── routers/              # API route definitions
│   └── requirements.txt      # FastAPI dependencies
│
├── web_e/
│   ├── web_e/                # Django project settings
│   ├── templates/            # HTML templates
│   ├── static/               # Static files (CSS, JS, images)
│   ├── products/             # Product management app
│   ├── orders/               # Order management app
│   └── requirements.txt      # Django dependencies
│
├── docker-compose.yml        # Docker configuration
├── README.md                 # Project documentation
└── .gitignore                # Ignored files
Installation
Prerequisites
Python 3.8 or higher
Docker
MySQL
Setup
Clone the repository:

bash
Sao chép mã
git clone https://github.com/your-username/your-repo.git
cd your-repo
Setup Docker containers:

bash
Sao chép mã
docker-compose up --build
Apply Django migrations:

bash
Sao chép mã
docker exec -it web_e python manage.py migrate
Start the FastAPI server:

bash
Sao chép mã
docker exec -it api_v1 uvicorn main:app --host 0.0.0.0 --port 8001
Usage
Access the e-commerce website:
Open your browser and navigate to: http://localhost:8000
API Documentation for Feedback Analysis:
Swagger UI: http://localhost:8001/docs
ReDoc: http://localhost:8001/redoc
Example API Usage:
Endpoint: POST /analyze-feedback
Request Body:
json
Sao chép mã
{
   "review": "This product is amazing! High quality and fast shipping."
}
Response:
json
Sao chép mã
{
   "sentiment": "positive",
   "confidence": 0.92
}
Future Improvements
Add product recommendation system using collaborative filtering.
Expand feedback analysis to detect specific themes (e.g., shipping, quality, price).
Implement real-time notifications for orders and feedback.
Optimize for mobile-first design.
This project exemplifies my ability to combine web development and machine learning into a cohesive, scalable solution for real-world applications.

Author
DO XUAN TRONG
