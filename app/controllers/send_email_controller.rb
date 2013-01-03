class SendEmailController < ApplicationController

  def send (param1, param2)
    @email_template = EmailTemplate.find(params[:id])

    puts ("Hello World")
    puts(params[:id] + " is going to be sent  ")

    respond_to do |format|
      format.html # send.html.erb
      format.json { render json: @email_template }
    end
  end
end
