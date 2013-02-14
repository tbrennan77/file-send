class BwAttachment < ActiveRecord::Base
  belongs_to :bw_file
  attr_accessible :binary_file, :permalink
  has_attached_file :binary_file

  def create_permalink
    self.update_attributes :permalink => SecureRandom.urlsafe_base64
  end
end