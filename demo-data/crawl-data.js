// site: https://order.thecoffeehouse.com/order
var a = $("#cate6 li,#cate15 li")
var rs = "";
var qr = "";
for (var i = 0; i < a.length; i++) {
    var url = a[i].querySelector("img").src;
    var ten = a[i].querySelector(".uk-link-reset").innerText;
    var des = a[i].querySelector(".uk-margin-remove.uk-text-meta").innerText;
    rs += ("downloadImage('" + url + "', '" + ten + "')\n");
    qr += ("INSERT INTO Product VALUES(N'" + ten + "',N'" + ten + ".jpg',N'" + des + "',5);\n");
}

console.log(rs);
console.log(qr);





