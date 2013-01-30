class BwFilesController < ApplicationController
  def create
    @bw_file = BwFile.new params[:bw_file]
    @bw_file.user_id = current_user.id if current_user
    @bw_file.permalink = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join
    email = find_email
    if @bw_file.save
      Notifier.send_file(@bw_file, email).deliver
      redirect_to root_path, :notice => "File sent"
    else
      redirect_to root_path, :notice => "something went wrong"
    end
  end

  def destroy  
    bw_file = BwFile.find params[:id]
    bw_file.binary_file = nil
    bw_file.save
    bw_file.destroy  
  end

  def download
    puts Dir.pwd
    bw_file = BwFile.find_by_permalink params[:permalink]
    path = File.join(Dir.pwd, 'public', bw_file.binary_file.url(:original, false))
    file = File.read path
    send_data file, :filename => "#{bw_file.binary_file.original_filename}"
  end

  def find_email
    email = []
    if params[:bw_file][:email_ids]
      email << 'd1@dillonhafer.com' if params[:bw_file][:email_ids].include?('1')
      email << 'd2@dillonhafer.com' if params[:bw_file][:email_ids].include?('2')
      email << 'd3@dillonhafer.com' if params[:bw_file][:email_ids].include?('3')
      email << 'd4@dillonhafer.com' if params[:bw_file][:email_ids].include?('4')
      email << 'stipton@boondockwalker.com' if params[:bw_file][:email_ids].include?('5')
      email << 'dhafer@boondockwalker.com' if params[:bw_file][:email_ids].include?('6')
    end
    email.join(', ')
  end
end