class AdminController < ApplicationController

  before_filter :check_authorization, :except => [:show]
  layout "application", :only => [:show]

  def index
  end

  def check_authorization
    redirect_to login_path if cannot? :manage, :all
  end


end
