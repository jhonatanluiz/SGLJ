<%-- 
    Document   : message
    Created on : 06/12/2011, 21:36:51
    Author     : jhonatan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

    <s:if test="%{success == true}">
        <div id="response_message" class="alert-message success">
    </s:if>
    <s:else>
        <div id="response_message" class="alert-message error">
    </s:else>
            
    <a class="close" href="#">×</a>
    <p><s:property value="%{message}"/></p>
</div>
        
<script language="javascript" type="text/javascript">
    $(function(){
        $(".alert-message").alert(); 
                
        $("#response_message").fadeOut(3000);              
              
              
    
    });
</script>


