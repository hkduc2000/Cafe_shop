<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>
<h2 class="m-4" style="text-align: center;">Thực đơn ${categories[categoryID-1].categoryName}</h2>

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

<nav class="mt-4" id="paginationControl">
    <p style="text-align: center; margin-bottom: 0px">Trang 
        <span id="cur">1</span>/<span id="total"></span>
    </p>
    <ul class="pagination justify-content-center">
        <li class="page-item" style="cursor:pointer; user-select:none;" id="prev">
            <a class="page-link" onclick="switchPage(-1)">Prev</a>
        </li>
        <li class="page-item" style="cursor:pointer; user-select:none;" id="next">
            <a class="page-link" onclick="switchPage(1);">Next</a>
        </li>
    </ul>
</nav>

<script>
    addThousandSep();
    cur_page=1;
    items = document.getElementsByClassName("pagingitem");
    size = 8;
    prev = document.getElementById("prev");
    next = document.getElementById("next");
    lblcur = document.getElementById("cur");
    lbltotal = document.getElementById("total");
    controller = document.getElementById("paginationControl");
    pagingInit();
</script>
<%@ include file = "/template/footer.jsp"%>
