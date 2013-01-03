class SendEmailController < ApplicationController

  def prepare_to_send
    @email_template = EmailTemplate.find(params[:id])
    @send_email = SendEmail.new
    @send_email.email_template_id = @email_template.id
    respond_to do |format|
      format.html # prepare_to_send.html.erb
      format.json { render json: @email_template }
    end
  end

  def send_email
    @email_template = EmailTemplate.find(params[:id])
    @email_count = 1
    respond_to do |format|
      format.html # prepare_to_send.html.erb
      format.json { render json: @email_template }
    end
  end
end
