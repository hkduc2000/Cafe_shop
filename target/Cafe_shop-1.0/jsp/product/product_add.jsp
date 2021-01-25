
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ include file = "template/header.jsp"%>--%>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="${pageContext.request.contextPath}/products/add" method="POST" enctype="multipart/form-data">
    <div class="form-group">
        <label>Tên sản phẩm</label>
        <input type="text" name="ProductName" class="form-control" required>
    </div>
    <div class="form-group">
        <label >Danh mục sản phẩm</label>
        <select class="form-control" name="CategoryID">
            <c:forEach items="${categories}" var="ctg">
                <option value="${ctg.categoryID}">${ctg.categoryName}</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-group">
        <label>Mô tả sản phẩm</label>
        <textarea class="editable" name="Description"
                  style="min-height: 300px; width: 100%; border: 1px black solid;" required>
        </textarea>
    </div>
    <div class="form-group">
        <label>Hình đại diện</label>
        <input type="file" name=ProductThubnail" accept="image/*" required>
    </div>
    <div class="form-group">
        <label>Hình ảnh sản phẩm</label>
        <input type="file" name="ProductImages" accept="image/*" multiple required> 
    </div>
    <div class="form-group">
        <label>Giá sản phẩm:</label>
        <c:forEach items="${sizes}" var="size">
            <input type="text" class="form-control mt-2" 
                   placeholder="Nhập giá cho size ${size}" required>
        </c:forEach>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<form:form modelAttribute="">

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