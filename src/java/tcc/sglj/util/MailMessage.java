/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.util;

/**
 *
 * @author jhonatan
 */
public class MailMessage {

    private String to;
    private String cc;
    private String bcc;
    private String from;
    private String subject;
    private String text;

    public MailMessage(String to2, String cc2, String bcc2, String from2, String subject2, String text2) {
        this.to = to2;
        this.cc = cc2;
        this.bcc = bcc2;
        this.from = from2;
        this.subject = subject2;
        this.text = text2;
    }

    public String getTo() {
        return this.to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getBcc() {
        return bcc;
    }

    public void setBcc(String bcc) {
        this.bcc = bcc;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
    /*
     * Olá,

Esqueceu sua senha?

Nós podemos ajudá-lo a alterar sua senha. Para continuar o processo, visite o seguinte link:

http://www.zend.com/user/lostPassword/?key=0c0ae2025a5513bf667f37fa4d207295

Se você não iniciar esse processo, por favor, sinta-se livre para ignorar esta mensagem.

Atenciosamente,

Zend.com Webmaster

webmaster@zend.com
     */
}