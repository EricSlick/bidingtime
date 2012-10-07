class WelcomeController < ApplicationController
  # GET /welcome
  def index
    @blogs = []
    @interviews = []
    @welcomes = []
    @essays = []
    if params[:interviews]
      @interviews = Article.where(:article_type_id => 3).order(:created_at).limit(1)
    elsif params[:blogs]
      @blogs = Article.where(:article_type_id => 2).order(:created_at).limit(1)
    elsif params[:essays]
    else
      @welcomes = Article.where(:article_type_id => 1).order(:created_at).limit(1)
      @blogs = Article.where(:article_type_id => 2).order(:created_at).limit(1)
      @interviews = Article.where(:article_type_id => 3).order(:created_at).limit(1)
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end

