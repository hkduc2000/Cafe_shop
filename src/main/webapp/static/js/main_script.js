

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

var cur_page;
var items = [];
var size = 0;
var prev;
var next;
var lblcur;
var lbltotal;
var itemDisplay = "block";
var controller;

function pagingInit(){
    for (var i = size; i < items.length; i++) {
        items[i].style.display = "none";
    }
    lbltotal.innerHTML = Math.ceil(items.length / size);
    if (cur_page === Math.ceil(items.length / size)) {
        next.classList.add('disabled');
    } else {
        next.classList.remove('disabled');
    }
    if (cur_page === 1) {
        prev.classList.add('disabled');
    } else {
        prev.classList.remove('disabled');
    }
    if (cur_page === 1 && cur_page === Math.ceil(items.length / size)){
        controller.style.display = "none";
    }
}

function switchPage(state) {
    console.log(state)
    lblcur.innerHTML = parseInt(lblcur.innerHTML) + state;
    for (var j = (cur_page - 1) * size; (j < items.length) && (j < cur_page * size); j++) {
        items[j].style.display = "none";
    }
    cur_page = cur_page + state;
    for (var j = (cur_page - 1) * size; (j < items.length) && (j < cur_page * size); j++) {
        items[j].style.display = itemDisplay;
    }
    if (cur_page === Math.ceil(items.length / size)) {
        next.classList.add('disabled');
    } else {
        next.classList.remove('disabled');
    }
    if (cur_page === 1) {
        prev.classList.add('disabled');
    } else {
        prev.classList.remove('disabled');
    }
}