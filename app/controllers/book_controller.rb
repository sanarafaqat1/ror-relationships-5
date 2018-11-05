class BookController < ApplicationController
  http_basic_authenticate_with name: "Sana", password: "1234", except: [:index, :show]
  def index
    @books = Book.all
  end

  def show
      @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end
  def create
     # render plain: params[:post].inspect
     @book = Book.new(book_params)
      if (@book.save)
      redirect_to @book
      else
       render 'new'
      end
   end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if (@book.update (book_params))
    redirect_to @book
    else
      render 'edit'
    end
  end
  def destroy
    @book = Book.find(params[:id]).destroy

    redirect_to book_path
  end
  private def book_params
    params.require(:book).permit(:title, :page_count, :author_id)
  end
end
