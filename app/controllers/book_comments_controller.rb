class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment_item = @book_comment.book
    if @book_comment.save
      @book_comment_item.create_notification_book_comment!(current_user, @book_comment.id)
      flash[:success] = "Comment was successfully created."
    else
      @book_new = Book.new
      @book_comments = @book.book_comments
      render '/books/show'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find(params[:id])
    if @book_comment.user == current_user
      @book_comment.destroy
    end
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
