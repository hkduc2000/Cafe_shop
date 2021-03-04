<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>
<c:forEach begin="0" end="${categories.size()-1}" var="i">
    <div  style="background: #fff8dd; text-align: center;" class="p-2 mx-2 mt-2 mb-4 rounded">
        <h3 style="display: inline;" class="ml-2">${categories[i].categoryName}</h3>
        <div class="row">
            <c:forEach items="${bestSeller[i]}" var="product">
                <div class="col-6 col-md-4 col-lg-3 mt-1 item pagingitem" style="text-align: center;">
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
        <div style="width: 100%; text-align: right;" class="mt-4">
            <a href="${pageContext.request.contextPath}/products/list/${i+1}">Xem thêm</a>
        </div>
    </div>
</c:forEach>
<script>
    addThousandSep();
</script>
<%@ include file = "/template/footer.jsp"%>
<!--
<form action="start">
    <input type="number" name="v1">
    <input type="number" name="v2">
    <input type="submit">
</form>-->