<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>
<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Mã đơn hàng</th>
            <th scope="col">Trạng thái</th>
            <th scope="col">Thời gian đặt hàng</th>
            <th scope="col">Sản phẩm</th>
            <th scope="col">Tổng giá tiền</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${orders.size()>0}">
            <c:forEach var="i" begin="0" end="${orders.size()-1}">
                <tr class="pagingitem showit">
                    <td scope="col" class="align-middle">${i+1}</td>
                    <td class="align-middle" scope="col">
                        <form action="${pageContext.request.contextPath}/order/detail" method="POST">
                            <input type="hidden" name="OrderID" value="${orders[i].orderID}">
                            <input type="submit" style="border:none; background-color: transparent; color: #007bff;" value="${orders[i].orderID}">
                        </form>
                    </td>
                    <td class="align-middle">${steps[orders[i].stepID-1]}</td>
                    <td scope="col" class="align-middle"><fmt:formatDate 
                            pattern = "'Ngày' dd/MM/yyyy - 'Lúc' HH:mm " value="${orders[i].createdDate}"/></td>
                    <td scope="col" class="align-middle">
                        <c:if test="${orders[i].orderInf.size()>0}">
                            <c:forEach items="${orders[i].orderInf}" var="inf">
                                <p class="m-0">
                                    ${inf.product.productName} - Size ${inf.size}
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                    ${inf.quantity}
                                </p>
                            </c:forEach>
                        </c:if>
                    </td>
                    <td scope="col" class="align-middle">
                        <span class="addsep">${orders[i].calcTotalPrice()}</span>đ
                    </td>
                </tr>
            </c:forEach>      
        </c:if>
    </tbody>
</table>
<nav class="mt-4" id="paginationControl">
    <p style="text-align: center; margin-bottom: 0px">Trang 
        <span id="cur">1</span>/<span id="total">10</span>
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
    size = 4;
    items = $('.pagingitem');
    pagingInit();
</script>
<%@ include file = "/template/footer.jsp"%>
