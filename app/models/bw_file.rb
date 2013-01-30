class BwFile < ActiveRecord::Base
  belongs_to :user
  attr_accessor :email_ids
  attr_accessible :name, :receiver_email, :binary_file, :email_ids
  has_attached_file :binary_file    
end
