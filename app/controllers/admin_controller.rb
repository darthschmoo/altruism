class AdminController < ApplicationController
  begin
    require_role :admin
  rescue Exception => e
    debugger
    nil
  end

  def index
    render :text => "hello"
  end
end
