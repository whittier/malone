class MaloneMailer < ActionMailer::Base
  default :from => Rails.configuration.oc_malone_sender_email



  #def welcome_emails(email_template, data_list)
  #  data_list.each do |data|
  #    welcome_email(email_template, data)
  #  end
  #end

  def welcome_email(email_template, data)
    admin_address = Rails.configuration.oc_malone_admin_address || ""
    admin_address
    mail(to: [admin_address,  data[:to]],
         subject: email_template.subject,
         body:  email_template.body)
  end
end
