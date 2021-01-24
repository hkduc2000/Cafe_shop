<%-- 
    Document   : login_result
    Created on : Nov 6, 2020, 11:25:44 PM
    Author     : HKDUC
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "template/header.jsp"%>

<div class="modal hide fade" id="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">${requestScope.type} result</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>${requestScope.msg}</p>
            </div>
            <div class="modal-footer" style="text-align: center;">
                <a href="${pageContext.request.contextPath}" class="btn btn-primary">Trang chủ</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(window).on('load', function () {
        $('#myModal').modal('show');
    });
</script>
<%@ include file = "template/footer.jsp"%>