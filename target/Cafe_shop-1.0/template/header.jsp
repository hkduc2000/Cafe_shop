<%@page import="DAL.ProductDAO"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Coffee Shop</title>
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

    <!-- Medium Style Editor -->
    <script src="//cdn.jsdelivr.net/npm/medium-editor@latest/dist/js/medium-editor.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/medium-editor@latest/dist/css/medium-editor.min.css" type="text/css"
          media="screen" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main_style_sheet.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Fraunces:wght@600&family=Noto+Sans:wght@700&display=swap" rel="stylesheet">
    <% ArrayList<Category> categories = new ProductDAO().getCategories();
    request.setAttribute("categories", categories); %>
</head>
<body>
    <img style="width: 100%;" 
        src="https://www.highlandscoffee.com.vn/vnt_upload/weblink/HCO-7644-FESTIVE-2021-SOCIAL-WEB-BANNER.jpg">
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="${pageContext.request.contextPath}">Coffee Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16"><path fill-rule="evenodd" d="M1 2.75A.75.75 0 011.75 2h12.5a.75.75 0 110 1.5H1.75A.75.75 0 011 2.75zm0 5A.75.75 0 011.75 7h12.5a.75.75 0 110 1.5H1.75A.75.75 0 011 7.75zM1.75 12a.75.75 0 100 1.5h12.5a.75.75 0 100-1.5H1.75z"></path></svg></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Thực đơn
                    </a>
                    <div class="dropdown-menu" style="background: #53382c;"> 
                        
                        <c:forEach items="${categories}" var="category">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/products/list/${category.categoryID}">
                                ${category.categoryName}
                            </a>
                        </c:forEach>
                    </div>
                </li>
                <c:if test="${(sessionScope.user != null) && (sessionScope.role == 'user')}">
                    <li class="nav-item">
                        <a class="nav-link" href="order_list">Đơn hàng của tôi</a>
                    </li>
                </c:if>
                <c:if test="${(sessionScope.user != null) && (sessionScope.role == 'admin')}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Quản lí
                        </a>
                        <div class="dropdown-menu" style="background: #53382c;">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/products/add">
                                Thêm mặt hàng
                            </a>
                            <a class="dropdown-item" href="order_manage">Đơn hàng</a>
                        </div>
                    </li>
                </c:if>
<!--                <div class="searchBox">
                    <input type="text" placeholder="Search...">
                    <div class="search"></div>
                </div>-->
            </ul>
            <c:if test="${sessionScope.role == 'user'}">
                <a class="nav-item mr-3" href="cart" style="text-decoration: none;">
                    <i style="font-size:25px" >
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart4" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                        </svg>
                    </i>
                    <span id='lblCartCount' style="border-radius: 9px;">${cart.orderInfo.size()}</span>
                </a>
            </c:if>
            <c:choose>
                <c:when test="${sessionScope.user == null}">
                    <button class="btn btn-primary mr-sm-2 my-2 my-lg-0" data-toggle="modal" data-target="#loginModal"
                            style="background: #6f2a0cba; border: none;">
                        Đăng nhập
                    </button>
                    <button class="btn btn-primary mr-sm-5  my-2 my-lg-0" data-toggle="modal" data-target="#registerModal"
                            style="background: #6f2a0cba; border: none;">
                        Đăng kí
                    </button>
                </c:when>
                <c:otherwise>
                    <button class="nav-item btn btn-info mr-2" data-toggle="modal" data-target="#profileModal" style="background: #6f2a0cba; border: none;">
                        Chào ${sessionScope.user.name}
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
                        <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                        <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
                        </svg>
                    </button>
                    <a type="button" class="btn btn-secondary mr-2 ml-2" href="${pageContext.request.contextPath}/logout">
                        Đăng xuất
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
    <!-- Login -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" >
        <div class="modal-dialog" role="document">
            <div class="modal-content p-4">
                <h5 class="modal-title">Đăng nhập</h5> <br>
                <form action="${pageContext.request.contextPath}/login" method="POST">
                    <div class="form-group">
                        <label >Tên đăng nhập:</label>
                        <input type="text" class="form-control" name="username" placeholder="Nhập tên đăng nhập">
                    </div>
                    <div class="form-group">
                        <label >Mật khẩu:</label>
                        <input type="password" class="form-control" name="password" placeholder="Nhập mật khẩu">
                    </div>
                    <div style="text-align: center;">
                        <button type="submit" class="btn btn-primary">Đăng nhập</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Register -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content p-4">
                <h5 class="modal-title">Đăng kí</h5> <br>
                <form action="${pageContext.request.contextPath}/register" method="post">
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" class="form-control" name="email" placeholder="Nhập email" required>
                    </div>
                    <div class="form-group">
                        <label>Họ tên:</label>
                        <input type="text" class="form-control" name="name" placeholder="Nhập họ tên" required>
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại:</label>
                        <input type="phonenumber" class="form-control" name="phone" placeholder="Nhập số điện thoại" 
                               pattern="[0-9]{9,12}" required>
                    </div>
                    <div class="form-group">
                        <label >Địa chỉ:</label>
                        <input type="text" class="form-control" name="address" placeholder="Nhập địa chỉ" required>
                    </div>
                    <div class="form-group">
                        <label>Tên đăng nhập:</label>
                        <input type="text" class="form-control" name="username" placeholder="Nhập tên đăng nhập" required>
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu:</label>
                        <input type="password" class="form-control" name="password" placeholder="Nhập mật khẩu" required>
                    </div>
                    <div style="text-align: center;">
                        <button type="submit" class="btn btn-primary">Đăng kí</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!--Profile modal-->
    <div class="modal fade" id="profileModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thông tin cá nhân</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table>
                        <tr>
                            <td>Họ tên:</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Địa chỉ:</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Số điện thoại:</td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <a href="profile_edit" class="btn btn-info">Chỉnh sửa thông tin/Mật khẩu</a>
                    <a class="btn btn-secondary" data-dismiss="modal">Đóng</a>
                </div>
            </div>
        </div>
    </div>

    <div class="container pt-2" style="min-height: 70vh; padding-bottom: 300px;">

