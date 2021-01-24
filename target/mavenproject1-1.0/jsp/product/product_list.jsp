<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>

<div class="row">
    <c:forEach items="${products}" var="product">
        <div class="col-6 col-md-4 col-lg-3 mt-1 item pagingitem" style="text-align: center;">
            <a href="item_detail?itemid=8" style="text-decoration: none;">
                <img src="${pageContext.request.contextPath}/static/img/${product.images[0]}" width="100%">
                <p class="truncate itemname pl-3 mb-0" style="color:black;">${product.productName}</p>
                <b class="truncate pl-2" style="color:black;">
                    <span class="addsep">5699000</span>đ
                    -<span class="d-block d-sm-inline"><span class="addsep">6690000</span>đ</span>
                </b>
            </a>
        </div>
    </c:forEach>
</div>


<%@ include file = "/template/footer.jsp"%>
