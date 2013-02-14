class HomeController < ApplicationController
  before_filter :authenticate, :only => %w{admin}

  def index
    @bw_file = BwFile.new
    @bw_file.bw_attachments.build
  end

  def admin
    @bw_file = BwFile.new
    @bw_file.bw_attachments.build
  end
end
