class WelcomeController < ApplicationController
  # GET /welcome
  def index
    if params[:interviews]
      @articles = Interview.all
    else
      @articles = Blog.all
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end

