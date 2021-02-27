<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>

<ul class="nav nav-tabs" style="text-align:center;" role="tablist">
    <c:forEach var="i" begin="1" end="${steps.size()-1}">
        <li class="nav-item" style="display: inline;"> 
            <a class="nav-link ${i eq 1?"active":""}" data-toggle="tab" 
               href="#step${i}">${steps[i]}</a>
        </li>
    </c:forEach>
</ul>

<div class="tab-content">
    <c:forEach var="i" begin="1" end="${steps.size()-1}">
        <div id="step${i}" class="container tab-pane fade ${i eq 1?"active show":""}"><br>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Mã đơn hàng</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Thời gian đặt hàng</th>
                        <th scope="col">Sản phẩm</th>
                        <th scope="col">Tổng giá tiền</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${orders}" var="order">
                    <c:if test ="${order.stepID == i+1}">
                    <tr class="pagingitem showit">
                        <td class="align-middle" scope="col">
                            <form action="${pageContext.request.contextPath}/order/manage/detail" method="POST">
                                <input type="hidden" name="OrderID" value="${order.orderID}">
                                <input type="submit" style="border:none; background-color: transparent; color: #007bff;" value="${order.orderID}">
                            </form>
                        </td>
                        <td class="align-middle">${steps[order.stepID-1]}</td>
                        <td scope="col" class="align-middle"><fmt:formatDate 
                                pattern = "'Ngày' dd/MM/yyyy '<br>' 'Lúc' HH:mm " value="${order.createdDate}"/></td>
                        <td scope="col" class="align-middle">
                            <c:if test="${order.orderInf.size()>0}">
                                <c:forEach items="${order.orderInf}" var="inf">
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
                            <span class="addsep">${order.calcTotalPrice()}</span>đ
                        </td>
                        <td>
                            <c:if test="${order.stepID > 2}">
                                <form action="${pageContext.request.contextPath}/order/previous_step" method="POST" style="display: inline-block;">
                                    <input type="hidden" name="OrderID" value="${order.orderID}">
                                    <button type="submit" class="btn"
                                            style="background: #6f2a0cba; color: #fff;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
                                        </svg>
                                    </button>
                                </form>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${order.stepID < steps.size()}">
                                <form action="${pageContext.request.contextPath}/order/next_step" method="POST" style="display: inline-block;">
                                    <input type="hidden" name="OrderID" value="${order.orderID}">
                                    <button type="submit" class="btn"
                                            style="background: #6f2a0cba; color: #fff; ">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
                                        </svg>
                                    </button>
                                </form>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${order.stepID != steps.size()}">
                                <form action="${pageContext.request.contextPath}/order/cancel" method="POST">
                                    <input type="hidden" name="OrderID" value="${order.orderID}">
                                    <button type="submit" class="btn btn-danger">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                                            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                        </svg>
                                    </button>
                                </form>   
                            </c:if>
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:forEach>
</div>

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
    controller = document.getElementById('paginationControl');
    prev = document.getElementById('prev');
    next = document.getElementById('next');
    lblcur = document.getElementById('cur');
    lbltotal = document.getElementById('total');
    curtab = 2;
    size = 6;
    tabname = 'step';
    itemDisplay = 'table-row'
    switchTab(2);
</script>
<%@ include file = "/template/footer.jsp"%>