$(function(){
    
    $("input").focus(function(){
        $("#alert_message").empty();
        $("#alert_message_senha").empty();
        
    });
    $("#cadastro_usuario").validate({
        submitHandler : function(){           
            cadastro_usuario();
        }
    });
    
    $("#form_trocar_senha").validate({
        submitHandler : function(){           
            trocar_senha();
        }
    });
    
    $("#submit_form_senha").click(function(){
        $("#form_trocar_senha").submit();
    });
    
    $("#modal_desativar_conta").modal({
        modal : true,
        keyboard : true,
        backdrop: true
    });
    
    $("#pesquisar").click(function(){
        listar(10, 1, 'name', 'asc');
    });
            
    var validations = [{
        name : "cpf",
        func: function(){
            return true;//$("#cpf_usuario").validateCPF();
        },
        message : "CPF digitado é inválido!"
    }, {
        name : "senha",
        func : function(input) {
            var pattern = /^([0-9a-zA-Z])+$/;
            return pattern.test(input);
        },
        message : "Campo senha deve conter apenas caracteres a-z e 0-9."
    }, {
        name : "confirmar",
        func : function(cpassw) {
            if($("#npassw").val() != cpassw) {
                return false;
            }
            return true;
        },
        message : "Senhas digitadas não conferem!"
    },{
        name : "confirmar2",
        func : function(cpassw) {
            if($("#nova_senha").val() != cpassw) {
                return false;
            }
            return true;
        },
        message : "Senhas digitadas não conferem!"
    }, {
        name : "disponivel_email",
        func : function(email) {
            var val = $.ajax({
                url : "email?email=" + email + "&id="+ $("#id_usuario").val(),
                async : false
            }).responseText;
            if (val == 'true') {
                return true;
            }
            return false;
        },
        message : "Email informado já está em uso no sistema!"        
    }, {
        name : "disponivel_cpf",
        func : function(cpf) {
            var val = $.ajax({
                url : "cpf?cpf=" + cpf + "&id="+ $("#id_usuario").val(),
                async : false
            }).responseText;
            if (val == 'true') {
                return true;
            }
            return false;
        },
        message : "CPF informado já está em uso no sistema!"        
    }, {
        name : "tamanho_senha",
        func : function(obj) {
            
            if(obj.length > 10) {
                return false;
            }
            return true;
        },
        message : "Senha deverá ter no maximo 10 caracteres!"
    }];

    $.each(validations, function(index, data){
        $.validator.addMethod(
            data.name,
            data.func,
            data.message);
    });
            
    $("#cpf_usuario").mask('999.999.999-99');
            
    $("#telefone_usuario").mask('(99) 9999-9999');
   
    $("#submit_form").click(function(){
        $("#cadastro_usuario").submit();
    });
    
     $(".tabs").tabs();

});

function trocar_senha(){
    $.post('password', {
        'actual.password'   : $("#senha_atual").val(),
        'new.password'     : $("#nova_senha").val()
    }, function(response){
        try {                                
            $("#alert_message_senha").html(response);
        } catch(e) {
            alert("Atenção!, ocorreu um erro em sua solicitação, tente novamente mais tarde.\n Detalhes: " + e.getMessage());
        }                                
    }); 
}

function cadastro_usuario() {
    $.post('sign', {
        'user.id'         : $("#id_usuario").val(),
        'user.name'       : $("#nome_usuario").val(),
        'user.cpf'        : $("#cpf_usuario").val(),
        'user.email'      : $("#email_usuario").val(),
        'user.password'   : $("#npassw").val(),
        'user.phone'      : $("#telefone_usuario").val(),
        'user.permission' : $("#permissao").is(":checked")
    }, function(response){
        try {                                
            $("#alert_message").html(response);
        } catch(e) {
            alert("Atenção!, ocorreu um erro em sua solicitação, tente novamente mais tarde.\n Detalhes: " + e.getMessage());
        }                                
    });
}
    
function excluir_cadastro(id) {
    $("#modal_desativar_conta").modal("show");
       
    $("#btn_sim").click(function(){
        $("#modal_desativar_conta").modal("hide");     
        
        $("#modal_desativar_conta").bind('hidden', function () {
            $.post("delete", {
                'id' : id
            }, function(response){
                $("#alert_message").html(response);
            });              
        })
    });
    
    
    $("#btn_cancelar").click(function(){
        $("#modal_desativar_conta").modal("hide");        
    });
    
}    

/*
_search:false
nd:1320260767192
rows:20
page:2
sidx:name
sord:asc
field:name
search:asdfasd*/

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
        $("#listar_user").html(response);
    });
}    