from django.urls import path,re_path
from . import views
from django.conf import settings
from django.conf.urls.static import static
from .templatetags import cart_tags

urlpatterns = [
    path("", views.index, name="index"),
    path("about", views.about_page, name="about"),
    path("contact", views.contact_page, name="contact"),
    path("gmaps", views.gmaps_page, name="gmaps"),
    path("shop", views.shop_view, name="shop.index"),
    path("shop-category/<int:category_id>", views.shop_category, name="shop.category"),
    path("search", views.search, name="search"),
    path("profile", views.profile, name="profile"),
    path("change-password", views.change_password, name="change-password"),
    #### CART & ORDER ####
    path("order", views.order_view, name="order.index"),
    path("order-detail/<int:order_id>", views.order_detail, name="order.detail"),
    path("order-completed/<int:order_id>", views.order_completed, name="order.completed"),
    path("delete-order/<int:order_id>", views.delete_order, name="order.delete"),
    path("cart", views.cart_view, name="cart"),
    path("add-to-cart/<int:product_id>", views.add_to_cart, name="cart.store"),
    path("add-to-cart/api/<int:product_id>", views.add_to_cart_api, name="cart.api.store"),
    path("delete-cart-item/<int:item_id>", views.delete_cart_item, name="cart.delete"),
    path("increase-quantity/<int:item_id>", views.increase_quantity, name="increase.quantity"),
    path("decrease-quantity/<int:item_id>", views.decrease_quantity, name="decrease.quantity"),
    path("check-out", views.checkout, name="checkout"),
    path("checkout-info", views.checkout_info, name="checkout-info"),
    path('cart-clear', views.clear_cart, name="cart.clear"),
    #### ADMIN ####
    path("view-admin", views.admin_view, name="admin"),
    ### CATEGORY ###
    path("category", views.category_view, name="category.index"),
    path("create-category", views.CreateCategoryView.as_view(), name="category.create"),
    path("delete-category/<int:category_id>", views.delete_category, name="category.delete"),
    path("edit-category/<int:category_id>", views.EditCategoryView.as_view(), name="category.edit"),


    ### PRODUCT ###
    path("product", views.product_view, name="product.index"),
    path("detail-product/<int:product_id>", views.detail_product, name="product.detail"),
    path("create-product", views.CreateProductView.as_view(), name="product.create"),
    path("delete-product/<int:product_id>", views.delete_product, name="product.delete"),
    path("edit-product/<int:product_id>", views.EditProductView.as_view(), name="product.edit"),
    ### ATTRIBUTE
    path('attribute', views.view_attribute, name="attribute.management"),
    path('create-attribute', views.CreateAttributeView.as_view(), name="attribute.create"),
    path('edit-attribute/<int:attribute_id>', views.EditAttributeView.as_view(), name="attribute.edit"),
    path('delete-attribute/<int:attribute_id>', views.delete_attribute, name="attribute.delete"),
    ### PRODUCT ATTRIBUTE
    path('product-attribute/<int:product_id>', views.CreateProductAttributeView.as_view(), name="product_attribute.create"),
    ## DISCOUNT ###
    path("discount", views.discount_view, name="discount.management"),
    path("create-discount", views.CreateDiscountView.as_view(), name="discount.create"),
    path("edit-discount/<int:discount_id>", views.EditDiscountView.as_view(), name="discount.edit"),
    path("delete-discount/<int:discount_id>", views.delete_discount, name="discount.delete"),
    ### USER ###
    path("user", views.user_view, name="user.index"),
    path("delete-user/<int:user_id>", views.delete_user, name="user.delete"),
    ### AUTH ###
    path("login", views.LoginView.as_view(), name="login"),
    path("register", views.RegisterView.as_view(), name="register"),
    path("logout", views.logout_user, name="logout"),
    
    ### em Trong Kotd ###
    path("update-profile", views.update_profile, name="user.update"),
    path("payment-manager", views.payment_management, name="payment.management"),
    path("voucher", views.view_voucher, name="voucher"),
    path("check_discount", views.check_discount, name="check_discount"),
    path("order-details/<int:order_id>", views.order_details, name="order.details"),
    ## VNPAY ##
        
    re_path(r'^payment-view$', views.payment_view, name="payment.view"),
    re_path(r'^payment$', views.payment, name='payment'),
    re_path(r'^payment_ipn$', views.payment_ipn, name='payment_ipn'),
    re_path(r'^payment_return$', views.payment_return, name='payment_return'),
    re_path(r'^query$', views.query, name='query'),
    re_path(r'^refund$', views.refund, name='refund'),


    ### STATISTICS ### 
    path("statistics", views.statistics_view, name="statistics.index"),
    path("statistics_product_day", views.statistics_product_by_day, name="statistics_product_day"),  
    path("statistics_product_month", views.statistics_product_by_month, name="statistics_product_month"), 
    path("statistics_product_year", views.statistics_product_by_year, name="statistics_product_year"), 
    path("statistics_revenue_day", views.statistics_revenue_by_day, name="statistics_revenue_day"),
    path("statistics_revenue_month", views.statistics_revenue_by_month, name="statistics_revenue_month"),
    path("statistics_revenue_year", views.statistics_revenue_by_year, name="statistics_revenue_year"),
    path("get_top_5_best_selling_products", views.get_top_5_best_selling_products, name="get_top_5_best_selling_products"),

    ## Wish List ##
    path('add/wish_list', views.add_wishlist, name="wishlist.add"),
    path("delete/wish_list", views.delete_wishlist, name="wishlist.delete"),
    ## Product ratings ##
    path('product/rating', views.rating_product, name="product.rating"),
    path('apply_filters', views.apply_filters, name="product.apply_filters"),
    path('product_category/<category_id>', views.product_by_category, name="product.category"),

    #classify
    path('classify', views.classify_view, name="classify.management"),
    path('classify1', views.classify_demo)

]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)