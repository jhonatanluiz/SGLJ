<%-- 
    Document   : topbar
    Created on : 31/10/2011, 09:37:32
    Author     : jhonatan
--%>

<%@page 
    contentType="text/html" pageEncoding="UTF-8"
    language="java"
    import="tcc.sglj.model.User, java.util.Map"

    %>
<%@taglib prefix="s" uri="/struts-tags"%>

<div class="topbar">
    <div class="fill">
        <div class="container">
            <a class="brand" href="#">Project name</a>

            <s:if test="%{#session.user == null}">
                <ul class="nav">
                    <li class="active"><a href="${pageContext.request.contextPath}/index">Home</a></li>
                    <li><a href="#about">Sobre</a></li>
                    <li><a href="#contact">Contato</a></li>
                </ul>
                <div id="painel_login" class="pull-right">
                    <input class="input-small" type="text" placeholder="Email" id="email">
                    <input class="input-small" type="password" placeholder="Senha" maxlength="10" id="senha">
                    <button class="btn" id="entrar">Entrar</button>
                </div>
            </s:if>
            <s:elseif test="%{#session.user != null}">

                <ul class="nav">                     
                    <li <s:if test="%{applicationContext.get('action') == 'index'}">class="active"</s:if>>
                        <a href="${pageContext.request.contextPath}/index">Home</a>
                    </li>

                    <s:if test="%{#session.user.isPermission()}">
                        <li <s:if test="%{applicationContext.get('controller') == 'service'}">class="active"</s:if>>
                            <a href="${pageContext.request.contextPath}/service/form">Serviços</a>
                        </li>
                    </s:if>                    

                    <s:if test="%{#session.user.isPermission()}">                        
                        <li <s:if test="%{applicationContext.get('controller') == 'user'}">class="active"</s:if>>
                            <a href="${pageContext.request.contextPath}/user/form">Usuários</a>
                        </li>
                    </s:if>    
                    <s:else>
                        <li <s:if test="%{applicationContext.get('controller') == 'user'}">class="active"</s:if>>
                            <a href="${pageContext.request.contextPath}/user/form">Meu Cadastro</a>
                        </li>
                    </s:else>

                    <li><a href="#about">Agendar</a></li>
                    <li <s:if test="%{applicationContext.get('controller') == 'car'}">class="active"</s:if>>
                        <a href="${pageContext.request.contextPath}/car/form">Veículo</a>
                    </li>
                </ul>
                <p class="pull-right">Logado como <a href="#"><s:property value="%{#session.user.getName()}" /></a> | <a href="#" id="sair">sair</a></p>

            </s:elseif>
        </div>
    </div>
</div>


<div id="modal-from-dom" class="modal hide fade">
    <div class="modal-header">
        <a href="#" class="close">&times;</a>
        <h3>SGLJ - Falha na autenticação</h3>
    </div>
    <div class="modal-body" id="message">

    </div>
    <div class="modal-footer">
        <a href="#" id="btn_ok" class="btn primary">Ok</a>           
    </div>
</div>

<div id="modal_sair_sistema" class="modal hide fade">
    <div class="modal-header">
        <a href="#" class="close">&times;</a>
        <h3>SGLJ</h3>
    </div>
    <div class="modal-body" id="message">
        <p>Deseja realmente sair do sistema?</p>
    </div>
    <div class="modal-footer">
        <a href="#" id="btn_cancelar" class="btn secondary">Cancelar</a>          
        <a href="#" id="btn_sim" class="btn primary">Sim</a>                       
    </div>
</div>

<script language="javascript" type="text/javascript">
       
    $(function(){
   
        $('#btn_ok').live('click', function(){       
            $("#modal-from-dom").modal('hide');
        });
    
        $("#modal-from-dom").modal({
            modal : true,
            keyboard : true,
            backdrop: true
        });
    
        $("#modal_sair_sistema").modal({
            modal : true,
            keyboard : true,
            backdrop: true
        });
    
        $("#sair").click(function(){
            $("#modal_sair_sistema").modal("show");
        });
    
        $("#btn_sim").click(function(){
            $("#modal_sair_sistema").modal("hide");
            location.href = "sair";
        });
    
        $("#btn_cancelar").click(function(){
            $("#modal_sair_sistema").modal("hide");        
        });
    

        $("#entrar").click(function() { 
        
            if($("#senha").val() != "" && $("#email").val() != "") {
                $.post("autenticar", {
                    'user.password' : $("#senha").val(),
                    'user.email' : $("#email").val()
                }, function(response){
                    if(response.success === true) {
                        location.href = "index.jsp";
                    } else {
                        $("#message").html("<p>" + response.message + "</p>");
                        $("#modal-from-dom").modal('toggle');                
                    }
                }); 
            }
        });
    });

   

</script>
