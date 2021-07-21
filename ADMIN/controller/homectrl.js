var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppAdmin',[]);
app.controller('homectrl',function($scope,$http){
    $scope.listCategory;
    $scope.loadCategory = function(){
      $http({
          method : 'GET',
          url : current_url +'/api/Category/get-all',
          dataType: "json",
          
        }).then(function mySuccess(response) {
            $scope.listCategory = response.data;
        }, function myError(response) {
            console.log('loix');
        });
    };
    $scope.listProductNew;
    $scope.loadListProductNew = function(){
        $http({
            method:"GET",
            url:current_url+"/api/Product/get-product-hot",
            dataType:"json",
        }).then(function mySuccess(res){
            $scope.listProductNew = res.data;
        },function myError(response) {
            console.log('loix');
        });
    };


    const queryString = window.location.search;

    const urlParams = new URLSearchParams(queryString);

    const id = urlParams.get('id')//3 dòng này để lấy id từ url 

    $scope.loadProductbyCategory = function(){
        $scope.product_category;
        $http({
            method:"GET",
            url:current_url+"/api/Category/get-product-by-category/"+id,
            dataType: "json",
        }).then(function(data){
          $scope.product_category = data.data;
        }, function errorCallback(response) {
            console.log('lỗi');
        });
    };
    
    $scope.loadProductDetail = function(){     
        $scope.Product_detail;  
        $http({
            method:"GET",
            url:current_url+"/api/Product/get_by_id/"+id,
            dataType:"json",
        }).then(function success(res){
            $scope.Product_detail = res.data;
        });
    }
    $scope.loadProductRelation = function(){
        $scope.productrelation;
        $http({
            method:"GET",
            url:current_url+"/api/Product/get_by_id/"+id,
            dataType:"json",
        }).then(function success(res){
            $scope.Product_detail = res.data;
            $http({
                method:"GET",
                url:current_url+"/api/Product/get_product_relationship/"+$scope.Product_detail.id+"/"+$scope.Product_detail.cate_id,
                dataType:"json"
            }).then(function mysucess(data){
                $scope.productrelation = data.data;
            })
        });
    }


    $scope.AddtoCart = function($id){
        $scope.Product_details;        
        $http({
            method:"GET",
            url:current_url+"/api/Product/get_by_id/"+$id,
            dataType:"json",
        }).then(function success(res){
            $scope.Product_details = res.data;
            var span = $(".addsuccess");
                        setTimeout(function () {
                            span.css('display','block');
                        }, 100);
                        setTimeout(function () {
                            span.css('display','none');
                        }, 2000);
            
        }).then(function mysucces(data){
            let product = {
                'id': $id,
                'image':$scope.Product_details.image,
                'price':$scope.Product_details.price,
                'name':$scope.Product_details.name,
                'quantity':1
            };
              if(localStorage.getItem('cart')==null){
                localStorage.setItem('cart','[]');
              }
              var data = JSON.parse(localStorage.getItem('cart'));
              let item = data.find(c=>c.id==$id);
              if(item){
                    item['quantity']=Number(item['quantity'])+1;
              }
              else{
                data.push(product);
              }
           //  
             localStorage.setItem('cart',JSON.stringify(data));
        });
    
    
    };
    $scope.loadcart = loadcart();
    function loadcart(){
        var cart = JSON.parse(localStorage.getItem('cart'));
        html='';
        var total = 0;
        if (cart) {
            for (let index = 0; index< cart.length; index++) {        
            html+='<tr>'
            html+='            <td style="text-align: center">'+Number(index+1)+'</td>'
            html+='           '
            html+='            <td class="text-center">         '             
            html+='                <h4>'+cart[index]['name']+'</h4>'
            html+='            </td>'
            html+='            <td class="cart_description">'
            html+='                <a href=""><img style="width:100px" src="/Admin/'+cart[index]['image']+'" alt=""></a>'
            html+='            </td>'
            html+='           '
            html+='            <td class="cart_price">'
            html+='                <p>'+cart[index]['price'].toLocaleString('it-IT', {style : 'currency', currency : 'VND'});+'</p>'
            html+='            </td>'
            html+='            <td class="cart_quantity">'
            html+='                <div class="cart_quantity_button">'
            html+='                    <input class="cart_quantity_input quantity_cart" type="number" min="1" name="quantity" value="'+cart[index]['quantity']+'" size="2">'
            html+='                    <input type="hidden" name="product_id" class="product_id" value="1">'
            html+='                </div>'
            html+='            </td>'
            html+='            <td class="cart_total">'
            html+='                <p class="cart_total_price">'+Number(cart[index]['quantity']*cart[index]['price']).toLocaleString('it-IT', {style : 'currency', currency : 'VND'});+'</p>'
            html+='            </td>'
            html+='            <td class="">'
            html+='                <a  class="btn upadte_cart" data-url="http://localhost/Fashion_shop/cart/updatecart" data-id="'+cart[index]['id']+'" style="background-color: blue;color:white;border-radius:5px">Cập nhật</a>'
            html+='                <a  onclick="onDeleteProduct('+index+')" class="btn delete_cart" style="background-color: red;color:white">xóa</a>    '     
            html+='            </td>'
            html+='        </tr>   '
            total+=Number(cart[index]['quantity']*cart[index]['price']);
        }

            $('#table_container').html(html);
            $('#total_price').html(total.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}));
        }
        else{
            $('#table_container').html("không có sp nào");
        }
    };
    $('.upadte_cart').on('click',function(){
        var id = $(this).data('id');
        var quantity = $(this).parents('tr').find('input.quantity_cart').val();
        $data = JSON.parse(localStorage.getItem('cart'));
        let item = $data.find(c=>c.id==id);
        if(item){
            item['quantity']=quantity;          
        }
        localStorage.setItem('cart',JSON.stringify($data));
        location.reload();
    })

    $scope.checkout = checkout()
    function checkout(){
        var cart = JSON.parse(localStorage.getItem('cart'));
        var html='';
        var total = 0;
        if (cart) {
            for (let index = 0; index < cart.length; index++) {
                total+=Number(cart[index]['price']*cart[index]['quantity']);
                html+='<tr class="text-center">'
                html+='    <td><img style="width:100px" src="/Admin/'+cart[index]['image']+'" alt=""></td>'
                html+='    <td>'+cart[index]['name']+'</td>'
                html+='    <td>'+cart[index]['price']+'</td>'
                html+='    <td>'+cart[index]['quantity']+'</td>'
                html+='    <td>'+Number(cart[index]['price']*cart[index]['quantity']).toLocaleString('it-IT', {style : 'currency', currency : 'vnd'});+'</td>'
                html+='</tr>  '
            }
            $('#tbody').html(html);
            $('#total_price').html(total.toLocaleString('it-IT', {style : 'currency', currency : 'vnd'}));
        }
    }
    $scope.AddCartDetail = function($id){
        let quantity = $('.quantity').val();
        $scope.Product_details;        
        $http({
            method:"GET",
            url:current_url+"/api/Product/get_by_id/"+$id,
            dataType:"json",
        }).then(function success(res){
            $scope.Product_details = res.data;
            var span = $(".addsuccess");
                        setTimeout(function () {
                            span.css('display','block');
                        }, 100);
                        setTimeout(function () {
                            span.css('display','none');
                        }, 2000);
            
        }).then(function mysucces(data){
            let product = {
                'id': $id,
                'image':$scope.Product_details.image,
                'price':$scope.Product_details.price,
                'name':$scope.Product_details.name,
                'quantity':1
            };
              if(localStorage.getItem('cart')==null){
                localStorage.setItem('cart','[]');
              }
              var data = JSON.parse(localStorage.getItem('cart'));
              let item = data.find(c=>c.id==$id);
              if(item){
                    item['quantity']=Number(item['quantity'])+Number(quantity);
              }
              else{
                data.push(product);
              }
           //  
             localStorage.setItem('cart',JSON.stringify(data));
        });
    }
