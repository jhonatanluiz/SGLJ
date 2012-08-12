
$(function(){
   
    $('#btn_ok').live('click', function(){       
        $("#modal-from-dom").modal('hide');
    });
    
    $("#modal-from-dom").modal({
        modal : true,
        keyboard : true,
        backdrop: true
    });
    
    $("#modal_sair_sistema").modal({
        modal : true,
        keyboard : true,
        backdrop: true
    });
    
    $("#sair").click(function(){
         $("#modal_sair_sistema").modal("show");
    });
    
    $("#btn_sim").click(function(){
        $("#modal_sair_sistema").modal("hide");
        location.href = "sair";
    });
    
    $("#btn_cancelar").click(function(){
        $("#modal_sair_sistema").modal("hide");        
    });
    

    $("#entrar").click(function() { 
        
        if($("#senha").val() != "" && $("#email").val() != "") {
            $.post("autenticar", {
                'user.password' : $("#senha").val(),
                'user.email' : $("#email").val()
            }, function(response){
                if(response.success === true) {
                    location.href = "index.jsp";
                } else {
                    $("#message").html("<p>" + response.message + "</p>");
                    $("#modal-from-dom").modal('toggle');                
                }
            }); 
        }
    });
});

   
