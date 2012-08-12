$(function(){
    $("#num_preco").priceFormat();
    
    $("#cadastro_servico").validate({
        submitHandler : function(){
            cadastro_servico();
        }
    });
    
    $("#modal_desativar_servico").modal({
        modal : true,
        keyboard : true,
        backdrop: true
    });
    
    
    $("#submit_form").click(function(){
        $("#cadastro_servico").submit();
    });
    
    $("#pesquisar").click(function(){
        listar(10, 1, 'name', 'asc');
    });
    
    $("#excluir").click(function(){
        excluir_servico($("#id_servico").val());
    });
});

function cadastro_servico(){
    $.post('sign', {
        'service.id' : $("#id_servico").val(),
        'service.name': $("#nom_servico").val(),
        'service.description' : $("#des_servico").val(),
        'service.price' : $("#num_preco").val().replace("R$ ", "").split(".").join("").replace(",", ".")
    }, function(response){        
        $("#alert_message").html(response);        
    });
}

function excluir_servico(id) {


    $("#modal_desativar_servico").modal("show");
       
    $("#btn_sim").click(function(){
        $("#modal_desativar_servico").modal("hide");     
        
        $("#modal_desativar_servico").bind('hidden', function () {
            $.post('delete', {
                'service.id' : id        
            }, function(response){
                $("#alert_message").html(response);
            });            
        })
    });   
    
    $("#btn_cancelar").click(function(){
        $("#modal_desativar_servico").modal("hide");        
    });
    
  
}

function listar(rows, page, sidx, sord){
    var field = document.getElementById("field").value;
    var search = document.getElementById("search").value;
    
    $.post("list", {
        'rows':   rows != 10 ? rows : 10,
        'page':   page != 1 ? page : 1,
        'sidx':   sidx != 'name' ? sidx : 'name',
        'sord':   sord != 'asc' ? sord : 'asc',
        'field':  field != '' ? field : '',
        'search': search != '' ? search : ''
    }, function(response){
        $("#listar_service").html(response);
    });
}  
