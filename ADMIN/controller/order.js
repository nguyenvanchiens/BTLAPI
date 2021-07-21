var app = angular.module('AppAdmin',[]);
app.controller("OrderCtrl",OrderCtrl);
OrderCtrl.$inject =['$scope','$http'];

function OrderCtrl($scope,$http){
    $scope.loadOrderunconfirm = loadOrderunconfirm();
    function loadOrderunconfirm(){
        $scope.order_uncomfirm;
        $http({
            method : 'GET',
            url : current_url +'/api/Order/get_list_order_unconfirm',
            dataType: "json",
        }).then(function success(data){
            $scope.order_uncomfirm = data.data;
            console.log($scope.order_uncomfirm);
        });
    }
    $scope.loadOrderSuccess = loadOrderSuccess();
    function loadOrderSuccess(){
        $scope.order_success;
        $http({
            method : 'GET',
            url : current_url +'/api/Order/get_list_order_success',
            dataType: "json",
        }).then(function success(data){
            $scope.order_success = data.data;
            console.log($scope.order_success);
        });
    }
    const queryString = window.location.search;

    const urlParams = new URLSearchParams(queryString);

    const id = urlParams.get('id')

    $scope.loadorderdetailbyid = loadorderdetailbyid();
    function loadorderdetailbyid(){
        $scope.orderdetail;
        $scope.total = 0;
        $scope.number = 0;
        $scope.totalprice = 0;
        $http({
            method:"GET",
            url:current_url+'/api/Order/get_orderdetail_by_id/'+id,
            dataType:'json',
        }).then(function success(data){
            $scope.orderdetail = data.data;
            for (let index = 0; index < $scope.orderdetail.length; index++) {
                $scope.total += $scope.orderdetail[index]['total'];
                $scope.number+=1;
            }
            console.log($scope.total);
            
        });
    }
    $scope.orderSucces = function($id){
        $http({
            method : 'GET',
            url : current_url +'/api/Order/update_order/'+$id,
            dataType: "json",    
        }).then(function mySuccess(response) {
          alert('xử lý thành công');
          window.location.href = "http://127.0.0.1:5500/views/admin/order/ordersuccess.html";
        }, function myError(response) {
          console.log('loix');
        })
    }

    $scope.loadOrderRevenue =loadOrderRevenue();
    function loadOrderRevenue(){
        $scope.orderRevenue;
        $http({
            method:"GET",
            url:current_url+"/api/Order/orderrevenue",
            dataType:'json'
        }).then(function success(data){
            $scope.orderRevenue = data.data;
            console.log(data.data);
        });
    }

    $scope.revenusfromdate = function(){
        var date_from = $('.date_from').val();
        var date_to = $('.date_to').val();
        $http({
            method:"GET",
            url:current_url+'/api/Order/revenues/'+date_from+'/'+date_to,
            dataType:'json'
        }).then(function success(data){
            $('.totalPrice').html('tổng doanh thu kiếm được:'+data.data.total.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}));
            $('.profit').html('lợi nhuận kiếm được:'+data.data.revenues.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}));
            console.log(data.data);
        });
    }
    $scope.revenusbyday = function(){
        $http({
            method:"GET",
            url:current_url+'/api/Order/get_revenues_by_date',
            dataType:'json'
        }).then(function success(data){
            $('.totalPrice').html('tổng doanh thu kiếm được:'+data.data.total.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}));
            $('.profit').html('lợi nhuận kiếm được:'+data.data.revenues.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}));
            console.log(data.data);
        });
    }
    $scope.revenusbymonth = function(){
        $http({
            method:"GET",
            url:current_url+'/api/Order/get_revenues_by_month',
            dataType:'json'
        }).then(function success(data){
            $('.totalPrice').html('tổng doanh thu kiếm được:'+data.data.total.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}));
            $('.profit').html('lợi nhuận kiếm được:'+data.data.revenues.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}));
            console.log(data.data);
        });
    }
    $scope.revenusbyyear = function(){
        $http({
            method:"GET",
            url:current_url+'/api/Order/get_revenues_by_year',
            dataType:'json'
        }).then(function success(data){
            $('.totalPrice').html('tổng doanh thu kiếm được:'+data.data.total.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}));
            $('.profit').html('lợi nhuận kiếm được:'+data.data.revenues.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}));
            console.log(data.data);
        });
    }
    
}

