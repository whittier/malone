class EmailTemplate < ActiveRecord::Base
   attr_accessible :name, :subject, :body

   validates :name, :subject, :body, presence: true

end
