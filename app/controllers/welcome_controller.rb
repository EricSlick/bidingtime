class WelcomeController < ApplicationController
  # GET /welcome
  def index
    @blogs = []
    @interviews = []
    @welcomes = []
    @abouts = []
    @contacts = []
    @essays = []
    if params[:interviews]
      if params[:interviews] == "view"
        @interviews = Article.where(:article_type_id => 3, :published => true).order("created_at desc").limit(1)
      else
        @interviews = [Article.find(params[:interviews])]
      end
    elsif params[:blogs]
      if params[:blogs] == "view"
        @blogs = Article.where(:article_type_id => 2, :published => true).order("created_at desc").limit(1)
      else
        @blogs = [Article.find(params[:blogs])]
        @previous = Article.where("id < ? and article_type_id = ? and published = ?", @blogs[0].id, @blogs[0].article_type_id, true).first
        @next = Article.where("id > ? and article_type_id = ? and published = ?", @blogs[0].id, @blogs[0].article_type_id, true).first
      end
    elsif params[:about]
      @abouts = Article.where(:article_type_id => 4, :published => true).order("created_at desc").limit(1)
    elsif params[:contact]
      @contacts = Article.where(:article_type_id => 5, :published => true).order("created_at desc").limit(1)
    elsif params[:essays]
    else
      @welcomes = Article.where(:article_type_id => 1, :published => true).order("created_at desc").limit(1)
      @blogs = Article.where(:article_type_id => 2, :published => true).order("created_at desc").limit(1)
      @interviews = Article.where(:article_type_id => 3, :published => true).order("created_at desc").limit(1)
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end

