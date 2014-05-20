class BwAttachment < ActiveRecord::Base  
  belongs_to :bw_file  
  has_attached_file :binary_file
  validates_attachment :binary_file,    
    presence: true
end
