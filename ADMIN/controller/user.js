var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppAdmin',[]);

app.controller('UseController',function($http,$scope){
    $scope.listUser;
    $scope.loadUser = function(){
        $http({
            method:"GET",
            headers: { "Authorization": 'Bearer ' + _user.token },
            url : current_url +'/api/Users/get_all',
            dataType:"json"
        }).then(function(res){
            $scope.listUser = res.data;
        });
    };

    $scope.user ={
        "diachi":"hưng yên",
        "gioitinh":"nam",
        "email":"chien@gmail.com",
        "role":2,
        "token":"oke"
    };
    $scope.addUser = function(){
        $http({
            method:"POST",
            headers: { "Authorization": 'Bearer ' + _user.token },
            url : current_url +'/api/Users/create_user',
            data:$scope.user
        }).then(function(res){
            window.location.href = "http://127.0.0.1:5500/views/admin/user/user.html";
        });
    }












    const queryString = window.location.search;

    const urlParams = new URLSearchParams(queryString);

    const id = urlParams.get('id')
    $scope.userdetail;
    $scope.loaduserDetail = function(){
        $http({
            method:"GET",
            url:current_url+'/api/Users/get_bt_id/'+id,
            dataType:"json"
        }).then(function(res){
            $scope.userdetail = res.data;
            console.log($scope.userdetail);
        });
    };

    $scope.UpdateUser = function(){
        $http({
            method:"POST",
            url:current_url+"/api/Users/update_user",
            data:$scope.userdetail
        }).then(function(){
            window.location.href = "http://127.0.0.1:5500/views/admin/user/user.html";
        });
    }

    $scope.Delete = function($id){
        $http({
            method:"POST",
            url:current_url+"/api/Users/delete_user/"+$id,
            dataType:"json"
        }).then(function(){
            alert('xóa thành công');
            window.location.href = "http://127.0.0.1:5500/views/admin/user/user.html";
        });
    }
});