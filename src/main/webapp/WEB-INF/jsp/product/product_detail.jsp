<%-- 
    Document   : item_detail
    Created on : Nov 4, 2020, 2:23:51 PM
    Author     : HKDUC
--%>
<%@page import="model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>

<div class="row">
    <div class="col-12 col-md-9">
        <div class="row">
            <div class="carousel col-12 col-md-6">
                <img class="d-block w-100" src="${pageContext.request.contextPath}/static/img/${product.productImage}">
            </div>
            <div class="col-12 col-md-6 pl-3">
                <h3 class="mt-4">${product.productName}</h3>
                <div class="input-group mb-3 w-75">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputSize">Size</label>
                    </div>
                    <select class="custom-select" id="inputSize" onchange="updatePriceAndQuantity()">
                        <c:forEach var="i" begin="1" end="${sizes.size()}">
                            <option value="${i}">${sizes[i-1]}</option>
                        </c:forEach>
                    </select>
                </div>
                <small>Số lượng còn lại: <span id="quantity">0</span></small>
                <p>Giá: <span class="addsep" id="price">0</span>đ</p>
                <form action="add_to_cart" method="POST">
                    <input type="hidden" name="itemID" value="${1}">
                    <input type="hidden" name="size" id="size" value="S">
                    <div class="form-group row">
                        <label class="mr-3 ml-3">Số lượng:</label>
                        <input class="form-control col-4 col-sm-3 col-md-2" name="buyQuantity" id="buyQuantity"
                               type="number" value="1" onchange="updatePriceAndQuantity()">
                    </div>
                    <button type="submit" id="addToCart" class="btn btn-outline-success"> Thêm vào giỏ hàng
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                        <path fill-rule="evenodd" d="M8.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 .5-.5z"/>
                        </svg>
                    </button>
                </form>
            </div>
            <div class="p-4 col-12" id="descriptionArea">
            <h3>Thông tin sản phẩm</h3>
                ${product.description}
            </div>
        </div>
    </div>
    
    <div class="col-12 col-md-2 d-none d-md-block pt-2 " style="background: #fff8dd; margin-left: 6%;">
        <p style="text-align: center; font-size: 1.3rem;">Cà phê<br>bán chạy nhất</p>
        <div style="text-align: center;">
            <a href="item_detail?itemid=8" style="text-decoration: none;">
                <img src ="https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/PHIN-SUA-DA.png" width="100%">
                <p class="truncate itemname pl-3 mb-0" style="color:black;">Phin sữa đá</p>
                <b class="truncate pl-2" style="color:black;">
                    <span class="addsep">5699000</span>đ
                    -<span class="d-block d-sm-inline"><span class="addsep">6690000</span>đ</span>
                </b>
            </a>
        </div>
        <div style="text-align: center;">
            <a href="item_detail?itemid=8" style="text-decoration: none;">
                <img src ="https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/PHIN-SUA-DA.png" width="100%">
                <p class="truncate itemname pl-3 mb-0" style="color:black;">Phin sữa đá</p>
                <b class="truncate pl-2" style="color:black;">
                    <span class="addsep">5699000</span>đ
                    -<span class="d-block d-sm-inline"><span class="addsep">6690000</span>đ</span>
                </b>
            </a>
        </div>
        <div style="text-align: center;">
            <a href="item_detail?itemid=8" style="text-decoration: none;">
                <img src ="https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/PHIN-SUA-DA.png" width="100%">
                <p class="truncate itemname pl-3 mb-0" style="color:black;">Phin sữa đá</p>
                <b class="truncate pl-2" style="color:black;">
                    <span class="addsep">5699000</span>đ
                    -<span class="d-block d-sm-inline"><span class="addsep">6690000</span>đ</span>
                </b>
            </a>
        </div>
    </div>
</div>
<script>
    var prices = [0];
    var quantity = [0];
    <c:forEach items="${product.sizes}" var="size">
    prices.push(${size.price});
    quantity.push(${size.quantity});
    </c:forEach>
    function updatePriceAndQuantity() {
        var ind = document.getElementById('inputSize').value;
        document.getElementById('price').innerHTML = prices[ind];
        document.getElementById('quantity').innerHTML = quantity[ind];
        document.getElementById('size').value = ind;
        var buyQuantity = document.getElementById("buyQuantity").value;
        if (quantity[ind]<buyQuantity){
            document.getElementById('addToCart').disabled = true;
            document.getElementById('addToCart').innerHTML = "Hết hàng";
        } else {
            document.getElementById('addToCart').disabled = false;
            document.getElementById('addToCart').innerHTML = "Thêm vào giỏ hàng";
        }
    }
    updatePriceAndQuantity();
</script>
<%@ include file = "/template/footer.jsp"%>