class MaloneMailer < ActionMailer::Base
  default :from => Rails.configuration.oc_malone_sender_email



  #def welcome_emails(email_template, data_list)
  #  data_list.each do |data|
  #    welcome_email(email_template, data)
  #  end
  #end

  def welcome_email(email)
    admin_address = Rails.configuration.oc_malone_admin_address || ""
    email[:to] = [admin_address, email[:to].to_s]
    mail(email)
  end
end
