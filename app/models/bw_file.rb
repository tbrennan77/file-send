class BwFile < ActiveRecord::Base
  belongs_to :user
  attr_accessor :email_ids
  attr_accessible :name, :receiver_email, :binary_file, :email_ids
  has_attached_file :binary_file    

  validates :email_ids, :presence => { :message => "You should send the file to at least one person." }
  validates :binary_file, :presence => { :message => "It looks like there's no file attached." }

  def self.clean_up
    messages = {:file => []}    
    bw_files = BwFile.where("created_at::date < '#{Date.today.advance(:days => -30)}'::date") || []
    bw_files.each do |bw|
      message[:file][] << bw.binary_file.original_file_name
      bw.binary_file = nil
      bw.save
      bw.destroy
    end

    Notifier.clean_up_email(messages) unless messages[:file].empty?
  end

end
