/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.message;

/**
 *
 * @author jhonatan
 */
public enum MessageInterface {
    MSG001("Cadastro realizado com sucesso!"),
    MSG002("Alteração realizado com sucesso!"),
    MSG003("Senha alterado com sucesso!"),    
    MSG004("Senha atual digitada estar incorreta!"),
    MSG005("Parâmetros informados estão incorretos."),
    MSG006("Oi! Um erro inesperado ocorreu em sua solicitação, tente novamente mais tarde ou contacte o administrador."),
    MSG007("Exclusão realizada com sucesso!");
    
    private String message;
    
    private MessageInterface(String message) {
        this.message = message;
    }
    
    @Override
    public String toString() {
        return this.message;
    }
}
