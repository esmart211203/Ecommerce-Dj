from django import template
from ..models import CartItem

register = template.Library()

@register.simple_tag(takes_context=True)
def get_cart_item_count(context):
    request = context['request']
    if request.user.is_authenticated:
        user = request.user
        cart_items = CartItem.objects.filter(user=user)
        count = sum(cart_item.quantity for cart_item in cart_items)
        return count
    return 0

@register.filter
def get_range(value):
    return range(value)

