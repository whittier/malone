require 'csv'

class SendEmail
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :filename, :email_template_id, :uploaded_file, :data, :content_type, :count

  validates_length_of :filename, :maximum => 500, :minimum => 1

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    @count = 0
  end

  def persisted?
    false
  end

  def uploaded_file=(incoming_file)
    self.filename = incoming_file.original_filename
    self.content_type = incoming_file.content_type
    self.data = incoming_file.read
  end

  def send_all_emails()
    email_template = EmailTemplate.find(self.email_template_id)
    header = nil
    CSV.parse(data).each do |row|
      if (!header)
        header = row
      else
        data = Hash[header.zip row]
        send_one_email(email_template, data) unless row.empty?
      end
    end
    @count
  end

  def send_one_email(email_template, data)
    e_mail = {
        to: data['to'],
        subject: do_substitution(email_template.subject, data),
        body: do_substitution(email_template.body, data)
    }

    if (MaloneMailer.welcome_email(e_mail).deliver)
      @count = @count + 1
    end
  end

  def do_substitution(str, data_hash)
    puts "do_substitution ", str, data_hash
    str = str.clone
    data_hash.each do |k, v|
      str.gsub!('{{' + k.to_s + '}}', v)
    end
    str
  end

end