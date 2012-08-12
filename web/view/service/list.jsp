<%-- 
    Document   : list
    Created on : 05/11/2011, 09:51:38
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
                <th class="yellow header headerSortDown" onclick="sort(this, 'name');">Serviço</th>
            </s:if> 
            <s:elseif     test="%{sidx == 'name' && sord == 'desc' }" >
                <th class="yellow header headerSortUp" onclick="sort(this, 'name');">Serviço</th>
            </s:elseif> 
            <s:else>
                <th class="yellow header" onclick="sort(this, 'name');">Serviço</th>
            </s:else>


            <s:if test="%{sidx == 'description' && sord == 'asc' }" >
                <th class="blue header headerSortDown" onclick="sort(this, 'description');">Descrição</th>
            </s:if> 
            <s:elseif     test="%{sidx == 'description' && sord == 'desc' }" >
                <th class="blue header headerSortUp" onclick="sort(this, 'description');">Descrição</th>
            </s:elseif> 
            <s:else>
                <th class="blue header" onclick="sort(this, 'description');">Descrição</th>
            </s:else>           

            <s:if test="%{sidx == 'price' && sord == 'asc' }" >
                <th class="blue header headerSortDown"onclick="sort(this, 'price');">Preço</th>
            </s:if> 
            <s:elseif     test="%{sidx == 'price' && sord == 'desc' }" >
                <th class="blue header headerSortUp"  onclick="sort(this, 'price');">Preço</th>
            </s:elseif> 
            <s:else>
                <th class="blue header" onclick="sort(this, 'price');">Preço</th>
            </s:else>  

        </tr>
    </thead>
    <tbody>
        <s:iterator value="%{data}" var="item">
            <tr onclick="editar('<s:property value="%{#item[0]}"/>');" alt="editar">
                <td><s:property value="%{#item[0]}"/></td>
                <td><s:property value="%{#item[1]}"/></td>
                <td><s:property value="%{#item[2]}"/></td>                
                <td><span class="price_format"><s:property value="%{#item[3]}"/></span></td>  
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
    
    var span = $.find(".price_format");
    
    $.each(span, function(index,data){
        var s = Number($(data).html());
        s = s.toFixed(2);
        s = maskResul(s);        
        
        $(data).html("R$ " + s);
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
    
    function editar(id) {
        
        var form = "<form method='post' action='form' id='editar'>";
        form += "<input type='text' name='service.id' value='" + id + "'>"
        form +="</form>";
        
             
        document.getElementById("form").innerHTML = form
        document.getElementById("editar").submit();
    }
    
    function maskResul(numero) {
        if (numero.toString().indexOf('.') >= 0
            || numero.toString().indexOf(',') >= 0) {
            var retorno = numero.toString().replace('.', ',');
            aRetorno = retorno.split(',');

            conta = 0;
            nRetorno = '';
            nRetornoFinal = '';

            if (aRetorno[0].length > 3) {
                for (i = aRetorno[0].length - 1; i >= 0; i--) {

                    nRetorno = nRetorno + aRetorno[0].charAt(i);
                    conta++;
                    if (conta == 3) {
                        nRetorno += '.';
                        conta = 0;
                    }
                }
                for (i = nRetorno.length - 1; i >= 0; i--)
                    nRetornoFinal = nRetornoFinal + nRetorno.charAt(i);

                if (nRetornoFinal.charAt(0) == '.')
                    nRetornoFinal = nRetornoFinal
                .substring(1, nRetornoFinal.length);
            } else
                nRetornoFinal = aRetorno[0];

            return nRetornoFinal + ',' + aRetorno[1];
        } else
            return numero;

    }
</script>


