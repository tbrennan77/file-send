class Notifier < ActionMailer::Base
  
  def send_file(bw_file, email)
    @bw_file = bw_file
    mail(:from => "BW Files <no-reply@send.boondockwalker.com>", :to => email, :subject => "Someone sent you a file!")
  end

  def clean_up_email(files)
    @files = files
    mail(:from => "BW Files <no-reply@send.boondockwalker.com>", :to => 'dh@dillonhafer.com', :subject => "Clean up report")
  end
  
end