$('.checkout').on('click',function(){
    var customer = JSON.parse(localStorage.getItem('customer'));
    var cart = JSON.parse(localStorage.getItem('cart'));
    if (cart.length==0) {
        alert('hãy mua hàng trước khi thanh toán');
        window.location.href = "/views/client/home.html";
    }
    else{
    if (customer) {
        names = $('.name_customer').val();
        email=$('.email_customer').val();
        phone = $('.phone_customer').val();
        address = $('.address_customer').val();
        $scope.customer ={
            'name_customer':names,
            'email_customer':email,
            'phone_customer':phone,
            'address_customer':address,
            'id_customer':customer['customer_id'],
            'status':0
        }
        $http({
            method:"POST",
            url:current_url+"/api/Order/create_order",
            data:$scope.customer,     
        }).then(function success($data){
            $data = JSON.parse(localStorage.getItem('cart'));
            var list = [];
            for (let index = 0; index < $data.length; index++) {
                var product = {
                    'name_product':$data[index]['name'],
                    'quantity':$data[index]['quantity'],
                    'price':$data[index]['price'],
                    'total':$data[index]['quantity']*$data[index]['price'],
                    'image':$data[index]['image'],
                    'product_id':$data[index]['id']
                };
                list.push(product);
            };
            $http({
                method:"POST",
                url:current_url+"/api/Order/create_orderdetail",
                data:list,     
            })
            localStorage.setItem('cart','[]');
            alert('cám ơn bạn đã tin tưởng ủng hộ shop');
            window.location.href = "/views/client/home.html";
        })
    }
    else{
        window.location.href = "/views/client/login/loginCustomer.html";
    };
    }
})
});
function onDeleteProduct($id){
    $product = JSON.parse(localStorage.getItem('cart'));
    $product.splice($id,1);
    localStorage.setItem('cart',JSON.stringify($product));
    location.reload();
}
