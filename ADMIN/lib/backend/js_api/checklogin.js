
var user = JSON.parse(localStorage.getItem('user'));
if (user) {
    $('#user_name').text(user['hoten']);
    
}
else{
    window.location.href = "login.html";
}
