<%@page import="java.util.Date"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>
<div class="row">
    <table class="table table-striped col-8">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Sản phẩm</th>
                <th scope="col">Size</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Kho</th>
                <th scope="col">Giá</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${cart.orderInf.size()>0}">
                <c:forEach var="i" begin="0" end="${cart.orderInf.size()-1}">
                    <tr>
                        <td>${i+1}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/products/detail/${cart.orderInf[i].productID}">
                                <img src="${pageContext.request.contextPath}/static/img/${cart.orderInf[i].product.productImage}" width="50px" height="50px">
                                <span>${cart.orderInf[i].product.productName}</span>
                            </a>
                        </td>
                        <td class="align-middle">${cart.orderInf[i].size}</td>
                        <td name="quantity" class="align-middle">${cart.orderInf[i].quantity}</td>
                        <c:set var="productinf"/>
                        <c:forEach items="${cart.orderInf[i].product.sizes}" var="s">
                            <c:if test="${s.size==cart.orderInf[i].size}">
                                <c:set var="productinf" value="${s}"/>
                            </c:if>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${productinf.quantity > cart.orderInf[i].quantity}">
                                <td class="align-middle">Còn hàng</td>
                            </c:when>
                            <c:otherwise>
                                <td>Hết hàng</td>
                            </c:otherwise>
                        </c:choose>
                        <td class="align-middle">
                            <span class="addsep" name="price">
                                ${productinf.price}
                            </span>đ
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Thành tiền</td>
                <td><span class="addsep" id="totalPrice"></span>đ</td>
            </tr>
        </tbody>
    </table>

    <form:form modelAttribute="cart" cssClass="w-50 mx-auto p-2 border border-warning rounded col-3" 
               action="checkout" method="POST">
        <h4>Thông tin người nhận</h4>
        
        
        <div class="form-group">
            <label>Tên người nhận: </label>
            <form:input cssClass="form-control" path="ReceipientName" value="${user.name}" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label>Địa chỉ người nhận: </label>
            <form:input class="form-control" path="ReceipientAddress" value="${user.address}" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label>Số điện thoại người nhận: </label>
            <form:input class="form-control" path="ReceipientPhone" value="${user.phone}" readonly="readonly"/>
        </div>
    </form:form>
</div>
<div style="text-align: center;">
    <a href="${pageContext.request.contextPath}/order/sessionScope.cart_view" class="btn btn-secondary">Quay lại giỏ hàng</a>
    <button form="sessionScope.cart" type="submit" class="btn btn-success ml-2">Hoàn tất đơn hàng</button>
</div>

<script>
    var p = document.getElementsByName('price');
    var q = document.getElementsByName('quantity');
    var sum = 0;
    for (var i = 0; i < p.length; i++) {
        var price = parseInt(p[i].innerText.replaceAll(',', ''));
        var quantity = parseInt(q[i].innerText);
        sum += (price * quantity);
    }
    document.getElementById('totalPrice').innerHTML = sum;
    if (sum == 0) {
        var btn = document.getElementById("checkOutBtn");
        btn.disabled = true;
        btn.getElementsByTagName('a')[0].removeAttribute('href')
    }
    addThousandSep();
</script>
<%@ include file = "/template/footer.jsp"%>