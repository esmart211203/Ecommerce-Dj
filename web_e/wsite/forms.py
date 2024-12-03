from django import forms
from django.core.validators import validate_email
from django.contrib.auth.models import User

class RegistrationForm(forms.Form):
    username = forms.CharField(max_length=150)
    email = forms.EmailField(validators=[validate_email])
    password = forms.CharField(widget=forms.PasswordInput)

    def clean_username(self):
        username = self.cleaned_data['username']
        if User.objects.filter(username=username).exists():
            raise forms.ValidationError("Username already exists.")
        return username
    

class PaymentForm(forms.Form):

    order_id = forms.CharField(max_length=250)
    order_type = forms.CharField(max_length=20)
    amount = forms.IntegerField()
    order_desc = forms.CharField(max_length=100)
    bank_code = forms.CharField(max_length=20, required=False)
    language = forms.CharField(max_length=2)
