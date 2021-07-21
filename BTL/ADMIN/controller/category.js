var app = angular.module('AppAdmin',[]);
app.controller("CategoryCtrl",CategoryCtrl);
CategoryCtrl.$inject =['$scope','$http'];

function CategoryCtrl($scope,$http,common){
  $scope.listCategory;
  $scope.pageSize = '10';
  $scope.page = '1';
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
  $scope.category = {};
  $scope.getslug=function(){
     $scope.categoryDetail.slug = getTitle($scope.categoryDetail.name);
  }
  
  $scope.AddCategory = function(){
    $http({
          method:"POST",
          url:current_url+"/api/Category/create-category",
          data:$scope.category,
          
      }).then(function(data){
        window.location.href = "http://127.0.0.1:5500/views/admin/category/category.html";
      }, function errorCallback(response) {
          console.log('lỗi');
      });
  };
  const queryString = window.location.search;

  const urlParams = new URLSearchParams(queryString);
  
  const id = urlParams.get('id')
  $scope.loadDetailCategory = function(){  
            $http({
                method : 'GET',
                url : current_url +'/api/Category/get_by_id/'+id,
                dataType: "json",
              
            }).then(function mySuccess(response) {
              $scope.categoryDetail = response.data;
              console.log( $scope.categoryDetail);
            }, function myError(response) {
              console.log('loix');
            });
        }

        $scope.UpdateCategory = function(){
          $http({
            method : 'POST',
            url : current_url +'/api/Category/update-category',
            data:$scope.categoryDetail,
          
        }).then(function mySuccess(response) {
          $scope.categoryDetail = response.data;
          window.location.href = "http://127.0.0.1:5500/views/admin/category/category.html";
        }, function myError(response) {
          console.log('loix');
        });
        };

        $scope.Delete = function($id){
          $http({
            method : 'POST',
            url : current_url +'/api/Category/delete-category/'+$id,
            dataType: "json",
          
        }).then(function mySuccess(response) {
          $scope.categoryDetail = response.data;
          window.location.href = "http://127.0.0.1:5500/views/admin/category/category.html";
        }, function myError(response) {
          console.log('loix');
        });
        };
}

