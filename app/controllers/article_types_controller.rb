class ArticleTypesController < AdminController
  # GET /article_types
  # GET /article_types.json
  def index
    @article_types = ArticleType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @article_types }
    end
  end

  # GET /article_types/1
  # GET /article_types/1.json
  def show
    @article_type = ArticleType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article_type }
    end
  end

  # GET /article_types/new
  # GET /article_types/new.json
  def new
    @article_type = ArticleType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article_type }
    end
  end

  # GET /article_types/1/edit
  def edit
    @article_type = ArticleType.find(params[:id])
  end

  # POST /article_types
  # POST /article_types.json
  def create
    @article_type = ArticleType.new(params[:article_type])

    respond_to do |format|
      if @article_type.save
        format.html { redirect_to @article_type, notice: 'Article type was successfully created.' }
        format.json { render json: @article_type, status: :created, location: @article_type }
      else
        format.html { render action: "new" }
        format.json { render json: @article_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /article_types/1
  # PUT /article_types/1.json
  def update
    @article_type = ArticleType.find(params[:id])

    respond_to do |format|
      if @article_type.update_attributes(params[:article_type])
        format.html { redirect_to @article_type, notice: 'Article type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_types/1
  # DELETE /article_types/1.json
  def destroy
    @article_type = ArticleType.find(params[:id])
    @article_type.destroy

    respond_to do |format|
      format.html { redirect_to article_types_url }
      format.json { head :no_content }
    end
  end
end
