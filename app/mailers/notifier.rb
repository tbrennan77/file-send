class Notifier < ActionMailer::Base
  
  def send_file(bw_file, email)
    @bw_file = bw_file
    mail(:from => "BW Files <dh@dillonhafer.com>", :to => email, :subject => "Someone sent you a file!")
  end

  def new_user(user)
    @user = user
    mail(:from => ".com", :to => @user.email, :subject => "Welcome to Pulse 18!")
  end
  
  def send_receipt(order)
    @order = order
    mail(:from => ".com", :to => @order.email, :subject => "Your reciept for order #: #{@order.order_number}")
  end

  def send_donation_receipt(donation)
    @donation = donation
    mail(:from => ".com", :to => @donation.email, :subject => "Your reciept for donation #: #{@donation.order_number}")
  end
  
  def password_reset(user)
    @user = user
    mail(:from => ".com", :to => @user.email, :subject => "Password reset")
  end
  
  def push_notification(to, message)
    @message = message
    mail(:from => "text-.com", :to => to, :subject => "Action Required")
  end
  
end