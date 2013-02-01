class HomeController < ApplicationController
  before_filter :authenticate, :only => %w{admin}

  def index
    @bw_file = BwFile.new
  end

  def admin
    @bw_file = BwFile.new
  end
end
