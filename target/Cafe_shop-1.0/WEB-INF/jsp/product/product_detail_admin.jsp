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
                <a data-toggle="modal" data-target="#addModal" style=" cursor: pointer;">
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                    <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                </a>
                <a data-toggle="modal" data-target="#subtractModal" style=" cursor: pointer;">
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-dash-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                    <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                    </svg>
                </a>
                <p>Giá: <span class="addsep" id="price">0</span>đ</p>
                <form action="${pageContext.request.contextPath}/admin/product/edit/${product.productID}" method="GET" style="display: inline-block;">
                    <button type="submit" class="btn btn-outline-primary"> Chỉnh sửa sảm phẩm
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                        </svg>
                    </button>
                </form>
                <button data-toggle="modal" data-target="#confirmDelete" class="btn btn-outline-danger ml-2"> Xóa sảm phẩm
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                    </svg>
                </button>
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
            
<div class="modal hide fade" id="confirmDelete">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Bạn có chắc muốn xóa sản phẩm này</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>1. Sản phẩm sẽ không còn xuất hiện trong các order nữa, kể cả các order đã hoàn thành nữa</p>
                <p>2. Đồng thời sẽ xóa dữ liệu của sản phẩm trong kho hàng, hình ảnh</p>
            </div>
            <div class="modal-footer" style="text-align: center;">
                <form action="${pageContext.request.contextPath}/products/delete" method="POST">
                    <input type="hidden" name="ProductID" value="${product.productID}"/>
                    <input type="hidden" name="CategoryID" value="${product.categoryID}"/>
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </form>
                <button class="btn btn-secondary" data-dismiss="modal">Bỏ qua</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document">
        <div class="modal-content p-4">
            <h5 class="modal-title">Nhập số hàng cộng vào:</h5> <br>
            <form autocomplete="off" action="${pageContext.request.contextPath}/admin/goodreceipt" method="POST">
                <input type="text" class="form-control" name="num" placeholder="Nhập số hàng cộng thêm:">
                <input type="hidden" name="sign" value="1">
                <input type="hidden" name="size" value="">
                <input type="hidden" name="productid" value="${product.productID}">
                <div style="text-align: center;" class="mt-3">
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="subtractModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document">
        <div class="modal-content p-4">
            <h5 class="modal-title">Nhập số hàng cần trừ đi:</h5><br>
            <form autocomplete="off" action="${pageContext.request.contextPath}/admin/goodreceipt" method="POST">
                <input type="text" class="form-control" name="num" placeholder="Nhập số hàng trừ đi">
                <input type="hidden" name="sign" value="-1">
                <input type="hidden" name="size" value="">
                <input type="hidden" name="productid" value="${product.productID}">
                <div style="text-align: center;" class="mt-3">
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>
            </form>
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
        document.getElementsByName('size')[0].value = $('#inputSize option:selected').text();
        document.getElementsByName('size')[1].value = $('#inputSize option:selected').text();
        var ind = document.getElementById('inputSize').value;
        document.getElementById('price').innerHTML = prices[ind];
        document.getElementById('quantity').innerHTML = quantity[ind];
    }
    updatePriceAndQuantity();
</script>
<%@ include file = "/template/footer.jsp"%>