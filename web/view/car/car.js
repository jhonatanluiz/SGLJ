/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(function(){
    
    $("#pesquisar_marcas").click(function(){
        listar(6, 1, 'nameMark', 'asc', this); 
    });
               
    $("#listar_marcas").click(function(){
        listar(10, 1, 'nameMark', 'asc', this); 
    });
    
    $("#salvar_marca").click(function(){
        cadastro_marca();
    });
})

function listar(rows, page, sidx, sord){
    var field = document.getElementById("field").value;
    var search = document.getElementById("search").value;
    
    $.post("listMark", {
        'rows':   rows != 10 ? rows : 10,
        'page':   page != 1 ? page : 1,
        'sidx':   sidx != 'nameMark' ? sidx : 'nameMark',
        'sord':   sord != 'asc' ? sord : 'asc',
        'field':  field != '' ? field : '',
        'search': search != '' ? search : ''
    }, function(response){
        $("#grid_listar_marcas").html(response);
    });
}  

function cadastro_marca() {
    $.post('sign-car-mark', {
        'carMark.id'         : $("#id_marca").val(),
        'carMark.nameMark'       : $("#nm_marca").val()
    }, function(response){
        try {                                
            $("#alert_message").html(response);
        } catch(e) {
            alert("Atenção!, ocorreu um erro em sua solicitação, tente novamente mais tarde.\n Detalhes: " + e.getMessage());
        }                                
    });
}