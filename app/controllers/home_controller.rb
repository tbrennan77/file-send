class HomeController < ApplicationController
  before_filter :authenticate, :only => %w{admin}
  after_action :allow_iframe

  def index
    @bw_file = BwFile.new
    @bw_file.bw_attachments.build
  end

  def admin
    @bw_file = BwFile.new
    @bw_file.bw_attachments.build
    @files = BwFile.order('id DESC')
  end

  private

  def allow_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM http://bw.boondockwalkerstaging.com'
  end
end
