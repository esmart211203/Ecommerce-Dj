from calendar import Month
from django.db import models
from django.contrib.auth.models import User
from django.db.models import Q,F, Func
import re
from django.db.models import Sum, Count
from django.utils import timezone
import datetime
from datetime import timedelta
from django.db.models import Sum
from django.db.models.functions import ExtractYear, ExtractMonth, ExtractDay
from django.db.models import Avg

class Unaccent(Func):
    function = 'unaccent'
    template = '%(function)s(%(expressions)s)'


class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='orders')

class Category(models.Model):
    name = models.CharField(max_length=100)
    image = models.ImageField(upload_to="category", blank=True)
    description = models.TextField(default="")
    featured = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name
    
class Product(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()
    price = models.FloatField()
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    quantity_in_stock = models.IntegerField(default=0)
    featured = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name
    
    def get_average_rating(self):
        average_rating = self.productrating_set.aggregate(Avg('rating_value'))['rating_value__avg']
        return round(average_rating, 2) if average_rating else None
    def count_reviews(self):
        return ProductRating.objects.filter(product=self).count()
    def get_first_image(self):
        first_image = self.productimages_set.first()
        if first_image:
            return first_image.image_url
        else:
            return None
    def get_price(self):
        formatted_price = f"{self.price:,.3f}".replace(",", "X").replace(".", ",").replace("X", ".")
        return formatted_price

class ProductImages(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    image_url = models.ImageField(upload_to="product")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Attribute(models.Model):
    """
    Tạo ra thuộc tính cho danh mục vd: (Laptop {'RAM', CPI}) (Màn Hình {'inch', 'tần số hz'})
    """
    att_name = models.CharField(max_length=255)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class ProductAttribute(models.Model):
    """
    khi thêm sản phẩm chọn danh mục thì sau đó cần thêm value cho thuộc tính của danh mục đó
    """
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    attribute = models.ForeignKey(Attribute, on_delete=models.CASCADE)
    value = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.product.name} - {self.attribute.att_name} - {self.value}"





class CartItem(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    @staticmethod
    def calculate_total_cart(user):
        cart_items = CartItem.objects.filter(user=user)
        total_price = sum(item.product.price * item.quantity for item in cart_items)
        formatted_price = f"{total_price:,.3f}".replace(",", "X").replace(".", ",").replace("X", ".")
        return formatted_price

    @staticmethod
    def count_cart_items(user):
        count = CartItem.objects.filter(user=user).count()
        return count
    
    @staticmethod
    def clear_cart(user):
        CartItem.objects.filter(user=user).delete()
class Order(models.Model):
    METHODS_CHOICES = (
        ('online', 'direct'),
        ('direct', 'direct'),
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    status = models.CharField(max_length=255,  default="Processing")
    full_name = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    phone = models.CharField(max_length=20)
    more_info = models.CharField(max_length=255, blank=True)
    note = models.CharField(max_length=255, blank=True)
    payment_method = models.CharField(max_length=50,choices=METHODS_CHOICES, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Order {self.id}"
    def get_formatted_total_amount(self):
            formatted_price = f"{self.total_amount:,.3f}"
            formatted_price = formatted_price.replace(",", "X").replace(".", ",").replace("X", ".")
            return formatted_price
class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def subtotal(self):
        return self.quantity * self.price
    
    @staticmethod
    def get_product_sales_by_day(start_date=None, end_date=None):
        if start_date is None:
            start_date = datetime.datetime.now().replace(day=1)
        if end_date is None:
            end_date = start_date.replace(day=1, month=start_date.month + 1) - timedelta(days=1)

        completed_orders = Order.objects.filter(status='Completed', created_at__range=(start_date, end_date))
        sales_data = OrderItem.objects.filter(order__in=completed_orders).values('created_at').annotate(total_quantity=Sum('quantity')).order_by('created_at')
        print('sales data', sales_data)

        sales_by_day = {}
        current_date = start_date
        while current_date <= end_date:
            sales_by_day[str(current_date.day)] = 0
            current_date += timedelta(days=1)

        for entry in sales_data:
            sales_by_day[str(entry['created_at'].day)] = entry['total_quantity']

        return sales_by_day
    
    @staticmethod
    def get_product_sales_by_month(start_date=None, end_date=None):
        if start_date is None:
            start_date = datetime.datetime.now().replace(day=1)
        if end_date is None:
            next_month = start_date.replace(day=28) + timedelta(days=4)  # this will never fail
            end_date = (next_month - timedelta(days=next_month.day)).replace(hour=23, minute=59, second=59)

        if end_date.year != start_date.year:
            end_date = end_date.replace(year=start_date.year)

        valid_orders = Order.objects.filter(status='Completed', created_at__isnull=False, created_at__range=(start_date, end_date))
        completed_orders = valid_orders.distinct()
        sales_by_month = {str(month): 0 for month in range(1, 13)}
        sales_data = OrderItem.objects.filter(order__in=completed_orders) \
            .annotate(month=ExtractMonth('created_at')) \
            .values('month') \
            .annotate(total_quantity=Sum('quantity')) \
            .order_by('month')


        current_month = datetime.datetime.now().month
        for entry in sales_data:
            month = entry['month'] or current_month 
            sales_by_month[str(month)] += entry['total_quantity']

        return sales_by_month

    @staticmethod
    def get_product_sales_by_year():
        current_year = datetime.datetime.now().year
        start_year = 2020
        years_sales = []

        for year in range(start_year, current_year + 1):
            start_date = datetime.datetime(year, 1, 1)
            end_date = datetime.datetime(year, 12, 31)

            completed_orders = Order.objects.filter(status='Completed', created_at__range=(start_date, end_date))
            sales_data = OrderItem.objects.filter(order__in=completed_orders) \
                .values('order__created_at__year') \
                .annotate(total_quantity=Sum('quantity'))

            year_sales = sum(entry['total_quantity'] for entry in sales_data)
            years_sales.append({'year': str(year), 'value': year_sales})

        return {'data': years_sales}


    def get_daily_revenue_by_day():
        now = datetime.datetime.now()
        start_date = now.replace(day=1)
        next_month = start_date.replace(day=28) + timedelta(days=4)  
        end_date = (next_month - timedelta(days=next_month.day)).replace(hour=23, minute=59, second=59)
        completed_orders = Order.objects.filter(status='Completed', created_at__range=(start_date, end_date))
        revenue_data = OrderItem.objects.filter(order__in=completed_orders) \
            .annotate(day=ExtractDay('order__created_at')) \
            .values('day') \
            .annotate(total_revenue=Sum(F('price') * F('quantity'))) \
            .order_by('day')
        daily_revenue = {day: 0 for day in range(1, (end_date - start_date).days + 2)}


        current_day = now.day
        for entry in revenue_data:
            day = entry['day'] or current_day 
            daily_revenue[day] = entry['total_revenue']

        return daily_revenue

    def get_daily_revenue_by_month(start_date=None, end_date=None):
            if start_date is None:
                start_date = timezone.now().replace(day=1)
            if end_date is None:
                next_month = (start_date.replace(day=28) + timedelta(days=4)).replace(day=1)
                end_date = next_month - timedelta(seconds=1)
            
            completed_orders = Order.objects.filter(status='Completed', created_at__range=(start_date, end_date))

            monthly_revenue_data = completed_orders.annotate(
                month=ExtractMonth('created_at'),
                year=ExtractYear('created_at'),
                day=ExtractDay('created_at')
            ).values('year', 'month', 'day').annotate(
                total_revenue=Sum('total_amount')
            ).order_by('year', 'month', 'day')

            monthly_revenue = {}

            for entry in monthly_revenue_data:
                year = entry.get('year')
                month = entry.get('month')
                day = entry.get('day')
                total_revenue = entry['total_revenue']

                if year is None or month is None or day is None:
                    current_month = timezone.now().month
                    current_year = timezone.now().year
                    date_key = f'{current_year}-{current_month:02d}-{day or timezone.now().day:02d}'
                else:
                    date_key = f'{year}-{month:02d}-{day:02d}'

                if date_key not in monthly_revenue:
                    monthly_revenue[date_key] = 0
                monthly_revenue[date_key] += total_revenue

            return monthly_revenue
    
    @staticmethod
    def get_daily_revenue_by_year(start_date=None, end_date=None):
        start_date = datetime.datetime(2020, 1, 1)
        end_date = timezone.now().replace(month=12, day=31)

        completed_orders = Order.objects.filter(status='Completed', created_at__range=(start_date, end_date))

        yearly_revenue_data = completed_orders.annotate(
            year=ExtractYear('created_at')
        ).values('year').annotate(
            total_revenue=Sum('total_amount')
        ).order_by('year')

        yearly_revenue = {}

        for year in range(2020, end_date.year + 1):
            yearly_revenue[str(year)] = 0

        for entry in yearly_revenue_data:
            year = entry['year']
            total_revenue = entry['total_revenue']
            if year is None:
                year = timezone.now().year
            yearly_revenue[str(year)] = total_revenue

        return yearly_revenue
    

    @staticmethod
    def get_top_5_best_selling_products():
        product_sales_data = OrderItem.objects.values(
            'product__id', 'product__name', 'product__price'
        ).annotate(
            total_quantity_sold=Sum('quantity')
        )
        sorted_products = sorted(
            product_sales_data, key=lambda x: x['total_quantity_sold'], reverse=True
        )
        top_5_best_selling_products = sorted_products[:5]
        
        # Add the first image URL to each product in the top 5 list
        for product in top_5_best_selling_products:
            product_obj = Product.objects.get(id=product['product__id'])
            product['first_image_url'] = product_obj.get_first_image()
        return top_5_best_selling_products
    
    @staticmethod
    def get_top_buying_user():
        user_sales_data = Order.objects.values('user__id', 'user__username').annotate(
            total_quantity_bought=Sum('orderitem__quantity')
        )
        sorted_users = sorted(
            user_sales_data, key=lambda x: x['total_quantity_bought'], reverse=True
        )
        top_buying_user = sorted_users[0] if sorted_users else None
        return top_buying_user

class Profile(models.Model):
    SEX_CHOICES = (
        ('Nam', 'Nam'),
        ('Nữ', 'Nữ'),
    )
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    full_name  = models.CharField(max_length=255, blank=True)
    sex = models.CharField(max_length=3, choices=SEX_CHOICES)
    phone = models.CharField(max_length=20)
    birthday = models.DateField()
    #update image

class Payment_VNPay(models.Model):
    order_id = models.IntegerField(default=0, null=True)
    amount = models.FloatField(default=0.0, null=True)
    order_desc = models.CharField(max_length=200, null=True, blank=True)
    vnp_TransactionNo = models.CharField(max_length=200, null=True, blank=True)
    vnp_ResponseCode = models.CharField(max_length=200, null=True, blank=True)

class Discount(models.Model):
    code = models.CharField(max_length=200, null=True, blank=True)
    discount_value = models.IntegerField()
    quantity = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    def delete_if_quantity_zero(self):
        if self.quantity == 0:
            self.delete()

class WishlistItem(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    @classmethod
    def get_wishlist_items(cls, user):
        return cls.objects.filter(user=user)
    
    
class ProductRating(models.Model):
    RATING_CHOICES = (
        (1, '1'),
        (2, '2'),
        (3, '3'),
        (4, '4'),
        (5, '5'),
    )
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    rating_value = models.IntegerField(choices=RATING_CHOICES)
    comment = models.CharField(max_length=255, default='') 
    created_at = models.DateTimeField(auto_now_add=True, null=True)
    def __str__(self):
        return f"{self.author.username} - {self.product.name} - {self.rating_value}"

def date_range(start_date, end_date):
    for n in range(int((end_date - start_date).days) + 1):
        yield start_date + timedelta(n)


class Classification(models.Model):
    product_rating = models.OneToOneField(ProductRating, on_delete=models.CASCADE)
    classify = models.CharField(max_length=50, default='nature')
    created_at = models.DateTimeField(auto_now_add=True, null=True)
