class BooksController < ApplicationController
before_action :authenticate_user!, only: [:index, :show, :edit]
before_action :correct_user, only: [:edit, :update]
	def top
	end

	def about
	end

	def create
	    @book = Book.new(book_params)
	    @book.user_id= current_user.id
	    if  @book.save
	        redirect_to book_path(@book), notice: 'Created Book successfully'
	    else
	        @books = Book.all
	        @user = current_user
	        render 'index'
	    end
	end

	def index
	    @user = current_user
	  	@book = Book.new
	  	@books = Book.search(params[:search])
	end

	def show
	  	@show_book = Book.find(params[:id])
	    @user = @show_book.user
	    @book = Book.new
	    @book_comment = BookComment.new
	    @book_comments = @show_book.book_comments
	end

	def edit
	  	@book = Book.find(params[:id])
	end

	def update
	  	@book = Book.find(params[:id])

	  	if @book.update(book_params)
	       flash[:notice] = "updated Book successfully"
	       redirect_to book_path(@book.id)
	    else
	       render 'edit'
	    end
	end

	def destroy
	    @book = Book.find(params[:id])
	    @book.destroy
	    redirect_to books_path
	end

	private

	def book_params
	  	params.require(:book).permit(:title, :body, :user_id)
	end

	def correct_user
	    @book = Book.find(params[:id])
	    if current_user.id != @book.user_id
	       redirect_to books_path
	    end
	end
end
