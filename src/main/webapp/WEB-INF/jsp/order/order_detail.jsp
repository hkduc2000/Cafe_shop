<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>
<h4 class="ml-2">Mã đơn hàng #${order.orderID}</h4>
<h5 class="ml-2 d-inline">Đặt hàng vào: </h5><span style="color:#6f2a0cba;"><fmt:formatDate pattern = "'Ngày' dd/MM/yyyy - 'Lúc' HH:mm " 
                value="${order.createdDate}"/></span><br>
<h5 class="ml-2 d-inline">Trạng thái đơn hàng: </h5><span style="color: #6f2a0cba;">${steps[order.stepID-1]}</span>
<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Sản phẩm</th>
            <th scope="col">Size</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Giá</th>
            <th scope="col"></th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${order.orderInf.size()>0}">
            <c:forEach var="i" begin="0" end="${order.orderInf.size()-1}">
                <tr>
                    <td>${i+1}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/products/detail/${order.orderInf[i].productID}">
                            <img src="${pageContext.request.contextPath}/static/img/${order.orderInf[i].product.productImage}" width="50px" height="50px">
                            <span>${order.orderInf[i].product.productName}</span>
                        </a>
                    </td>
                    <td class="align-middle">${order.orderInf[i].size}</td>
                    <td name="quantity" class="align-middle">${order.orderInf[i].quantity}</td>
                    <td class="align-middle">
                        <span class="addsep" name="price">
                            ${order.orderInf[i].price}
                        </span>đ
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>Thành tiền</td>
            <td><span class="addsep" id="totalPrice">${order.calcTotalPrice()}</span>đ</td>
        </tr>
    </tbody>
</table>

<div class="row">
    <div class="table col-12 col-md-8 pl-5">
        <table>
            <thead>
                <tr>
                    <th colspan="2"  style="text-align: center;">Thông tin giao hàng</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Người nhận</td>
                    <td style="text-align: right;">${order.recipientName}</td>
                </tr>
                <tr>
                    <td>Địa chỉ giao hàng</td>
                    <td style="text-align: right;">${order.recipientAddress}</td>
                </tr>
                <tr>
                    <td>Số điện thoại người nhận</td>
                    <td style="text-align: right;">${order.recipientPhone}</td>
                </tr> 
            </tbody>
        </table>
    </div>
    <div class="col-12 col-md-4 pr-4 pt-5" style="text-align: right;">
        <br>
        <c:if test="${order.stepID <= 2}">
            <form action="${pageContext.request.contextPath}/order/cancel" method="POST">
                <input type="hidden" name="OrderID" value="${order.orderID}">
                <button type="submit" class="btn btn-danger mr-4 mb-2">Hủy đơn hàng</button>
            </form>   
        </c:if>
        <a href="order_list" class="btn btn-secondary mr-4">Quay lại</a>
    </div>
</div>
                
<script>
    addThousandSep();
</script>
<%@ include file = "/template/footer.jsp"%>