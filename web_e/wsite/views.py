import os
from django.shortcuts import render,HttpResponse,redirect
from django.contrib.auth import authenticate, login, logout
from django.views import View
from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import HttpResponseForbidden, HttpResponseNotFound
from .forms import RegistrationForm
from django.contrib.auth.models import User
from .models import Category,Product,CartItem,OrderItem,Order,Profile,Payment_VNPay,Discount, Attribute, ProductImages, ProductAttribute, WishlistItem, ProductRating, Classification
from django.shortcuts import get_object_or_404
from django.http import Http404
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.conf import settings
from django.db.models import Q
from datetime import date
from decimal import Decimal
from datetime import datetime
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from .models import Discount
from django.db import IntegrityError
import json
from django.db import transaction
######## FRONT-END #######
def index(request):
    categories = Category.objects.all()[:6]
    products = Product.objects.all()[:6]
    context = {
        'categories': categories,
        'products': products,
    }
    return render(request, 'index.html', context)

def shop_view(request):
        categories = Category.objects.all()
        #sort products
        sort_option = request.GET.get('sort', '')
        if sort_option == 'Tăng dần':
            products = Product.objects.all().order_by('price')
        elif sort_option == 'Giảm dần':
            products = Product.objects.all().order_by('-price')
        else:
            products = Product.objects.all()
        context = {
            'products': products,
            'categories': categories,
        }
        return render(request, 'shop.html',context)

def shop_category(request, category_id):
    category = get_object_or_404(Category, id=category_id)
    attributes = Attribute.objects.filter(category=category)
    
    attributes_by_category = {}
    for attribute in attributes:
        category_name = attribute.category.name if attribute.category else 'Uncategorized'
        if category_name not in attributes_by_category:
            attributes_by_category[category_name] = {}

        attribute_type = attribute.att_name 
        if attribute_type not in attributes_by_category[category_name]:
            attributes_by_category[category_name][attribute_type] = []

        values = ProductAttribute.objects.filter(attribute=attribute).values_list('value', flat=True).distinct()
        attributes_by_category[category_name][attribute_type].append({'name': attribute.att_name, 'values': values})
    products = Product.objects.filter(category=category)
    categories = Category.objects.all()
    context = {
        'category': category,
        'attributes_by_category': attributes_by_category,
        'products': products,
        'categories': categories,
        'media_url': settings.MEDIA_URL,
    }
    return render(request, 'shop_category.html', context)

