// function downloadImg(imgUrl, imgName) {
//     var a = $("<a>")
//         .attr("href", imgUrl)
//         .attr("download", imgName+ ".png")
//         .appendTo("body");

//     a[0].click();
//     a.remove();
// }

// var a = $(".slick-track img")

// for (var i = 0; i < a.length; i++) {
//     downloadImg(a[i].src, a[i].alt);
// }

// var rs = "";
// for (var i = 0; i < a.length; i++) {
//     rs += ("INSERT INTO Product VALUES('"+ a[i].alt +"','" + a[i].alt + ".png','',2);\n");
// }
// console.log(rs);


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





