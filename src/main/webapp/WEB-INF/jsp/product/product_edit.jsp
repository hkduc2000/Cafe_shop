<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>
<form:form action="${pageContext.request.contextPath}/admin/product/edit" method="POST" 
           modelAttribute="product" enctype="multipart/form-data">
    <div class="row">
        <form:hidden path="ProductImage" value="${product.productImage}" />
        <form:hidden path="ProductID" value="${product.productID}"/>
        <div class="form-group col-12 col-md-7">
            <label>Tên sản phẩm</label>
            <form:input path="ProductName" cssClass="form-control"/>
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
        <label>Hình đại diện mới</label>
        <form:input type="file" path="ImageFile"/>
    </div>
    <div class="form-group">
        <label>Mô tả sản phẩm</label>
        <form:textarea cssClass="editable" path="Description"
                       cssStyle="min-height: 300px; width: 100%; border: 1px black solid; background-color:white;"/>
    </div>
    <div class="row">
        <div class="col-12 col-md-6">
            <c:forEach begin="0" end="${sizes.size()-1}" var="i">
                <div class="form-group">
                    <label>Nhập giá cho size ${sizes[i]}</label>
                    <form:input path="Sizes[${i}].price" cssClass="form-control mt-2" 
                                required="required" placeholder="Nhập giá cho size ${sizes[i]}"/>
                </div>
            </c:forEach>
        </div>
        <div class="col-12 col-md-6">
            <c:forEach begin="0" end="${sizes.size()-1}" var="i">
                <div class="form-group">
                    <label>Nhập số lượng sản phẩm size ${sizes[i]}:</label>
                    <form:input path="Sizes[${i}].quantity" cssClass="form-control mt-2" 
                                placeholder="Nhập số lượng sản phẩm size ${sizes[i]}" required="required"/>
                </div>
            </c:forEach>
        </div>
    </div>
    <button type="submit" class="btn btn-primary m-4">Chỉnh sửa sản phẩm</button>
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