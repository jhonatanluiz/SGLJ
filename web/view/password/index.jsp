<%-- 
    Document   : usuario
    Created on : 31/10/2011, 13:22:23
    Author     : jhonatan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <s:include value="../../layout/css.jsp" />
        <s:include value="../../layout/jquery.jsp" />                 
        <style type="text/css">
            <s:include value="/view/usuario/usuario.css" />
        </style>
        <title>SGLJ</title>
    </head>
    <body>


        <s:include value="../../layout/topbar.jsp" />


        <div class="container">
            <div class="content">
                <div class="page-header">
                    <h1><s:property value="%{titlePage}"/> <small></small></h1>
                </div>
                <div class="row">
                    <div class="span10" >  

                        <div class="tab-content">                            
                            <div id="cadastro" class="active">
                                <div id="alert_message">
                                </div>
                                <form id="cadastro_usuario" name="cadastro_usuario" action="account/send-email">                         
                                    <div class="clearfix">

                                        <!--                                        <div class="alert-message block-message success">-->
                                        <div class="messagem" style="margin-top : 20px; padding: 20px">
                                            Por favor, forneça seu CPF ou o endereço de email associado à sua conta do SGLJ.
                                            Um e-mail será enviado para o endereço de e-mail com informações sobre como alterar sua senha.
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <label for="cpf">Nº CPF</label>
                                        <div class="input">
                                            <input class="span5 required cpf disponivel_cpf" id="cpf_usuario" name="cpf_usuario" type="text" value="<s:property value="%{user.cpf.trim()}" />"/>
                                        </div>
                                    </div><!-- /clearfix -->
                                    <div class="clearfix">
                                        <label for="email">Email</label>
                                        <div class="input">
                                            <input class="span6 required email disponivel_email" id="email_usuario" name="email_usuario" type="text" value="<s:property value="%{user.email.trim()}"/>"/>
                                        </div>
                                    </div>
                                    <div class="actions">                                       
                                        <input type="button" id="submit_form" class="btn primary" value="Enviar">                                                                             
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>

            <div id="modal_desativar_conta" class="modal hide fade">
                <div class="modal-header">
                    <a href="#" class="close">&times;</a>
                    <h3><s:property value="%{#session.sistema}"/> - Desativação de conta</h3>
                </div>
                <div class="modal-body" id="message">
                    <p>Deseja realmente desativar essa conta?</p>
                </div>
                <div class="modal-footer">
                    <a href="#" id="btn_cancelar" class="btn secondary">Cancelar</a>          
                    <a href="#" id="btn_sim" class="btn primary">Sim</a>                       
                </div>
            </div>

            <footer>
                <p>&copy; Company 2011</p>
            </footer>

        </div> <!-- /container -->

    </body>

    <script language="javascript" type="text/javascript">
        <s:include value="/view/password/index.js"/>     
    </script>

</body>
</html>