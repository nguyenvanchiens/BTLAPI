var html = '';

var customer = JSON.parse(localStorage.getItem('customer'));
if(customer){
    html+='<li><a href="http://localhost/Fashion_shop/login_checkout"><i class="fas fa-shopping-basket"></i>Thanh toán</a></li>'
    html+='<li><a href="/views/client/cart/cart.html"><i class="fa fa-shopping-cart"></i> Gió hàng</a></li>'
    html+='<li><a href="/views/client/cart/cart.html"><i class="fa-user"></i> '+customer['name']+'</a></li>'
    html+='<li><a href="javascript:LogOut();"><i class="fa fa-key"></i> Log Out</a></li>'
    $('#menu_top').html(html);
}
else{
    html+='<li><a href="http://localhost/Fashion_shop/login_checkout"><i class="fas fa-shopping-basket"></i>Thanh toán</a></li>'
    html+='<li><a href="/views/client/cart/cart.html"><i class="fa fa-shopping-cart"></i> Gió hàng</a></li>'
    html+='<li><a href="/views/client/login/loginCustomer.html"><i class="fa fa-lock"></i>Đăng nhập</a></li>'

    $('#menu_top').html(html);
}