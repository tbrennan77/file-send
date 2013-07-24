class BwFilesController < ApplicationController
  before_filter :authenticate, :only => %w{admin_create}

  def create
    @bw_file = BwFile.new params[:bw_file]
    if @bw_file.save
      @bw_file.bw_attachments.each { |a| a.create_permalink }
      email = find_email
      Notifier.send_file(@bw_file, email).deliver
      redirect_to root_path, :notice => "File sent"
    else
      flash[:errors] =  "something went wrong"
      render 'home/index'
    end
  end

  def admin_create
    @bw_file = BwFile.new params[:bw_file]
    if @bw_file.save
      @bw_file.bw_attachments.each { |a| a.create_permalink }
      Notifier.send_file(@bw_file, @bw_file.receiver_email).deliver
      redirect_to admin_path, :notice => "File sent"
    else
      flash[:errors] =  "something went wrong"
      render 'home/admin'
    end
  end

  def destroy  
    bw_file = BwFile.find params[:id]
    bw_file.binary_file = nil
    bw_file.save
    bw_file.destroy  
  end

  def download
    bw_file = BwAttachment.find_by_permalink params[:permalink]
    if bw_file
      path = File.join(Dir.pwd, 'public', bw_file.binary_file.url(:original, false))
      file = File.read path
      send_data file, :filename => "#{bw_file.binary_file.original_filename}"
    else
      redirect_to missing_path
    end
  end

  def find_email
    email = []
    if params[:bw_file][:email_ids]
      email << 'cnagy@boondockwalker.com' if params[:bw_file][:email_ids].include?('1')
      email << 'mnead@boondockwalker.com' if params[:bw_file][:email_ids].include?('2')
      email << 'bwillse@boondockwalker.com' if params[:bw_file][:email_ids].include?('3')
      email << 'dchristopher@boondockwalker.com' if params[:bw_file][:email_ids].include?('4')
      email << 'stipton@boondockwalker.com' if params[:bw_file][:email_ids].include?('5')
      email << 'dhafer@boondockwalker.com' if params[:bw_file][:email_ids].include?('6')
      email << 'tbrennan@boondockwalker.com' if params[:bw_file][:email_ids].include?('7')
    end
    email.join(', ')
  end 
end