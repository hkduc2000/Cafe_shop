<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>

<div  style="background: #fff8dd; text-align: center;" class="p-2 mx-2 mt-2 mb-4 rounded">
    <h3>Cà phê bán chạy nhất</h3>
    <div class="row">
        <c:forEach items="${products}" var="product">
            <div class="col-6 col-md-4 col-lg-3 mt-1 item pagingitem" style="text-align: center;">
                <a href="item_detail?itemid=8" style="text-decoration: none;">
                    <img src="static/img/${product.images[0]}" width="100%">
                    <p class="truncate itemname pl-3 mb-0" style="color:black;">${product.productName}</p>
                    <b class="truncate pl-2" style="color:black;">
                        <span class="addsep">5699000</span>đ
                        -<span class="d-block d-sm-inline"><span class="addsep">6690000</span>đ</span>
                    </b>
                </a>
            </div>
        </c:forEach>

        <div class="col-6 col-lg-3 mt-1 item pagingitem" style="text-align: center;">
            <a href="item_detail?itemid=8" style="text-decoration: none;">
                <img src ="https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/PHIN-SUA-DA.png" width="100%">
                <p class="truncate itemname pl-3 mb-0" style="color:black;">Phin sữa đá</p>
                <b class="truncate pl-2" style="color:black;">
                    <span class="addsep">5699000</span>đ
                    -<span class="d-block d-sm-inline"><span class="addsep">6690000</span>đ</span>
                </b>
            </a>
        </div>
        <div class="col-6  col-lg-3 mt-1 item pagingitem" style="text-align: center;">
            <a href="item_detail?itemid=9" style="text-decoration: none;">
                <img src ="https://www.highlandscoffee.com.vn/vnt_upload/product/05_2018/CFD.png" width="100%">
                <p class="truncate itemname pl-3 mb-0" style="color:black;">Phin đen đá</p>
                <b class="truncate pl-2" style="color:black;">
                    <span class="addsep">5299000</span>đ
                    -<span class="d-block d-sm-inline"><span class="addsep">6490000</span>đ</span>
                </b>
            </a>
        </div>
    </div>
</div>

<div  style="background: #fff8dd; text-align: center;" class="p-2 m-2 mt-2 mb-4 rounded">
    <h3>Trà sữa bán chạy nhất</h3>
    <div class="row">
        <div class="col-6  col-lg-3 mt-1 item pagingitem" style="text-align: center;">
            <a href="item_detail?itemid=16" style="text-decoration: none;">


                <img src ="https://gongcha.com.vn/wp-content/uploads/2018/10/Hinh-Web-OKINAWA-TR%C3%80-S%E1%BB%AEA.png" width="100%">
                <p class="truncate itemname pl-3 mb-0" style="color:black;">Trà sữa nướng</p>
                <b class="truncate pl-2" style="color:black;">
                    <span class="addsep">2850000</span>đ
                    -<span class="d-block d-sm-inline"><span class="addsep">3690000</span>đ</span>
                </b>
            </a>
        </div>
    </div>
</div>

<%@ include file = "/template/footer.jsp"%>
<!--
<form action="start">
    <input type="number" name="v1">
    <input type="number" name="v2">
    <input type="submit">
</form>-->