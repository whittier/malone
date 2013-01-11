class SessionsController < ApplicationController
  skip_before_filter :require_person, :except => :destroy

  def new
  end

  def create

    if (host_name.index("octanner") == nil) && (host_name.index("localhost") == nil)
      flash.now[:error] = "You can't get there from here - wrong network!"
      render "new"
      return
    end

    person = Person.find_by_email(params[:session][:email])
    if person && person.authenticate(params[:session][:password])
      if params[:session][:remember_me] == "1"
        cookies.permanent[:auth_token] = { value: person.auth_token }
      else
        cookies[:auth_token] = { value: person.auth_token }
      end
      redirect_back_or_default root_path
    else
      flash.now[:error] = "Bummer! There was a problem with the email or password that you entered."
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    flash[:info] = "You logged out successfully!"
    redirect_to root_path
  end
end
