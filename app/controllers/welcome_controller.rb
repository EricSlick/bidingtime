class WelcomeController < ApplicationController
  # GET /welcome
  def index
    @blogs = []
    @interviews = []
    @welcomes = []
    if params[:interviews]
      @interviews = Article.all
    elsif params[:blogs]
      @blogs = Article.all
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

