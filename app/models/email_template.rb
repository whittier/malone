class EmailTemplate < ActiveRecord::Base
   attr_accessible :name, :subject, :body
end
