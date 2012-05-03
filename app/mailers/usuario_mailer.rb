class UsuarioMailer < ActionMailer::Base
  default :from => "notificaciones@dismardis.com"
 
  def welcome_email(usuario)
    @usuario = usuario
    @url  = "http://www.dismardis.com/login"
    mail(:to => usuario.Email, :subject => "Registro al Sitio de Pedidos Dismardis")
  end
  
  def cambio_password_email(usuario)
    @usuario = usuario
    @url  = "http://www.dismardis.com/login"
    mail(:to => usuario.Email, :subject => "Cambio de Password")
  end
end
