function LogOut() {
    localStorage.setItem('customer', null);
    window.location.href = "/views/client/home.html";
}
