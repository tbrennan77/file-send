class BwFilesController < ApplicationController
  def create
    @bw_file = BwFile.new params[:bw_file]
    @bw_file.user_id = current_user.id if current_user
    if @bw_file.save
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
end
