class BooksController < ApplicationController
  # GET /books
  # GET /books.xml
	def index
		case params[:sort]
		when 'created_at'
			@books = Book.all :order => 'created_at DESC', :limit => 10
			@books = @books.paginate :page => params[:page], :include => :author, :order => 'created at DESC'
		else
			@books = Book.paginate :page => params[:page], :include => :author, :order => 'LOWER(title) ASC'
		end
		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @books }
		end
	end

	# GET /books/overview
	def overview
		@num_books = Book.count
		@num_authors = Author.count
		@last_update = Book.count
		
		respond_to do |format|
			format.html # overview.html.erb
		end
	end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
    end
  end

	# GET /books/search/query
  # GET /books/search/query.xml
  def search
	
		if params[:id].nil?
			redirect_to :action => 'search', :id => params[:query]
		else
	    @books = Book.search_for(params[:id]).paginate :page => params[:page], :include => :author, :order => 'title ASC'

	    respond_to do |format|
	      format.html { render 'index' }
	      format.xml  { render :xml => @books }
	    end
		end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(@book) }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        flash[:notice] = 'Book was successfully updated.'
        format.html { redirect_to(@book) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end
end
