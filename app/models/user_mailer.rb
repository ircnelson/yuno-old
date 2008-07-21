class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'  
    @body[:url]  = "http://wwww.yuno.com.br/account/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://yuno.com.br/"
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "contato@yuno.com.br"
      @subject     = "[yuno.com.br] "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
