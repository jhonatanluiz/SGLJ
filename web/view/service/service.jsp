<%-- 
    Document   : service
    Created on : 04/11/2011, 23:57:51
    Author     : jhonatan
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <h1>Painel de serviços <small></small></h1>
                </div>
                <div class="row">
                    <div class="span10" >  
                        <div>
                            <ul data-tabs="tabs" class="tabs">
                                <li class="active"><a href="#cadastro">Cadastro</a></li>                             
                                <li class=""><a href="#listar">Lista de serviços</a></li>                                                     
                            </ul>
                        </div>
                        <div class="tab-content">                            
                            <div id="cadastro" class="active">
                                <div id="alert_message">
                                    <s:property value="%{url}"/>
                                </div>
                                <form  id="cadastro_servico" name="cadastro_servico">
                                    <div class="clearfix">
                                        <label for="Serviço">Serviço *</label>
                                        <div class="input">
                                            <input type="hidden" id="id_servico" readonly="readonly" value="<s:property value="%{service.id}"/>"/>      
                                            <input class="span6 required" id="nom_servico" maxlength="60" name="nom_servico" type="text" value='<s:property value="%{service.name.trim()}"/>'/>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <label for="Valor">Valor *</label>
                                        <div class="input">
                                            <input class="span3 required" id="num_preco" name="num_preco" type="text" maxlength="12" value='<s:property value="%{service.price}"/>'/>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <label for="Descrição">Descrição *</label>
                                        <div class="input">
                                            <textarea rows="3" id="des_servico"  maxlength="200" name="des_servico"class="span6 required"><s:property value="%{service.description.trim()}"/></textarea>                                            
                                        </div>
                                    </div>
                                    <div class="actions">
                                       <input type="button" id="submit_form" class="btn primary" value="Salvar">
                                        <s:if test="%{service != null}">
                                            <input type="button" id="excluir" class="btn" value="Excluir Serviço">
                                        </s:if>
                                    </div>
                                </form>
                            </div>
                            <div id="listar">
                                <div  class="clearfix">
                                    <label for="normalSelect" style="margin-right: 10px;">Filtro de pesquisa</label>    
                                    <div class="input">
                                        <select class="span3" id="field" >
                                            <option value='name'>Serviço</option>
                                            <option value='description'>Descrição</option>
                                        </select>
                                        <input class="span3" type="text" id="search">
                                        <button class="btn" id="pesquisar">Pesquisar</button>
                                    </div>
                                </div>&nbsp;

                                <div id="listar_service" class="clearfix">

                                </div>
                            </div>

                        </div>
                    </div>                    
                </div>

                <s:if test="%{service != null}">
                    <div id="modal_desativar_servico" class="modal hide fade">
                        <div class="modal-header">
                            <a href="#" class="close">&times;</a>
                            <h3><s:property value="%{#session.sistema}"/> - Excluir serviço</h3>
                        </div>
                        <div class="modal-body" id="message">
                            <p>Deseja realmente excluir esse serviço?</p>
                        </div>
                        <div class="modal-footer">
                            <a href="#" id="btn_cancelar" class="btn secondary">Cancelar</a>          
                            <a href="#" id="btn_sim" class="btn primary">Sim</a>                       
                        </div>
                    </div>
                </s:if>                         
            </div>
            <footer>
                <p>&copy; Company 2011</p>
            </footer>

        </div> <!-- /container -->

    </body>

    <script language="javascript" type="text/javascript">
        <s:include value="/view/service/service.js"/>     
    </script>

</body>
</html>
