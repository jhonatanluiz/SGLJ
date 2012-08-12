<%-- 
    Document   : grid_marca
    Created on : 14/11/2011, 15:22:23
    Author     : jhonatan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


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
</div>&nbsp;
<table class="zebra-striped">
    <thead>
        <tr>
            <th style="width: 35px"># Id</th>
            <s:if test="%{sidx == 'name' && sord == 'asc' }" >
                <th class="yellow header headerSortDown" onclick="sort(this, 'name');">Nome marca</th>
            </s:if> 
            <s:elseif     test="%{sidx == 'name' && sord == 'desc' }" >
                <th class="yellow header headerSortUp" onclick="sort(this, 'name');">Nome marca</th>
            </s:elseif> 
            <s:else>
                <th class="yellow header" onclick="sort(this, 'name');">Nome marca</th>
            </s:else>


            <s:if test="%{sidx == 'description' && sord == 'asc' }" >
                <th class="blue header headerSortDown" onclick="sort(this, 'description');">Total modelos</th>
            </s:if> 
            <s:elseif     test="%{sidx == 'description' && sord == 'desc' }" >
                <th class="blue header headerSortUp" onclick="sort(this, 'description');">Total modelos</th>
            </s:elseif> 
            <s:else>
                <th class="blue header" onclick="sort(this, 'description');">Total modelos</th>
            </s:else>           
        </tr>
    </thead>
    <tbody>
        <s:iterator value="%{data}" var="item">
            <tr onclick="editar('<s:property value="%{#item[0]}"/>');" alt="editar">
                <td><s:property value="%{#item[0]}"/></td>
                <td><s:property value="%{#item[1]}"/></td>
                <td><s:property value="%{#item[2]}"/></td>

            </tr>
        </s:iterator>
        <tr >
            <td colspan="5">                
                <p style="float: right">visualizando <strong><s:property value="%{data.size() != 0 ? page * rows - rows + 1 : 0}"/></strong> - <strong><s:property value="%{page * rows - (rows - data.size()) }"/></strong> de <strong><s:property value="%{records}"/></strong> registros encontrados</p>                
            </td>
        </tr>
    </tbody>
</table>               
<div class="pagination">
    <ul>

        <s:iterator begin="1" end="%{total}"  var="item">
            <s:if test="%{page == #item}">
                <li class="active">
                </s:if>
                <s:else>
                <li>        
                </s:else>

                <a style="cursor: pointer" onclick="listar(10, '<s:property value="%{#item}"/>', 'nameMark', 'asc');">
                    <s:property value="%{#item}"/>
                </a>
            </li>

        </s:iterator>
    </ul>
</div>
<div id="form" style="display: none"></form>
<script language="javascript" type="text/javascript">
    $(function(){
       
    });

    function sort(obj, sort) {
        if($(obj).hasClass('headerSortDown')) {
            $(obj).removeClass('headerSortDown').addClass("headerSortUp");
            listar(10, 1, sort, 'desc');
        } else if($(obj).hasClass('headerSortUp')) {
            $(obj).removeClass('headerSortUp').addClass("headerSortDown");
            listar(10, 1, sort, 'asc');
        } else {          
            $(obj).addClass('headerSortUp');
            listar(10, 1, sort, 'asc');
        }
        
    }
    
       
</script>


