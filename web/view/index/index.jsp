<%-- 
    Document   : index
    Created on : 31/10/2011, 10:02:56
    Author     : jhonatan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div class="container">

    <!-- Main hero unit for a primary marketing message or call to action -->
    <div class="hero-unit">
        <h1>SGLJ</h1>
        <p>Vestibulum id ligula porta felis euismod semper. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
        <p><a class="btn primary large">Learn more &raquo;</a></p>
    </div>

    <!-- Example row of columns -->
    <div class="row">
        <div class="span-one-third">
            <h2>Heading</h2>
            <p>Etiam porta sem malesuada magna mollis euismod. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
            <p><a class="btn" href="#">View details &raquo;</a></p>
        </div>
        <div class="span-one-third">
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            <p><a class="btn" href="#">View details &raquo;</a></p>
        </div>
        <s:if test="%{#session.user == null}">
            <div class="span-one-third">
                <h2>Cadastre-se</h2>
                <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                <p><a class="btn" href="user/form">Ir &raquo;</a></p>
            </div> 
        </s:if>
        <s:else>

            <div class="span-one-third">
                <h2>Heading</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                <p><a class="btn" href="#">View details &raquo;</a></p>
            </div>
        </s:else>


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

    <footer>
        <p>&copy; Company 2011</p>
    </footer>

</div> <!-- /container -->