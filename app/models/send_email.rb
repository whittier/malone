require 'csv'

class SendEmail
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :filename, :email_template_id, :uploaded_file, :data, :content_type

  validates_length_of :filename, :maximum => 500, :minimum => 1

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
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
    CSV.parse(data, headers: true).each do |row|
      data = create_data_hash(row)
      email_template = EmailTemplate.find(email_template_id)
      send_one_email
    end
  end

  def create_data_hash(row)
    {
        to: row[0],
        first_name: row[1],
        last_name: row[2],
        url: row[3],
        password: password

    }
  end

  def send_one_email()
    MaloneMailer.create_welcome_email()
  end

end