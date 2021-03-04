function addThousandSep() {
    var sp = document.getElementsByClassName('addsep');
    for (var i = 0; i < sp.length; i++) {
        sp[i].innerText = parseInt(sp[i].innerText).toLocaleString('en');
    }
}

function checkPassword(){
    if (document.getElementById("password1").value == document.getElementById("password2").value){
        return true;
    }
    document.getElementById("noti").innerHTML = "Mật khẩu chưa khớp";
    return false;
}