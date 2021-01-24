<%-- 
    Document   : drink_list.jsp
    Created on : Jan 12, 2021, 11:08:27 AM
    Author     : HKDUC
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "template/header.jsp"%>
<ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
        <a onclick="switchTab(1);" class="nav-link active" data-toggle="tab" href="#ctg1">
            Cà phê
        </a>
    </li>
    
    <li class="nav-item">
        <a onclick="switchTab(2);" class="nav-link " data-toggle="tab" href="#ctg2">
            Nước ép
        </a>
    </li>
    
    <li class="nav-item">
        <a onclick="switchTab(3);" class="nav-link " data-toggle="tab" href="#ctg3">
           Trà sữa
        </a>
    </li>
    
    <li class="nav-item">
        <a onclick="switchTab(4);" class="nav-link " data-toggle="tab" href="#ctg4">
            Trà
        </a>
    </li>
    
    <div class="form-inline ml-5 mb-1">
        <input class="form-control mr-2" id="searchingInput" style="width: 150px; display: inline-block;" 
                   type="search" placeholder="Tìm kiếm">
        <button class="btn btn-outline-success" onclick="searchItems();">Tìm kiếm
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
            <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
            </svg>
        </button>
    </div>
    
</ul>

<div class="tab-content">

    <div id="ctg1" class="container tab-pane fade active show"><br>
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
    <div id="ctg2" class="container tab-pane fade "><br>
        <div class="row">
            <div class="col-6  col-lg-3 mt-1 item pagingitem" style="text-align: center;">
                <a href="item_detail?itemid=1" style="text-decoration: none;">
                    <img src ="https://media.bizwebmedia.net/Sites/68297/data/upload/orange_juice.jpg" width="100%">
                    <p class="truncate itemname pl-3 mb-0" style="color:black;">Cam ép</p>
                    <b class="truncate pl-2" style="color:black;">
                        <span class="addsep">3799000</span>đ
                        -<span class="d-block d-sm-inline"><span class="addsep">5080000</span>đ</span>
                    </b>
                </a>
            </div>
        </div>
    </div>

    <div id="ctg3" class="container tab-pane fade "><br>
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

    <div id="ctg4" class="container tab-pane fade "><br>
        <div class="row">
            <div class="col-6  col-lg-3 mt-1 item pagingitem" style="text-align: center;">
                <a href="item_detail?itemid=18" style="text-decoration: none;">
                    <img src="https://congthucphache.com/wp-content/uploads/2019/12/tra-thach-dao.jpg" width="100%">
                    <p class="truncate itemname pl-3 mb-0" style="color:black;">Trà đào</p>
                    <b class="truncate pl-2" style="color:black;">
                        <span class="addsep">7800000</span>đ
                        -<span class="d-block d-sm-inline"><span class="addsep">10390000</span>đ</span>
                    </b>
                </a>
            </div>
        </div>
    </div>

</div>

<%@ include file = "template/footer.jsp"%>