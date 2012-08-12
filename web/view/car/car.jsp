<%-- 
    Document   : suport
    Created on : 12/11/2011, 14:03:18
    Author     : jhonatan
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
                    <h1>Painel veículo<small></small></h1>
                </div>
                <div class="row">
                    <div class="span10" >  
                        <div>
                            <ul data-tabs="tabs" class="tabs">
                                <li class="active"><a href="#cadastro">Cadastro de veículo</a></li>                                                     
                                <li class=""><a href="#listar">Veículos cadastrados</a></li>                                                     
                                <li class=""><a href="#marcas">Marcas</a></li>                             
                                <li class=""><a href="#modelo">Modelo veículo</a></li>                                                                                    
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div id="marcas">
                                <form>
                                    <div class="clearfix">
                                        <label for="Serviço">Nome da marca *</label>
                                        <div class="input">
                                            <input type="hidden" id="id_marca" readonly="readonly" value="<s:property value="%{service.id}"/>"/>      
                                            <input class="span6 required" id="nm_marca" maxlength="60" name="nm_marca" type="text" value='<s:property value="%{service.name.trim()}"/>'/>                                           
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <label></label>
                                        <div class="input">
                                            <input type="button" id="salvar_marca" class="btn primary" value="Salvar">                                           
                                        </div>
                                    </div>
                                </form>
                                <div id="grid_listar_marcas">
                                    <div>
                                        <ul data-tabs="tabs" class="tabs">
                                            <li class="active"><a href="#">Lista de marcas</a></li>                             

                                        </ul>
                                    </div>
                                    <div  class="clearfix">
                                        <label for="normalSelect" style="margin-right: 10px;">Filtro de pesquisa</label>    
                                        <div class="input">
                                            <select class="span3" id="field" >
                                                <option value='mark.nameMark' <s:if test="%{field == 'mark.nameMark'}">selected="selected"</s:if>>Marcas</option>
                                                <option value='model.nameModel' <s:if test="%{field == 'model.nameModel'}">selected="selected"</s:if>>Modelos</option>
                                                </select>
                                                <input class="span3" type="text" id="search" value="<s:property value="%{search}"/>">
                                            <button class="btn" id="pesquisar_marcas" >Pesquisar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="modelo">
                                <form>
                                    <div class="clearfix">
                                        <label for="Serviço">Marca *</label>
                                        <div class="input">
                                            <input type="hidden" id="id_servico" readonly="readonly" value="<s:property value="%{service.id}"/>"/>      
                                            <input class="span6 required" id="nom_servico" maxlength="60" name="nom_servico" type="text" value='<s:property value="%{service.name.trim()}"/>'/>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <label for="Serviço">Modelo veículo</label>
                                        <div class="input">
                                            <input type="hidden" id="id_servico" readonly="readonly" value="<s:property value="%{service.id}"/>"/>      
                                            <input class="span6 required" id="nom_servico" maxlength="60" name="nom_servico" type="text" value='<s:property value="%{service.name.trim()}"/>'/>                                            
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <label></label>
                                        <div class="input">
                                            <input type="button" id="salvar_marca" class="btn primary" value="Salvar">
                                            <input type="button" id="listar_marcas" class="btn" value="Listar modelos">
                                        </div>
                                    </div>
                                </form>
                                         <div id="grid_listar_modelos">
                                    <div>
                                        <ul data-tabs="tabs" class="tabs">
                                            <li class="active"><a href="#">Lista de modelos</a></li>                             

                                        </ul>
                                    </div>
                                    <div  class="clearfix">
                                        <label for="normalSelect" style="margin-right: 10px;">Filtro de pesquisa</label>    
                                        <div class="input">
                                            <select class="span3" id="field" >
                                                <option value='mark.nameMark' <s:if test="%{field == 'mark.nameMark'}">selected="selected"</s:if>>Marcas</option>
                                                <option value='model.nameModel' <s:if test="%{field == 'model.nameModel'}">selected="selected"</s:if>>Modelos</option>
                                                </select>
                                                <input class="span3" type="text" id="search" value="<s:property value="%{search}"/>">
                                            <button class="btn" id="pesquisar_marcas" >Pesquisar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="cadastro" class="active" >
                                <div id="alert_message">
                                    <s:property value="%{url}"/>
                                </div>
                                <form  id="cadastro_servico" name="cadastro_servico">
                                    <div class="clearfix">
                                        <label for="Serviço">Cliente *</label>
                                        <div class="input">
                                            <input type="hidden" id="id_servico" readonly="readonly" value="<s:property value="%{service.id}"/>"/>      
                                            <input class="span6 required" id="nom_servico" maxlength="60" name="nom_servico" type="text" value='<s:property value="%{service.name.trim()}"/>'/>
                                            <input type="button" id="pesquisar_cliente" class="btn" value="Pesquisar">
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
        <s:include value="/view/car/car.js"/>     
    </script>

</body>
</html>
