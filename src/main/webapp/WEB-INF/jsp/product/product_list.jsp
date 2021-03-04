<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>

<div class="row">
    <c:forEach items="${products}" var="product">
        <div class="col-6 col-md-4 col-lg-3 mt-4 item pagingitem" style="text-align: center;">
            <a href="${pageContext.request.contextPath}/products/detail/${product.productID}" style="text-decoration: none;">
                <img class="rounded-circle" src="${pageContext.request.contextPath}/static/img/${product.productImage}" width="85%">
                <p class="truncate itemname pl-3 mb-0" style="color:black;">${product.productName}</p>
                <b class="truncate pl-2" style="color:black;">
                    <span class="addsep">${product.sizes[0].price}</span>đ
                    - <span class="d-block d-sm-inline"><span class="addsep">${product.sizes[product.sizes.size()-1].price}</span>đ</span>
                </b>
            </a>
        </div>
    </c:forEach>
</div>

<script>
    addThousandSep();
</script>
<%@ include file = "/template/footer.jsp"%>
