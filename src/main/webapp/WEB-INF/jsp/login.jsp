<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>

<script type="text/javascript">
    $(window).on('load', function () {
        $('#loginModal').modal('show');
    });
</script>
<%@ include file = "/template/footer.jsp"%>