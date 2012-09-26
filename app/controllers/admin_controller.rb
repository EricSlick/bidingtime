class AdminController < ApplicationController

  before_filter :check_authorization
  layout "application", :only => [:show]

  def index
  end

  def check_authorization
    redirect_to :root if cannot? :manage, :all
  end


end
