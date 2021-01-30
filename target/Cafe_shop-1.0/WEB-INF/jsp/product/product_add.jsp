<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>
<form:form action="${pageContext.request.contextPath}/products/add" method="POST" 
           modelAttribute="product" enctype="multipart/form-data">
    <div class="row">
        <div class="form-group col-12 col-md-7">
            <label>Tên sản phẩm</label>
            <form:input path="ProductName" cssClass="form-control"/>
            <form:errors path="ProductName" style="color:red;"></form:errors>
            </div>
            <div class="form-group col-12 col-md-5">
                <label >Danh mục sản phẩm</label>
            <form:select cssClass="form-control" path="CategoryID">
                <c:forEach items="${categories}" var="ctg">
                    <form:option value="${ctg.categoryID}">${ctg.categoryName}</form:option>
                </c:forEach>
            </form:select>
        </div>
    </div>
    <div class="form-group">
        <label>Hình đại diện</label>
        <form:input type="file" path="ImageFile" required="required"/>
    </div>
    <div class="form-group">
        <label>Mô tả sản phẩm</label>
        <form:textarea cssClass="editable" path="Description"
                       cssStyle="min-height: 300px; width: 100%; border: 1px black solid; background-color:white;"/>
    </div>
    <div class="row">
        <div class="col-12 col-md-6">
            <c:forEach items="${sizes}" var="size">
                <div class="form-group">
                    <label>Nhập giá cho size ${size}</label>
                    <input type="text" name="price${size}" class="form-control mt-2" 
                           placeholder="Nhập giá cho size ${size}" required>
                </div>
            </c:forEach>
        </div>
        <div class="col-12 col-md-6">
            <c:forEach items="${sizes}" var="size">
                <div class="form-group">
                    <label>Nhập số lượng sản phẩm size ${size}:</label>
                    <input type="text" name="quantity${size}" class="form-control mt-2" 
                           placeholder="Nhập số lượng sản phẩm size ${size}" value="0" required>
                </div>
            </c:forEach>
        </div>
    </div>
    <button type="submit" class="btn btn-primary m-4">Thêm sản phẩm</button>
</form:form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/medium-editor/5.23.3/js/medium-editor.js"></script>
<script>
    var editor = new MediumEditor('.editable', {
        toolbar: {
            allowMultiParagraphSelection: true,
            buttons: ['bold', 'italic', 'underline', 'image', 'anchor', 'h2', 'h3'],
            buttonLabels: 'fontawesome',
        }
    });
</script>
<%@ include file = "/template/footer.jsp"%>