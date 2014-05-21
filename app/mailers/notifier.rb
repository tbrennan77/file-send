class Notifier < ActionMailer::Base
  
  def send_file(bw_file, email)
    @bw_file = bw_file

    delivery_options = {address:    "box695.bluehost.com",
                        port:       465,            
                        user_name:  'no-reply@boondockwalker.com',
                        password:   '5}8JeTWQoB!+',  
                        authentication: :login,
                        tls: true,
                        enable_starttls_auto: true
                        }

    mail(from: "BW Files <no-reply@boondockwalker.com>", 
         to: email,
         subject: "Someone sent you a file!",
         delivery_method_options: delivery_options)
  end

  def clean_up_email(files)
    @files = files
    mail(:from => "BW Files <no-reply@send.boondockwalker.com>", :to => 'dh@dillonhafer.com', :subject => "Clean up report")
  end
  
end
