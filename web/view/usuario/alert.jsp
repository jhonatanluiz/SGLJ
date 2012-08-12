<%-- 
    Document   : alert
    Created on : 02/11/2011, 11:02:08
    Author     : jhonatan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<s:if test="%{action == 'cadastro'}" >
    <!--    cadastro de usuario sem sessão-->
    <s:if test="%{success == true && #session.user == null && newSign == true}">
        <div data-alert="alert" class="alert-message block-message success fade in">
            <a href="#" class="close">×</a>
            <p><strong>Cadastro realizado com sucesso!</strong> Click no botão "Entrar", para efetuar login no sistema.</p>
            <div class="alert-actions">
                <a href="#" id="btn_logar"class="btn small">Entrar</a>
            </div>
        </div>

        <script language="javascript" type="text/javascript">
            $(function(){
                $(".alert-message").alert();
                 
                $("#btn_logar").click(function(){
                    location.href = "${pageContext.request.contextPath}" ;
                });
                                
                document.getElementById("cadastro_usuario").reset()
            })
        </script>
    </s:if>
    <!--        cadastro de usuario com sessão aberta-->
    <s:elseif test="%{success == true && #session.user != null && newSign == true}" >
        <div id="response_message" class="alert-message success">
            <a class="close" href="#">×</a>
            <p><strong>Cadastro realizada com sucesso!</strong></p>
        </div>
        <script language="javascript" type="text/javascript">
            $(function(){
                $(".alert-message").alert();
                $("#response_message").fadeOut(3000)
                
                document.getElementById("cadastro_usuario").reset()
            });
        </script>
    </s:elseif> 

    <!--        alteração de um usuario-->
    <s:elseif test="%{success == true && #session.user != null && newSign == false}" >
        <div id="response_message" class="alert-message success">
            <a class="close" href="#">×</a>
            <p><strong>Alteração realizada com sucesso!</strong></p>
        </div>
        <script language="javascript" type="text/javascript">
            $(function(){
                $(".alert-message").alert();
                
                $("#response_message").fadeOut(3000)
                
            });
        </script>
    </s:elseif>  
    <s:elseif test="%{success == fase}" >
        <div class="alert-message error">
            <a href="#" class="close">×</a>
            <p><strong>Oi!</strong> Um erro inesperado ocorreu em sua solicitação, tente novamente mais tarde ou contacte o administrador.</p>
        </div>
        <script language="javascript" type="text/javascript">
            $(function(){
                $(".alert-message").alert();
            })
        </script>
    </s:elseif>    
</s:if>

<!--############################-->
<s:elseif test="%{action == 'delete'}" >
    <s:if test="%{success == true && log == true}" >
        <div class="alert-message success">
            <a class="close" href="#">×</a>
            <p><strong>Conta desativada com sucesso!</strong> Para reativá-la basta realizar login no sistema.</p>
        </div>
        <script language="javascript" type="text/javascript">
            $(function(){
                $(".alert-message").alert();
            
                $("*").unbind(); 
           
                $('body').fadeOut(5000, function(){                  
                    location.href = "${pageContext.request.contextPath}";
                });

  
    
            });
        </script>
    </s:if>

    <s:elseif test="%{success == true && log == false}">
        <div id="response_message" class="alert-message success">
            <a class="close" href="#">×</a>
            <p><strong>Conta desativada com sucesso!</strong> Conta do usuário selecionado foi desativado no sistema.</p>
        </div>
        <script language="javascript" type="text/javascript">
            $(function(){
                $(".alert-message").alert();
                
                $("*").unbind(); 
                $("#response_message").fadeOut(3000, function(){
                    location.href = "form";
                })
                
                
            })
        </script>
    </s:elseif>

    <s:elseif test="%{success == false}">
        <div class="alert-message error">
            <a href="#" class="close">×</a>
            <p><strong>Oi!</strong> Um erro inesperado ocorreu em sua solicitação, tente novamente mais tarde ou contacte o administrador.</p>
        </div>
        <script language="javascript" type="text/javascript">
            $(function(){
                $(".alert-message").alert();
            })
        </script>
    </s:elseif>
</s:elseif>

<s:if test="%{action == 'password'}" >
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
            })
        </script>

    </s:if>