def detail_product(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    product_attributes = ProductAttribute.objects.filter(product=product)
    product_ratings = ProductRating.objects.filter(product=product)
    product_images = ProductImages.objects.filter(product=product)
    similarity_products = Product.objects.filter(category=product.category).exclude(pk=product.id)
    return render(request, 'detail_product.html', {'product': product,
                                                    'attributes': product_attributes,
                                                    'product_images': product_images,
                                                    'similarity_products': similarity_products,
                                                    'product_ratings': product_ratings,
                                                })

@login_required(login_url="login")
@user_passes_test(lambda u: u.is_superuser, login_url="login")
def is_admin(request):
    if request.user.is_superuser:
        return redirect("admin:index")
    else:
        return HttpResponseForbidden("Access Denied")
    

########## AUTH ##########
class LoginView(View):
    def get(self, request):
        return render(request, "auth/login.html")

    def post(self, request):
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(username=username, password=password)
        if user is None:
            context = {
                "error_message": "Đăng nhập không thành công. Vui lòng kiểm tra lại tên người dùng và mật khẩu."
            }
            return render(request, "auth/login.html", context)
        login(request, user)
        return redirect("index")
class RegisterView(View):
    def get(self, request):
        form = RegistrationForm()
        return render(request, "auth/register.html", {"form": form})

    def post(self, request):
        form = RegistrationForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            user = User.objects.create_user(username=username, email=email, password=password)
            login(request, user)
            return redirect("index")
        else:
            return render(request, "auth/register.html", {"form": form})

def logout_user(request):
    logout(request)
    return redirect('index')
########## ADMIN #########

def admin_view(request):
    category = Category.objects.first()
    attributes = Attribute.objects.filter(category=category)
    
    attributes_by_category = {}
    for attribute in attributes:
        category_name = attribute.category.name if attribute.category else 'Uncategorized'
        if category_name not in attributes_by_category:
            attributes_by_category[category_name] = {}

        attribute_type = attribute.att_name  # Assuming att_name is like 'RAM', 'CPU'
        if attribute_type not in attributes_by_category[category_name]:
            attributes_by_category[category_name][attribute_type] = []

        values = ProductAttribute.objects.filter(attribute=attribute).values_list('value', flat=True).distinct()
        attributes_by_category[category_name][attribute_type].append({'name': attribute.att_name, 'values': values})

    context = {
        'category': category,
        'attributes': attributes,
        'attributes_by_category': attributes_by_category
    }
    return render(request, 'admin/index.html', context)

def order_view(request):
    orders = Order.objects.all()
    return render(request, 'admin/order/index.html',context={'orders': orders})

def order_detail(request, order_id):
    order = get_object_or_404(Order, pk=order_id)
    order_items = OrderItem.objects.filter(order=order)

    # Calculate total amount for the order
    total_amount = sum(item.price * item.quantity for item in order_items)
    formatted_total_amount = '{:,.3f}'.format(total_amount)
    return render(request, 'admin/order/detail.html', context={
        'order': order,
        'order_items': order_items,
        'total_amount': formatted_total_amount,
    })
def product_view(request):
    products = Product.objects.all()    
    return render(request, 'admin/product/index.html', context={'products':products})
class CreateProductView(View):
    def get(self, request):
        categories = Category.objects.all()
        return render(request, 'admin/product/create.html',context={'categories':categories})
    
    def post(self, request):
        name = request.POST.get("name")
        description = request.POST.get("description")
        image = request.FILES.get("image")
        price = request.POST.get("price")
        category_id = request.POST.get("category")
        featured = request.POST.get("featured") == "on"
        quantity_in_stock = request.POST.get("quantity_in_stock", 0)
        category = get_object_or_404(Category, pk=category_id)
        #create
        product = Product.objects.create(name=name, description=description,
        price=price, category=category, quantity_in_stock=quantity_in_stock,  featured=featured)
        #add product images
        images = request.FILES.getlist("images")  
        for image in images:
            ProductImages.objects.create(product=product, image_url=image)
        return redirect(reverse("product_attribute.create", kwargs={'product_id': product.id}))

class EditProductView(View):
    def get(self, request, product_id):
        product = get_object_or_404(Product, pk=product_id)
        categories = Category.objects.all()
        product_attributes = ProductAttribute.objects.filter(product=product)
        return render(request, 'admin/product/edit.html', context={'product': product,
                                                                    'categories': categories,
                                                                    'product_attributes': product_attributes
                                                                    })

    def post(self, request, product_id):
        product = get_object_or_404(Product, pk=product_id)
        name = request.POST.get("name")
        description = request.POST.get("description")
        price = request.POST.get("price")
        category_id = request.POST.get("category")
        featured = request.POST.get("featured") == "on"

        category = get_object_or_404(Category, pk=category_id)


        # Cập nhật thông tin của sản phẩm
        product.name = name
        product.description = description
        product.price = price
        product.category = category
        product.featured = featured
        product.save()

        return redirect("product.index")
    

def delete_product(request, product_id):
    try:
        product = get_object_or_404(Product, pk=product_id)
        product.delete()
        return redirect("product.index")
    except Http404:
        return HttpResponseRedirect(reverse('product_not_found'))

def category_view(request):
    categories = Category.objects.all()
    context = {
        'categories': categories,
    }
    return render(request, 'admin/category/index.html', context)

class CreateCategoryView(View):
    def get(self, request):
            return render(request, 'admin/category/create.html')
    
    def post(self, request):
        name = request.POST.get("name")
        image = request.FILES.get("image")
        description = request.POST.get("description")
        featured = request.POST.get("featured") == "on"
        category = Category.objects.create(name=name, image=image, description=description, featured=featured)
        return redirect("category.index")
class EditCategoryView(View):
    def get(self, request, category_id):
        category = get_object_or_404(Category, pk=category_id)
        return render(request, 'admin/category/edit.html', context={'category': category})

    def post(self, request, category_id):
        category = get_object_or_404(Category, pk=category_id)
        name = request.POST.get("name")
        image = request.FILES.get("image")
        description = request.POST.get("description")
        featured = request.POST.get("featured") == "on"
        if image:
            if category.image:
                os.remove(category.image.path)
            category.image = image
        else:
            image = category.image
        category.name = name
        category.description = description
        category.featured = featured
        category.save()

        return redirect("category.index")
def delete_category(request, category_id):
    try:
        category = get_object_or_404(Category, pk=category_id)
        # xóa ảnh nếu có
        image_path = os.path.join(settings.MEDIA_ROOT, str(category.image))
        if os.path.exists(image_path):
            os.remove(image_path)
        category.delete()
        return redirect("category.index")
    except Http404:
        return HttpResponseRedirect(reverse('Category_not_found'))

def user_view(request):
    users = User.objects.all()
    return render(request, 'admin/user/index.html',context={'users':users})

def delete_user(request, user_id):
    user = get_object_or_404(User, pk=user_id)
    user.delete()
    return redirect("user.index")

#### CART ####
@login_required
def cart_view(request):
    user = request.user
    cart_items = CartItem.objects.filter(user=user)
    total_cart = CartItem.calculate_total_cart(user)
    orders = Order.objects.filter(user=user)
    return render(request, 'cart.html', context={'cart_items': cart_items,
                                                  'total_cart': total_cart,
                                                  'orders': orders,
                                                })

@login_required
def checkout_info(request):
    user = request.user
    total_cart = CartItem.calculate_total_cart(user)
    return render(request, 'checkout_info.html', context={'total_cart': total_cart})

@login_required
def add_to_cart(request, product_id):
    user = request.user
    product = get_object_or_404(Product, pk=product_id)
    quantity = int(request.POST.get('quantity', 1)) 
    
    cart_item, created = CartItem.objects.get_or_create(user=user, product=product)
    if not created:
        cart_item.quantity += quantity
    else:
        cart_item.quantity = quantity
    cart_item.save()
    
    return redirect("cart")

@login_required
def add_to_cart_api(request, product_id):
    if request.method == 'POST':
        user = request.user
        product = get_object_or_404(Product, pk=product_id)
        quantity = request.POST.get('quantity', 1) 
        
        try:
            quantity = int(quantity)
            if quantity <= 0:
                return JsonResponse({'error': 'Invalid quantity'}, status=400)
            
            cart_item, created = CartItem.objects.get_or_create(user=user, product=product)
            if created:
                cart_item.quantity = quantity
            else:
                cart_item.quantity += quantity
            cart_item.save()
            
            return JsonResponse({'message': 'Product added to cart',
                                  'product_name': product.name,
                                },status=200)
        
        except ValueError:
            return JsonResponse({'error': 'Invalid quantity value'}, status=400)
    else:
        return JsonResponse({'error': 'Invalid request method'}, status=405)
@login_required
def checkout(request):
    user = request.user
    full_name = request.POST.get("full_name")
    phone = request.POST.get("phone")
    note = request.POST.get("note")
    payment_method = request.POST.get("payment_method")
    province = request.POST.get("province")
    district = request.POST.get("district")
    ward = request.POST.get("ward")
    address = f'{province}, {district}, {ward}'

    cart_items = CartItem.objects.filter(user=user)

    insufficient_products = []
    for cart_item in cart_items:
        if cart_item.quantity > cart_item.product.quantity_in_stock:
            insufficient_products.append({
                'product_id': cart_item.product.id,
                'product_name': cart_item.product.name,
                'available_quantity': cart_item.product.quantity_in_stock
            })

        if insufficient_products:
            for product in insufficient_products:
                messages.error(request, f"Số lượng không đủ cho sản phẩm {product['product_name']}. Số lượng hiện có: {product['available_quantity']}")
            return redirect('cart')

    try:
        with transaction.atomic():
            order = Order.objects.create(
                user=user,
                full_name=full_name,
                address=address,
                phone=phone,
                note=note,
                total_amount=0,  
                payment_method=payment_method,
            )

            for cart_item in cart_items:
                order_item = OrderItem.objects.create(
                    order=order,
                    product=cart_item.product,
                    quantity=cart_item.quantity,
                    price=cart_item.product.price
                )
                order_item.save()

                cart_item.product.quantity_in_stock -= cart_item.quantity
                cart_item.product.save()

            total_amount = sum(item.subtotal() for item in order.orderitem_set.all())
            order.total_amount = total_amount

            discount_code = request.POST.get('discount', '')
            if discount_code:
                discount = Discount.objects.get(code=discount_code)
                discount.quantity -= 1
                discount.save()
                if discount:
                    total_amount = total_amount - (total_amount * discount.discount_value / 100)
                    order.total_amount = total_amount
                if discount.quantity == 0:
                    discount.delete()

            order.save()

            cart_items.delete()

            if payment_method == "online":
                return redirect("payment.view")
            else:
                messages.success(request, 'Thanh toán đã thành công!')
                return redirect('cart')

    except Exception as e:
        return JsonResponse({'error': str(e)})
def order_completed(request, order_id):
    order = get_object_or_404(Order, pk=order_id)
    order.status = 'Completed'
    order.save()
    return redirect("order.index")

def delete_order(request, order_id):
    order = get_object_or_404(Order, pk=order_id)
    order.delete()
    return redirect("order.index")

def about_page(request):
    return render(request, 'about.html')

def contact_page(request):
    return render(request, 'contact.html')
def gmaps_page(request):
    return render(request, 'gmaps.html')
from django.db.models.functions import Lower
def search(request):
    q = request.GET.get('keyword', '').strip()
    q_lower = q.lower()
    products = Product.objects.all()
    if q:
        results =  products = products.annotate(
            name_lower=Lower('name'),
            description_lower=Lower('description'),
        ).filter(
            Q(name_lower__icontains=q_lower) | Q(description_lower__icontains=q_lower)
        )
    else:
        results = []
    return render(request, 'search.html', {'results': results, 'keyword': q})


@login_required
def profile(request):
    user = request.user
    wishlists = WishlistItem.get_wishlist_items(user=request.user)
    try:
        profile = Profile.objects.get(user=user)
    except Profile.DoesNotExist:
        profile = None
    return render(request, 'profile.html', context={'user': user,
                                                     'profile': profile,
                                                     'wishlists': wishlists,  
                                                     })
@login_required
def update_profile(request):
    user = request.user
    default_birthday = date(1900, 1, 1)
    profile, created = Profile.objects.get_or_create(user=user, defaults={'birthday': date(1900, 1, 1)})
    context = {
        'days': list(range(1, 32)),
        'months': list(range(1, 13)),
        'years': list(range(1900, 2025)),
        'user': user,
        'profile': profile,
    }
    if request.method == 'POST':    
        full_name = request.POST.get('full_name')
        sex = request.POST.get('sex')
        phone = request.POST.get('phone')
        day = request.POST.get('day')
        month = request.POST.get('month')
        year = request.POST.get('year')
        birthday = datetime.strptime(f'{year}-{month}-{day}', '%Y-%m-%d').date()
        # Cập nhật 
        profile.full_name = full_name
        profile.sex = sex
        profile.phone = phone
        profile.birthday = birthday
        profile.save()
        
        return redirect('profile')
    
    return render(request, 'update_profile.html', context=context)

def delete_cart_item(request, item_id):
    cart_item = get_object_or_404(CartItem, id=item_id)
    if cart_item.quantity > 1:
        cart_item.quantity -= 1
        cart_item.save()
    else:
        cart_item.delete()
    return redirect("cart")


def increase_quantity(request, item_id):
    cart_item = get_object_or_404(CartItem, id=item_id)
    cart_item.quantity += 1
    cart_item.save()
    return redirect("cart")


def decrease_quantity(request, item_id):
    cart_item = get_object_or_404(CartItem, id=item_id)
    if cart_item.quantity > 1:
        cart_item.quantity -= 1
        cart_item.save()
    return redirect("cart")


from django.contrib.auth import update_session_auth_hash
from django.contrib import messages


def change_password(request):
    if request.method == 'POST':
        old_password = request.POST.get('old-password')
        new_password = request.POST.get('new-password')
        confirm_pass = request.POST.get('confirm-password')
        user = request.user

        if user.check_password(old_password) and new_password == confirm_pass:
            user.set_password(new_password)
            user.save()
            update_session_auth_hash(request, user)
            messages.success(request, 'Mật khẩu đã được thay đổi thành công!')
            return redirect('profile')
        else:
            messages.error(request, 'Thay đổi không thành công.')
            return redirect('profile')

    return redirect("profile")


## payment
from .vnpay import vnpay
from .forms import PaymentForm
import hashlib
import hmac
import json
import urllib
import urllib.parse
import urllib.request
import random
import requests
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from datetime import datetime
from django.utils.http import unquote


def payment_view(request):
    return render(request, 'payment/index.html')
def hmacsha512(key, data):
    byteKey = key.encode('utf-8')
    byteData = data.encode('utf-8')
    return hmac.new(byteKey, byteData, hashlib.sha512).hexdigest()


def payment(request):

    if request.method == 'POST':
        # Process input data and build url payment
        form = PaymentForm(request.POST)
        if form.is_valid():
            order_type = form.cleaned_data['order_type']
            order_id = form.cleaned_data['order_id']
            amount = form.cleaned_data['amount']
            order_desc = form.cleaned_data['order_desc']
            bank_code = form.cleaned_data['bank_code']
            language = form.cleaned_data['language']
            ipaddr = get_client_ip(request)
            # Build URL Payment
            vnp = vnpay()
            vnp.requestData['vnp_Version'] = '2.1.0'
            vnp.requestData['vnp_Command'] = 'pay'
            vnp.requestData['vnp_TmnCode'] = settings.VNPAY_TMN_CODE
            vnp.requestData['vnp_Amount'] = amount * 100
            vnp.requestData['vnp_CurrCode'] = 'VND'
            vnp.requestData['vnp_TxnRef'] = order_id
            vnp.requestData['vnp_OrderInfo'] = order_desc
            vnp.requestData['vnp_OrderType'] = order_type
            # Check language, default: vn
            if language and language != '':
                vnp.requestData['vnp_Locale'] = language
            else:
                vnp.requestData['vnp_Locale'] = 'vn'
                # Check bank_code, if bank_code is empty, customer will be selected bank on VNPAY
            if bank_code and bank_code != "":
                vnp.requestData['vnp_BankCode'] = bank_code

            vnp.requestData['vnp_CreateDate'] = datetime.now().strftime('%Y%m%d%H%M%S')  # 20150410063022
            vnp.requestData['vnp_IpAddr'] = ipaddr
            vnp.requestData['vnp_ReturnUrl'] = settings.VNPAY_RETURN_URL
            vnpay_payment_url = vnp.get_payment_url(settings.VNPAY_PAYMENT_URL, settings.VNPAY_HASH_SECRET_KEY)
            print(vnpay_payment_url)
            return redirect(vnpay_payment_url)
        else:
            print("Form input not validate")
    else:
        return render(request, "payment/payment.html", {"title": "Thanh toán"})


def payment_ipn(request):
    inputData = request.GET
    if inputData:
        vnp = vnpay()
        vnp.responseData = inputData.dict()
        order_id = inputData['vnp_TxnRef']
        amount = inputData['vnp_Amount']
        order_desc = inputData['vnp_OrderInfo']
        vnp_TransactionNo = inputData['vnp_TransactionNo']
        vnp_ResponseCode = inputData['vnp_ResponseCode']
        vnp_TmnCode = inputData['vnp_TmnCode']
        vnp_PayDate = inputData['vnp_PayDate']
        vnp_BankCode = inputData['vnp_BankCode']
        vnp_CardType = inputData['vnp_CardType']

        if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
            # Check & Update Order Status in your Database
            # Your code here
            firstTimeUpdate = True
            totalamount = True
            if totalamount:
                if firstTimeUpdate:
                    if vnp_ResponseCode == '00':
                        print('Payment Success. Your code implement here')
                    else:
                        print('Payment Error. Your code implement here')

                    # Return VNPAY: Merchant update success
                    result = JsonResponse({'RspCode': '00', 'Message': 'Confirm Success'})
                else:
                    # Already Update
                    result = JsonResponse({'RspCode': '02', 'Message': 'Order Already Update'})
            else:
                # invalid amount
                result = JsonResponse({'RspCode': '04', 'Message': 'invalid amount'})
        else:
            # Invalid Signature
            result = JsonResponse({'RspCode': '97', 'Message': 'Invalid Signature'})
    else:
        result = JsonResponse({'RspCode': '99', 'Message': 'Invalid request'})

    return result

from django.urls import reverse
def payment_return(request):
    inputData = request.GET
    if inputData:
        vnp = vnpay()
        vnp.responseData = inputData.dict()
        order_id = inputData['vnp_TxnRef']
        amount = int(inputData['vnp_Amount']) / 100
        order_desc = inputData['vnp_OrderInfo']
        vnp_TransactionNo = inputData['vnp_TransactionNo']
        vnp_ResponseCode = inputData['vnp_ResponseCode']
        vnp_TmnCode = inputData['vnp_TmnCode']
        vnp_PayDate = inputData['vnp_PayDate']
        vnp_BankCode = inputData['vnp_BankCode']
        vnp_CardType = inputData['vnp_CardType']
        #them vnpayment
        payment = Payment_VNPay.objects.create(
            order_id=order_id,
            amount=amount,
            order_desc=order_desc,
            vnp_TransactionNo=vnp_TransactionNo,
            vnp_ResponseCode=vnp_ResponseCode
        )
        if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
            if vnp_ResponseCode == "00":
                    success = True
                    return render(request,'cart.html', {'success': success})
                # return render(request, "payment/payment_return.html", {"title": "Kết quả thanh toán",
                #                                                "result": "Thành công", "order_id": order_id,
                #                                                "amount": amount,
                #                                                "order_desc": order_desc,
                #                                                "vnp_TransactionNo": vnp_TransactionNo,
                #                                                "vnp_ResponseCode": vnp_ResponseCode})
            else:
                return render(request, "payment/payment_return.html", {"title": "Kết quả thanh toán",
                                                               "result": "Lỗi", "order_id": order_id,
                                                               "amount": amount,
                                                               "order_desc": order_desc,
                                                               "vnp_TransactionNo": vnp_TransactionNo,
                                                               "vnp_ResponseCode": vnp_ResponseCode})
        else:
            return render(request, "payment/payment_return.html",
                          {"title": "Kết quả thanh toán", "result": "Lỗi", "order_id": order_id, "amount": amount,
                           "order_desc": order_desc, "vnp_TransactionNo": vnp_TransactionNo,
                           "vnp_ResponseCode": vnp_ResponseCode, "msg": "Sai checksum"})
    else:
        return render(request, "payment/payment_return.html", {"title": "Kết quả thanh toán", "result": ""})


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip

n = random.randint(10**11, 10**12 - 1)
n_str = str(n)
while len(n_str) < 12:
    n_str = '0' + n_str


def query(request):
    if request.method == 'GET':
        return render(request, "payment/query.html", {"title": "Kiểm tra kết quả giao dịch"})

    url = settings.VNPAY_API_URL
    secret_key = settings.VNPAY_HASH_SECRET_KEY
    vnp_TmnCode = settings.VNPAY_TMN_CODE
    vnp_Version = '2.1.0'

    vnp_RequestId = n_str
    vnp_Command = 'querydr'
    vnp_TxnRef = request.POST['order_id']
    vnp_OrderInfo = 'kiem tra gd'
    vnp_TransactionDate = request.POST['trans_date']
    vnp_CreateDate = datetime.now().strftime('%Y%m%d%H%M%S')
    vnp_IpAddr = get_client_ip(request)

    hash_data = "|".join([
        vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode,
        vnp_TxnRef, vnp_TransactionDate, vnp_CreateDate,
        vnp_IpAddr, vnp_OrderInfo
    ])

    secure_hash = hmac.new(secret_key.encode(), hash_data.encode(), hashlib.sha512).hexdigest()

    data = {
        "vnp_RequestId": vnp_RequestId,
        "vnp_TmnCode": vnp_TmnCode,
        "vnp_Command": vnp_Command,
        "vnp_TxnRef": vnp_TxnRef,
        "vnp_OrderInfo": vnp_OrderInfo,
        "vnp_TransactionDate": vnp_TransactionDate,
        "vnp_CreateDate": vnp_CreateDate,
        "vnp_IpAddr": vnp_IpAddr,
        "vnp_Version": vnp_Version,
        "vnp_SecureHash": secure_hash
    }

    headers = {"Content-Type": "application/json"}

    response = requests.post(url, headers=headers, data=json.dumps(data))

    if response.status_code == 200:
        response_json = json.loads(response.text)
    else:
        response_json = {"error": f"Request failed with status code: {response.status_code}"}

    return render(request, "payment/query.html", {"title": "Kiểm tra kết quả giao dịch", "response_json": response_json})

def refund(request):
    if request.method == 'GET':
        return render(request, "payment/refund.html", {"title": "Hoàn tiền giao dịch"})

    url = settings.VNPAY_API_URL
    secret_key = settings.VNPAY_HASH_SECRET_KEY
    vnp_TmnCode = settings.VNPAY_TMN_CODE
    vnp_RequestId = n_str
    vnp_Version = '2.1.0'
    vnp_Command = 'refund'
    vnp_TransactionType = request.POST['TransactionType']
    vnp_TxnRef = request.POST['order_id']
    vnp_Amount = request.POST['amount']
    vnp_OrderInfo = request.POST['order_desc']
    vnp_TransactionNo = '0'
    vnp_TransactionDate = request.POST['trans_date']
    vnp_CreateDate = datetime.now().strftime('%Y%m%d%H%M%S')
    vnp_CreateBy = 'user01'
    vnp_IpAddr = get_client_ip(request)

    hash_data = "|".join([
        vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode, vnp_TransactionType, vnp_TxnRef,
        vnp_Amount, vnp_TransactionNo, vnp_TransactionDate, vnp_CreateBy, vnp_CreateDate,
        vnp_IpAddr, vnp_OrderInfo
    ])

    secure_hash = hmac.new(secret_key.encode(), hash_data.encode(), hashlib.sha512).hexdigest()

    data = {
        "vnp_RequestId": vnp_RequestId,
        "vnp_TmnCode": vnp_TmnCode,
        "vnp_Command": vnp_Command,
        "vnp_TxnRef": vnp_TxnRef,
        "vnp_Amount": vnp_Amount,
        "vnp_OrderInfo": vnp_OrderInfo,
        "vnp_TransactionDate": vnp_TransactionDate,
        "vnp_CreateDate": vnp_CreateDate,
        "vnp_IpAddr": vnp_IpAddr,
        "vnp_TransactionType": vnp_TransactionType,
        "vnp_TransactionNo": vnp_TransactionNo,
        "vnp_CreateBy": vnp_CreateBy,
        "vnp_Version": vnp_Version,
        "vnp_SecureHash": secure_hash
    }

    headers = {"Content-Type": "application/json"}

    response = requests.post(url, headers=headers, data=json.dumps(data))

    if response.status_code == 200:
        response_json = json.loads(response.text)
    else:
        response_json = {"error": f"Request failed with status code: {response.status_code}"}

    return render(request, "payment/refund.html", {"title": "Kết quả hoàn tiền giao dịch", "response_json": response_json})


# payment management
def payment_management(request):
    payments = Payment_VNPay.objects.all()
    return render(request, "admin/payment/index.html", context={"payments": payments})

### Discount
def discount_view(request):
    discounts = Discount.objects.all()
    return render(request, "admin/discount/index.html",context={"discounts": discounts})

class CreateDiscountView(View):
    def get(self, request):
        title = "Add discount"
        return render(request, "admin/discount/create.html", {'title': title})
    def post(self, request):
        code = request.POST.get('code', '')
        discount_value = request.POST.get('discount_value', '')
        quantity = request.POST.get('quantity', 0)
        Discount.objects.create(code=code, discount_value=discount_value, quantity=quantity)
        return redirect('discount.management')
class EditDiscountView(View):
    def get(self, request, discount_id):
        title = "Edit discount"
        discount = Discount.objects.get(id=discount_id)
        return render(request, "admin/discount/edit.html", {'title': title, 'discount': discount})
    def post(self, request, discount_id):
        discount = Discount.objects.get(id=discount_id)
        discount_code = request.POST.get('code', '')
        discount_value = request.POST.get('discount_value', '')
        quantity = request.POST.get('quantity', '')
        #update
        discount.code = discount_code
        discount.discount_value = discount_value
        discount.quantity = quantity
        discount.save()
        return redirect('discount.management')
        pass
def delete_discount(request, discount_id):
    try:
        discount = Discount.objects.get(id=discount_id)
        discount.delete()
        return JsonResponse({'message': 'Discount deleted successfully'})
    except Discount.DoesNotExist:
        return JsonResponse({'error': 'Discount not found'}, status=404)


def view_voucher(request):
    return render(request, 'voucher.html')




def check_discount(request):
    if request.method == 'POST' and 'discount' in request.POST:
        discount_code = request.POST['discount']
        try:
            discount = Discount.objects.get(code=discount_code)  
            json_response = {
                'discount_value': discount.discount_value / 100,
                'message': 'Discount successfully'
            }
            return JsonResponse(json_response, safe=False) 
        except Discount.DoesNotExist:
            return JsonResponse({'error': 'Mã giảm giá không hợp lệ'}, status=400)
        
@login_required
def order_details(request, order_id):
    user = request.user
    order_items = OrderItem.objects.filter(order_id=order_id)
    total_amount = sum(item.price * item.quantity for item in order_items)
    formatted_total_amount = '{:,.3f}'.format(total_amount)
    return render(request, 'order_detail.html',context={'order_items':order_items, 'total_amount':formatted_total_amount})

### STATSTICS ###
def statistics_view(request):
    stats = Order.objects.filter(status="Completed") 
    top_5_best_selling_products = OrderItem.get_top_5_best_selling_products()
    user_bought_hight = OrderItem.get_top_buying_user()
    return render(request, 'admin/statistics/index.html', context={
                                                            'stats': stats,
                                                            'top_5_best_selling_products': top_5_best_selling_products,
                                                            'user_bought_hight': user_bought_hight,
                                                            })

## Product STATSTICS
def statistics_product_by_day(request):
    statistics_product = OrderItem.get_product_sales_by_day()
    statistics_product_str = {str(key): value for key, value in statistics_product.items()}
    return JsonResponse(statistics_product_str, safe=False)

def statistics_product_by_month(request):
    statistics_product = OrderItem.get_product_sales_by_month()
    return JsonResponse(statistics_product, safe=False)

def statistics_product_by_year(request):
    statistics_product = OrderItem.get_product_sales_by_year()
    return JsonResponse(statistics_product, safe=False)

### Revenue STATSTICS
def statistics_revenue_by_day(request):
    statistics_revenue = OrderItem.get_daily_revenue_by_day()
    return JsonResponse(statistics_revenue, safe=False)

def statistics_revenue_by_month(request):
    statistics_revenue = OrderItem.get_daily_revenue_by_month()
    return JsonResponse(statistics_revenue, safe=False)

def statistics_revenue_by_year(request):
    statistics_revenue = OrderItem.get_daily_revenue_by_year()
    return JsonResponse(statistics_revenue, safe=False)

def get_top_5_best_selling_products(request):
    user_bought_hight = OrderItem.get_top_buying_user()
    return JsonResponse(user_bought_hight, safe=False)

## 
def view_attribute(request):
    title = "Attribute"
    attributes = Attribute.objects.all()
    return render(request, 'admin/attribute/index.html', {'title': title, 'attributes': attributes})
class CreateAttributeView(View):
    def get(self, request):
        title = "Thêm thuộc tính"
        categories = Category.objects.all()
        return render(request, "admin/attribute/create.html", {'title': title, 'categories': categories})
    def post(self, request):
        category_id = request.POST.get('category_id', 0)
        category = Category.objects.get(id=category_id)
        att_name = request.POST.get('att_name', '')
        attribute = Attribute.objects.create(att_name=att_name, category=category)
        return redirect('attribute.management')
    
class EditAttributeView(View):
    def get(self, request, attribute_id):
        title = "Edit properties"
        attribute = Attribute.objects.get(id=attribute_id)
        categories = Category.objects.all()
        return render(request, "admin/attribute/edit.html", {'title': title, 'attribute': attribute, 'categories': categories})
    
    def post(self, request, attribute_id):
        attribute = Attribute.objects.get(id=attribute_id)
        category_id = request.POST.get('category_id', 0)
        category = Category.objects.get(id=category_id)
        att_name = request.POST.get('att_name', '')
        attribute.att_name = att_name
        attribute.category = category
        attribute.save()
        messages.success(request, 'Cập nhật thuộc tính thành công!')
        return redirect('attribute.management')

def delete_attribute(request, attribute_id):
    try:
        attribute = Attribute.objects.get(id=attribute_id)
        attribute.delete()
        return JsonResponse({'message': 'Attribute deleted successfully'})
    except Attribute.DoesNotExist:
        return JsonResponse({'error': 'Attribute not found'}, status=404)
    
class CreateProductAttributeView(View):
    def get(self, request, product_id):
        title = "Add product attributes"
        product = Product.objects.get(id=product_id)
        attributes = Attribute.objects.filter(category=product.category)
        product_attributes = ProductAttribute.objects.filter(product=product)
        
        # Create a dictionary to hold existing attribute values
        existing_values = {pa.attribute.id: pa.value for pa in product_attributes}
        
        return render(request, "admin/product_attribute/create.html", {
            'title': title,
            'product': product,
            'attributes': attributes,
            'existing_values': existing_values,
        })

    def post(self, request, product_id):
        product = get_object_or_404(Product, id=product_id) 
        attributes = Attribute.objects.filter(category=product.category)

        for attribute in attributes:
            value = request.POST.get('attribute_values[{}]'.format(attribute.id))
            if value:
                ProductAttribute.objects.create(product=product, attribute=attribute, value=value)

        return redirect('product.index')
    
@login_required
def clear_cart(request):
    user = request.user 
    CartItem.objects.filter(user=user).delete()
    return redirect('cart')


@login_required
def delete_wishlist(request):
    if request.method == 'POST':
        user = request.user 
        wishlist_id = request.POST.get('wishlist_id')
        wishlist = get_object_or_404(WishlistItem, pk=wishlist_id)
        if wishlist:
            wishlist.delete()
            return JsonResponse({'status':'success','message': 'Sản phẩm đã được xóa khỏi danh sách yêu thích.'})
        else:
            return JsonResponse({'status': 'error','message': 'Sản phẩm không tồn tại.'}, status=400)
    else:
        return JsonResponse({'status': 'error','message': 'Invalid request method.'}, status=400)
    

@login_required
def add_wishlist(request):
    if request.method == 'POST':
        product_id = request.POST.get('product_id')
        product = get_object_or_404(Product, id=product_id)
        user = request.user
        
        wishlist, created = WishlistItem.objects.get_or_create(user=user, product=product)
        if created:
            return JsonResponse({'status': 'success', 'message': 'Sản phẩm đã được thêm vào danh sách yêu thích.'})
        else:
            return JsonResponse({'status': 'success', 'message': 'Sản phẩm đã được thêm vào trước đó.'})
    else:
        return JsonResponse({'status': 'error', 'message': 'Invalid request method.'}, status=400)
import asyncio
import aiohttp
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def classify_demo(request):
    if request.method == 'POST':
        message = request.POST.get('message', 'No message provided')
        return JsonResponse({'classify_content': 'Bad', 'message_received': message})
    else:
        return JsonResponse({'error': 'Method not allowed'}, status=405)


async def fetch_classification(comment):
    url = 'http://127.0.0.1:8888/predict'
    async with aiohttp.ClientSession() as session:
        async with session.post(url, json={"comment": comment}) as response:
            if response.status == 200:
                return await response.json()
            else:
                return {'error': f'Request failed with status {response.status}, response: {await response.text()}'}
def handle_classification(classification):
    label_map = {0: "positive", 1: "negative", 2: "neutral"}
    dataRes = label_map.get(classification, "neutral")
    return dataRes
@login_required
def rating_product(request):
    if request.method == 'POST':
        user = request.user
        product_id = request.POST.get('product_id')
        rating_value = request.POST.get('rating_value')
        comment = request.POST.get('comment')

        # check to user has reviewed yet
        if ProductRating.objects.filter(author=user, product_id=product_id).exists():
            return JsonResponse({'status': 'error', 'message': 'Bạn đã đánh giá sản phẩm này trước đó.'})

        # check to user has purchased yet
        user_orders = Order.objects.filter(user=user)
        for order in user_orders:
            if order.orderitem_set.filter(product_id=product_id).exists():
                product_rating = ProductRating.objects.create(
                    author=user,
                    product_id=product_id,
                    rating_value=rating_value,
                    comment=comment,
                )

                # Call fastAPI to classify hehe
                NO_CLASSIFICATION_FOUND = "No classification found"
                classification_response = asyncio.run(fetch_classification(product_rating.comment))
                classify_content = classification_response.get('prediction', NO_CLASSIFICATION_FOUND)
                if classify_content != NO_CLASSIFICATION_FOUND:
                    classify = Classification.objects.create(
                        product_rating=product_rating,
                        classify=handle_classification(classify_content)
                    )
                    return JsonResponse({
                        'status': 'success',
                        'message': 'Đánh giá của bạn đã được ghi nhận.',
                        'classification': classify_content
                    })
                else:
                    return JsonResponse({'status': 'error', 'message': 'Phân loại comment thất bại.'})
        return JsonResponse({'status': 'error', 'message': 'Bạn chưa mua sản phẩm này.'})
    else:
        return JsonResponse({'status': 'error', 'message': 'Yêu cầu không hợp lệ.'}, status=400)

def apply_filters(request):
    if request.method == 'POST':
        product_status = request.POST.get('productStatus', '')
        min_price = request.POST.get('minPrice', '')
        max_price = request.POST.get('maxPrice', '')
        selected_attributes = {}
        for key, value in request.POST.items():
            if key != 'productStatus' and key != 'minPrice' and key != 'maxPrice':
                selected_attributes[key] = value
        queryset = Product.objects.all()
        
        if product_status:
            if product_status == 'quantity_in_stock':
                queryset = queryset.filter(stock_quantity__gte=0)
        if min_price:
            queryset = queryset.filter(price__gte=min_price)
        if max_price:
            queryset = queryset.filter(price__lte=max_price)
        for attribute, value in selected_attributes.items():
            if attribute != 'csrfmiddlewaretoken':
                    queryset = queryset.filter(productattribute__attribute__att_name=attribute, productattribute__value=value)
        products_data = [
            {
                'id': product.id,
                'name': product.name,
                'price': product.price,
                'description': product.description,
                'image': product.get_first_image().url if product.get_first_image() else '', 
                'detail_url': reverse('product.detail', args=[product.id]),
                'cart_store_url': reverse('cart.store', args=[product.id]),
            }
            for product in queryset
        ]
        return JsonResponse({'products': products_data})
    else:
        return JsonResponse({'error': 'Invalid request method.'}, status=400)
    
def product_by_category(request, category_id):
    category = get_object_or_404(Category, id=category_id)
    products = Product.objects.filter(category=category)

    products_data = [
        {
            'id': product.id,
            'name': product.name,
            'price': product.get_price(),
            'description': product.description,
            'image': product.get_first_image().url if product.get_first_image() else '', 
            'detail_url': reverse('product.detail', args=[product.id]),
            'cart_store_url': reverse('cart.store', args=[product.id]),
        }
        for product in products
    ]

    return JsonResponse({'products': products_data})





### TASKS ###
from .tasks import CleanupDiscountsTask

def some_view(request):
    # Các logic khác
    CleanupDiscountsTask.delay()

## Classify
def classify_view(request):
    classifies = Classification.objects.all()
    print(classifies)
    return render(request, 'admin/classify/index.html', context={'title': 'Classify view', 'classifies': classifies})