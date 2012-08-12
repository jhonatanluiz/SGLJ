$(function(){
    
    $("#cadastro_usuario").validate({});
    
            
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
  
    $("#submit_form").click(function(){
        $("#cadastro_usuario").submit();
    });
    
});
