class CardsController < ApplicationController
  def index
    @book = Bookcard.all
   
  end

  def show
    @book = Bookcard.find(params[:id])
  end

  def add
    if request.post? then
      Bookcard.create(book_params)
      goback
    else
      @book = Bookcard.new
    end
  end

  def edit
    @book = Bookcard.find(params[:id])
  end

  def update
    obj = Bookcard.find(params[:id])
    obj.update(book_params)
    redirect_to '/cards'
  end

  def delete
    Bookcard.find(params[:id]).destroy
    goback
  end

  def find
    @book = Bookcard.search(params[:search])
    
  end

  private 
  def book_params
    params.require(:bookcard).permit(:title, :author, :price, :publisher, :evaluation, :review)
  end

  def goback
    redirect_to '/cards'
  end
end
