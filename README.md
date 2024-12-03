# E-Commerce Website with Customer Feedback Analysis

This project showcases a full-featured e-commerce web application built using Django for the web interface and FastAPI for customer feedback analysis. The API service utilizes a machine learning model to analyze customer reviews and provide insights into product performance.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Future Improvements](#future-improvements)

## Overview
This project is divided into two main components:

### E-Commerce Website (web_e)
- Built using Django, it includes functionalities for product browsing, cart management, and user authentication.
- Provides an intuitive admin panel for managing products, categories, and orders.

### Feedback Analysis API (api_v1)
- Developed using FastAPI, it analyzes customer reviews submitted after purchases.
- The API leverages a pre-trained sentiment analysis model to determine the overall sentiment (positive, negative, or neutral).

## Features

### Web Application (Django)
- User registration and authentication (login/logout).
- Product listing with categories and search functionality.
- Cart and checkout system with order management.
- Admin panel for managing products, orders, and customer data.
- Responsive design powered by Bootstrap.

### Feedback Analysis API (FastAPI)
- Sentiment analysis for customer feedback.
- Real-time RESTful API endpoints.
- Comprehensive documentation with Swagger and ReDoc.

## Technologies Used
- **Backend**: Django, FastAPI
- **Frontend**: Bootstrap, HTML, CSS
- **Database**: MySQL
- **Machine Learning**: Pre-trained sentiment analysis model (e.g., scikit-learn or Hugging Face Transformers)
- **Containerization**: Docker for deployment
- **Version Control**: Git

## Project Structure
```plaintext
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
