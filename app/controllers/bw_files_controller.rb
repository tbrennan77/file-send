class BwFilesController < ApplicationController
  before_filter :authenticate, :only => %w{admin_create index}

  def index
    @files = BwFile.order('id DESC')
  end

  def create
    @bw_file = BwFile.new(bw_file_params)
    if @bw_file.save      
      email = find_email
      Notifier.send_file(@bw_file, email).deliver
      redirect_to root_path, notice: "File sent"
    else
      flash[:errors] =  "something went wrong"
      render 'home/index'
    end
  end

  def admin_create
    @bw_file = BwFile.new params[:bw_file]
    if @bw_file.save      
      Notifier.send_file(@bw_file, @bw_file.receiver_email).deliver
      redirect_to admin_path, :notice => "File sent"
    else
      flash[:errors] =  "something went wrong"
      render 'home/admin'
    end
  end

  def destroy  
    bw_file = BwFile.find params[:id]
    bw_file.bw_attachments.each { |a| a.destroy }    
    bw_file.destroy
    redirect_to '/files'
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

  def bw_file_params
    params.require(:bw_file).permit(:name, bw_attachments_attributes: [:id, :binary_file, :_destroy], email_ids: [])
  end
end
