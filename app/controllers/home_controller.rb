class HomeController < ApplicationController
  def index
    @user = User.new
    @bw_file = BwFile.new
  end
end
