class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  def destroy
    comment = BookComment.find(params[:id])
    comment.destroy
    redirect_to books_path(comment)
  end


  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end


end