class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_to user
      else
        message = t("user_mailer.account_activation.account_not_activated")
        message += t("user_mailer.account_activation.check_email")
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = t("login.index.invalid_combination")
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
