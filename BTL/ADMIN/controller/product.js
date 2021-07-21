var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppAdmin',[]);
app.controller("ProductCtrl",function($scope,$http){
    $scope.listProduct;
    $scope.listCategory;
    $scope.pageSize = '10';
    $scope.page = '1';
    $scope.name = '';
    $scope.search = function(){
      $scope.LoadProduct();
    };
    $scope.LoadProduct = function () {
        //var user = JSON.parse(localStorage.getItem("user"));
        $http({
              method : 'POST',
              headers: { "Authorization": 'Bearer ' + _user.token },
              data: { page: $scope.page, pageSize: $scope.pageSize,name:$scope.name },
              url : current_url +'/api/Product/search'              
          }).then(function mySuccess(response) {
            $scope.listProduct = response.data.data;
          }, function myError(response) {
            console.log('loix');
          });
    };
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
    function getTitle(input) {
      if (input == undefined || input == '')
          return '';
      //Đổi chữ hoa thành chữ thường
      var slug = input.toLowerCase();
  
      //Đổi ký tự có dấu thành không dấu
      slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
      slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
      slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
      slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
      slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
      slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
      slug = slug.replace(/đ/gi, 'd');
      //Xóa các ký tự đặt biệt
      slug = slug.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '');
      //Đổi khoảng trắng thành ký tự gạch ngang
      slug = slug.replace(/ /gi, "-");
      //Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
      //Phòng trường hợp người nhập vào quá nhiều ký tự trắng
      slug = slug.replace(/\-\-\-\-\-/gi, '-');
      slug = slug.replace(/\-\-\-\-/gi, '-');
      slug = slug.replace(/\-\-\-/gi, '-');
      slug = slug.replace(/\-\-/gi, '-');
      //Xóa các ký tự gạch ngang ở đầu và cuối
      slug = '@' + slug + '@';
      slug = slug.replace(/\@\-|\-\@|\@/gi, '');
  
      return slug;
  }
    
    $scope.getslug = function(){
      $scope.product.slug = getTitle($scope.product.name);
    }
    //get file input

    $scope.product = {
      'description':$('#description').text()
    };
    $scope.AddProduct = function(){    
      
      var file = document.getElementById('file').files[0];
      if (file) {
        const formData = new FormData();
        formData.append('file', file);
        $http({
          method: 'POST',
          headers: {
              "Authorization": 'Bearer ' + _user.token,
              'Content-Type': undefined
          },
          data: formData,
          url: current_url + '/api/Product/upload',
      }).then(function(res){
          $scope.product.image = res.data.filePath;
          $http({
            method:"POST",
            url:current_url+"/api/Product/create_product",
            data:$scope.product     
          }).then(function(){
               window.location.href = "http://127.0.0.1:5500/views/admin/product/product.html";
          });
        })
      }
      else{
        $http({
          method:"POST",
          url:current_url+"/api/Product/create_product",
          data:$scope.product,
        }).then(function(data){
             window.location.href = "http://127.0.0.1:5500/views/admin/product/product.html";
        }, function errorCallback(response) {
            console.log('lỗi');
        });
      }   
    };







    const queryString = window.location.search;

    const urlParams = new URLSearchParams(queryString);

    const id = urlParams.get('id')

   
    $scope.loadDetailProduct = function(){
        
        $http({
            method : 'GET',
            url : current_url +'/api/Product/get_by_id/'+id,
            dataType: "json",
            
        }).then(function mySuccess(response) {
          $scope.productDetail = response.data;
          console.log( $scope.productDetail);
        }, function myError(response) {
          console.log('loix');
        });
    }



    
    $scope.getslugedit = function(){
      $scope.productDetail.slug = getTitle($scope.productDetail.name);
    }
    $scope.productDetail = {      
    };
$scope.Updateproduct = function(){    
      
  var file = document.getElementById('file').files[0];
  if (file) {
    const formData = new FormData();
    formData.append('file', file);
    $http({
      method: 'POST',
      headers: {
          "Authorization": 'Bearer ' + _user.token,
          'Content-Type': undefined
      },
      data: formData,
      url: current_url + '/api/Product/upload',
  }).then(function(res){
      $scope.productDetail.image = res.data.filePath;
      $http({
        method:"POST",
        url:current_url+"/api/Product/update_product",
        data:$scope.productDetail,
      }).then(function(){
        window.location.href = "http://127.0.0.1:5500/views/admin/product/product.html";
      });
    })
  }
  else{
    $http({
      method:"POST",
      url:current_url+"/api/Product/update_product",
      data:$scope.productDetail,
    }).then(function(data){
         window.location.href = "http://127.0.0.1:5500/views/admin/product/product.html";
    }, function errorCallback(response) {
        console.log('lỗi');
    });
  }   
};





$scope.Delete = function($id){
  $http({
    method : 'POST',
    url : current_url +'/api/Product/delete_product/'+$id,
    dataType: "json",    
}).then(function mySuccess(response) {
  alert('đã xóa');
  window.location.href = "http://127.0.0.1:5500/views/admin/product/product.html";
}, function myError(response) {
  console.log('loix');
})
};

});

