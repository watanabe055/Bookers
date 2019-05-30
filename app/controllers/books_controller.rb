class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index, :edit]
  before_action :correct_user,   only: [:edit, :update]

  def correct_user
      @book = current_user.books.find_by(id: params[:id])
      unless @book
          redirect_to root_books
      end
  end

	  def new
  		  @book = Book.new
  	end

  	def show
    		@book = Book.find(params[:id])
        @new_book = Book.new
        @user = @book.user
  	end

  	def index
    	 	@books = Book.all
    	 	@book = Book.new
        @user = current_user
        @users = User.all
  	end

  	def edit
  		  @book = Book.find(params[:id])
        if @book.user_id != current_user.id
          redirect_to books_path
        end
  	end

	  def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if  @book.save
            redirect_to book_path(@book.id)
            flash[:notice] = "You have creatad book successfully."
        else
          @books = Book.all
          @user = current_user
          @users = User.all
          render "books/index"
        end
    end

    def destroy
       	book = Book.find(params[:id])
       	book.destroy
       	redirect_to books_path
   	end

   	def update
  	    @book = Book.find(params[:id])
  	    if @book.update(book_params)
  	       redirect_to book_path(@book.id)
  	       flash[:notice] = "You have updated book successfully."
        else
          render "edit"
        end
  	end

    private
    def book_params
        params.require(:book).permit(:title , :body)
    end

    private
    def correct_user
    book = Book.find(params[:id])
    if current_user != book.user
      redirect_to books_path
    end
  end
end
