# Preview all emails at http://localhost:3000/rails/mailers/notifier
class NotifierPreview < ActionMailer::Preview
  def send_file
    Notifier.send_file(BwFile.first, 'dh@dillonhafer.com')
  end
end
