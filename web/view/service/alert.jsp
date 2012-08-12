<%-- 
    Document   : alert
    Created on : 05/11/2011, 00:46:01
    Author     : jhonatan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<s:if test="%{action == 'sign'}" >
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
                
                $("#id_servico").val("<s:property value="%{service.id}"/>");                
                $("#num_preco").priceFormat();
            });
        </script>

    </s:if>
    <s:elseif test="%{action == 'delete'}">
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
                
                    $("#id_servico").val("");                
                    $("#num_preco").val("");
                    $("#nom_servico").val("");
                    $("#des_servico").val("");                   
                    $("#excluir").remove();
                    
                });
            </script>
        </s:elseif>
