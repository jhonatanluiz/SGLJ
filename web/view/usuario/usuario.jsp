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
                        <div>
                            <ul data-tabs="tabs" class="tabs">
                                <li class="active"><a href="#cadastro">Cadastro</a></li>
                                <s:if test="%{#session.user != null and #session.user.isPermission()}">
                                    <li class=""><a href="#listar">Lista de usuários</a></li>
                                </s:if>
                                <s:if test="%{#session.user != null}">
                                    <li class=""><a href="#trocar_senha">Alterar senha</a></li>
                                </s:if>

                            </ul>
                        </div>
                        <div class="tab-content">                            
                            <div id="cadastro" class="active">
                                <div id="alert_message">
                                </div>
                                <form id="cadastro_usuario" name="cadastro_usuario">                         
                                    <div class="clearfix">
                                        <label for="name">Nome completo</label>
                                        <div class="input">
                                            <input type="hidden" id="id_usuario" readonly="readonly" value="<s:property value="%{user.id}" />"/>
                                            <input class="span6 required" id="nome_usuario" name="nome_usuario" type="text" value="<s:property value="%{user.name.trim()}"/>"/>
                                        </div>
                                    </div><!-- /clearfix -->
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
                                    </div><!-- /clearfix -->
                                    <div class="clearfix">
                                        <label for="telefone">Telefone</label>
                                        <div class="input">
                                            <input class="span5" id="telefone_usuario"  name="telefone_usuario"  type="text" value="<s:property value="%{user.phone.trim()}"/>"/>
                                        </div>
                                    </div><!-- /clearfix -->
                                    <!--                                    campo de senha so aparecera caso não aja seção aberta ou se o usuario logado e administrador-->

                                    <s:if test="%{user == null}">                                            
                                        <div class="clearfix">
                                            <label for="nsenha">Senha</label>
                                            <div class="input">
                                                <input class="span3 required senha tamanho_senha" id="npassw" maxlength="10"  name="npassw" type="password" />
                                            </div>
                                        </div><!-- /clearfix -->
                                        <div class="clearfix">
                                            <label for="csenha">Confirmar nova senha</label>
                                            <div class="input">
                                                <input class="span3 required senha tamanho_senha confirmar" maxlength="10" id="cpassw"  name="cpassw" type="password" />
                                            </div>
                                        </div><!-- /clearfix -->
                                    </s:if>


                                    <s:if test="%{#session.user.isPermission()}" >   
                                        <div class="clearfix">
                                            <label id="optionsCheckboxes">Permissão</label>
                                            <div class="input">
                                                <ul class="inputs-list">
                                                    <li>
                                                        <label>
                                                            <s:if test="%{user.permission == true}" >
                                                                <input type="checkbox" name="permissao" id="permissao" checked="checked">
                                                            </s:if>
                                                            <s:else>
                                                                <input type="checkbox" name="permissao" id="permissao">
                                                            </s:else>   
                                                            <span>Permitir ao usuário acesso as funcionalidades de administrador.</span>
                                                        </label>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </s:if>

                                    <div class="actions">
                                        <s:if test="%{#session.user == null}" >
                                            <input type="button" id="submit_form" class="btn primary" value="Criar minha conta">
                                        </s:if>
                                        <s:else>
                                            <input type="button" id="submit_form" class="btn primary" value="Salvar">&nbsp;
                                            <s:if test="%{user.id != null}" >
                                                <input type="button" id="submit_form" class="btn" onclick ="excluir_cadastro('<s:property value="%{user.id}" />');" value="Desativar conta">&nbsp;
                                            </s:if>
                                        </s:else>
                                    </div>
                                </form>
                            </div>
                            <s:if test="%{#session.user != null and #session.user.isPermission()}">
                                <div id="listar">

                                    <div  class="clearfix">
                                        <label for="normalSelect" style="margin-right: 10px;">Filtro de pesquisa</label>    
                                        <div class="input">
                                            <select class="span3" id="field" >
                                                <option value='name'>Nome</option>
                                                <option value='email'>Email</option>
                                                <option value='cpf'>Cpf</option>
                                            </select>
                                            <input class="span3" type="text" id="search">
                                            <button class="btn" id="pesquisar">Pesquisar</button>
                                        </div>
                                    </div>&nbsp;

                                    <div id="listar_user" class="clearfix">

                                    </div>
                                </div>
                            </s:if>
                            <s:if test="%{#session.user != null}" >            
                                <div id="trocar_senha"> 
                                    <div id="alert_message_senha">
                                    </div>
                                    <form id="form_trocar_senha" name="form_trocar_senha">  
                                        <div class="clearfix">
                                            <label for="nsenha">Senha atual</label>
                                            <div class="input">
                                                <input class="span3 required" id="senha_atual" name="senha_atual" type="password" />
                                            </div>
                                        </div> 
                                        <div class="clearfix">
                                            <label for="nsenha">Senha</label>
                                            <div class="input">
                                                <input class="span3 required senha" id="nova_senha" name="nova_senha" type="password" />
                                            </div>
                                        </div> 
                                        <div class="clearfix">
                                            <label for="csenha">Confirmar nova senha</label>
                                            <div class="input">
                                                <input class="span3 required senha confirmar2" id="confirmar_senha" name="confirmar_senha" type="password" />
                                            </div>
                                        </div>
                                        <div class="actions">
                                            <input type="button" id="submit_form_senha" class="btn primary" value="Alterar senha">
                                        </div>
                                    </form>
                                </div>
                            </s:if>
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
       
    </script>

</body>
</html>