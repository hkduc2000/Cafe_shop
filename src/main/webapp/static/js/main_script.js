

function addThousandSep() {
    var sp = document.getElementsByClassName('addsep');
    for (var i = 0; i < sp.length; i++) {
        sp[i].innerText = parseInt(sp[i].innerText).toLocaleString('en');
    }
}

function addThousandSep1() {
    var sp = document.getElementsByClassName('addsep1');
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
    cur_page = 1;
    $("#cur").text(cur_page);
    items.slice(size,items.length).hide();
    $("#total").text(Math.ceil(items.length / size));
    if (cur_page === Math.ceil(items.length / size)) {
        $('#next').addClass('disabled');
    } else {
        $('#next').removeClass('disabled');
    }
    if (cur_page === 1) {
        $('#prev').addClass('disabled');
    } else {
        $('#prev').removeClass('disabled');
    }
    if (cur_page === 1 && 1 >= Math.ceil(items.length / size)){
        $("#paginationControl").hide();
    } else {
        $("#paginationControl").show();
    }
}

function switchPage(state) {
    items.slice((cur_page-1)*size, Math.min(cur_page*size, items.length)).hide();
    cur_page = cur_page + state;
    $("#cur").text(cur_page);
    items.slice((cur_page-1)*size, Math.min(cur_page*size, items.length)).show();
    if (cur_page === Math.ceil(items.length / size)) {
        $('#next').addClass('disabled');
    } else {
        $('#next').removeClass('disabled');
    }
    if (cur_page === 1) {
        $('#prev').addClass('disabled');
    } else {
        $('#prev').removeClass('disabled');
    }
}