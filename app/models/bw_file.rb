class BwFile < ActiveRecord::Base
  belongs_to :user
  attr_accessor :email_ids
  attr_accessible :name, :receiver_email, :binary_file, :email_ids
  has_attached_file :binary_file    

  validates :email_ids, :presence => { :message => "You should send the file to at least one person." }
  validates :binary_file, :presence => { :message => "It looks like there's no file attached." }

end
