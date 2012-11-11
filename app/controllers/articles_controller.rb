class ArticlesController < AdminController
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    setup_show_vars
    if current_user.email == "guest"
      redirect_to root_path(@type.pluralize => @article.id)
      return
    end
    redirect_to login_path and return if cannot? :manage, :all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  def setup_show_vars
    @welcomes = []
    @abouts = []
    @contacts = []
    @blogs = []
    @interviews = []
    @lean_years = []
    @type = @article.article_type.name
    case @type
      when "welcome"
        @welcomes = [@article]
      when "blog"
        @blogs = [@article]
      when "interview"
        @interviews = [@article]
      when "about"
        @abouts = [@article]
      when "contact"
        @contacts = [@article]
      when "lean_years"
        @lean_years = [@article]
      else
        raise "Admin/Articles: Unknown article type (#{@article.article_type.name})"
    end

  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    @article.body = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum."
    @article.published_at = Time.now

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @article.published_at = Time.now if @article.published_at.blank?
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    setup_show_vars
    @articles = [@article]

    ## Get the initial html screen as it normally renders
    html = render_to_string("welcome/index",  :layout => "imaging")
    kit = IMGKit.new(html, :quality => 80)
    kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/welcome.css.scss.erb"
    kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/scaffolds.css.scss"
    @image = kit.to_img(:jpg)
    kit.to_file("#{Rails.root}/app/assets/images/html/article_#{@article.id}.jpg")
    render "welcome/index", :layout => "imaging"
    return

    ## image magick is being an ass on RubyMine so using html method to clip image
    #image = MiniMagick::Image.open("#{Rails.root}/app/assets/images/html/article_#{@article.id}.jpg")
    #image.resize "100x100"
    #image.write  "#{Rails.root}/app/assets/images/html/article_#{@article.id}.jpg"
    #render "clip_image", :layout => "clip_image"
    #return

    ## Use html to clip the image down to the size wanted
    #html = render_to_string "clip_image", :layout => "clip_image"
    #kit = IMGKit.new(html, :quality => 80)
    #kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/welcome.css.scss.erb"
    #@image = kit.to_img(:jpg)
    kit.to_file("#{Rails.root}/app/assets/images/html/article_#{@article.id}.jpg")

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
