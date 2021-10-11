class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    book = Book.find(params[:book_id])
    # comment = BookComment.new(book_comment_params)
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.user_id = current_user.id
    if  comment.save
      @book_comment = BookComment.new
      # book_comment = BookComment.new(book_comment_params)
      render :create
    end
    # redirect_to book_path(book)
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    @book = Book.find(params[:book_id])
    # redirect_to book_path(params[:book_id])
    render :destroy
  end

  private


  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
