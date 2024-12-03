# tasks.py
from celery import Task
from .models import Discount

class CleanupDiscountsTask(Task):
    def run(self):
        Discount.objects.filter(quantity=0).delete()
