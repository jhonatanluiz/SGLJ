<%-- 
    Document   : list
    Created on : 02/11/2011, 17:15:52
    Author     : jhonatan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<table class="zebra-striped">
    <thead>
        <tr>
            <th style="width: 35px"># Id</th>
            <s:if test="%{sidx == 'name' && sord == 'asc' }" >
                <th class="yellow header headerSortDown" onclick="sort(this, 'name');">Nome</th>
            </s:if> 
            <s:elseif     test="%{sidx == 'name' && sord == 'desc' }" >
                <th class="yellow header headerSortUp" onclick="sort(this, 'name');">Nome</th>
            </s:elseif> 
            <s:else>
                <th class="yellow header" onclick="sort(this, 'name');">Nome</th>
            </s:else>


            <s:if test="%{sidx == 'email' && sord == 'asc' }" >
                <th class="blue header headerSortDown" onclick="sort(this, 'email');">Nome</th>
            </s:if> 
            <s:elseif     test="%{sidx == 'email' && sord == 'desc' }" >
                <th class="blue header headerSortUp" onclick="sort(this, 'email');">Nome</th>
            </s:elseif> 
            <s:else>
                <th class="blue header" onclick="sort(this, 'email');">E-mail</th>
            </s:else>           

            <th class="green" style="width: 90px">CPF</th>
            <th class="red" style="width: 90px">Telefone</th>

        </tr>
    </thead>
    <tbody>
        <s:iterator value="%{data}" var="item">
            <tr onclick="editar('<s:property value="%{#item[0]}"/>');">
                <td><s:property value="%{#item[0]}"/></td>
                <td><s:property value="%{#item[1]}"/></td>
                <td><s:property value="%{#item[2]}"/></td>
                <td><s:property value="%{#item[3]}"/></td>
                <td><s:property value="%{#item[4]}"/></td>                  
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

                <a style="cursor: pointer" onclick="listar(10, '<s:property value="%{#item}"/>', 'name', 'asc');">
                    <s:property value="%{#item}"/>
                </a>
            </li>

        </s:iterator>
    </ul>
</div>
<div id="form" style="display: none"></form>
<script language="javascript" type="text/javascript">
    $(function(){});
    
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
    
    function editar(id) {
        
        var form = "<form method='post' action='form' id='editar'>";
        form += "<input type='text' name='user.id' value='" + id + "'>"
        form +="</form>";        
             
        document.getElementById("form").innerHTML = form
        document.getElementById("editar").submit();
    }
</script>

