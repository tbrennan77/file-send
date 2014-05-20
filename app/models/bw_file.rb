class BwFile < ActiveRecord::Base
  attr_accessor :email_ids

  has_many :bw_attachments 
  accepts_nested_attributes_for :bw_attachments

  validates :email_ids, :presence => { :message => "You should send the file to at least one person." }
end
