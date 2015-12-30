class CommentsController < ApplicationController

  # before_action :set_comment
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_message
  def update
    # /newmessage/123/comments/456 == newmessage_comment_path(123,456)
    # Parameter = { :xxx => yyy, :jfisojfio => ffdhuhfe,
    # :newmessage_id => 123, :id => 456}
    # @comment = Comment.find(params[:id])
    @comment = @newmessage.comments.find(params[:id])
      if @comment.update(comment_params)
      redirect_to newmessage_path(@newmessage)
      flash[:notice] = "修改成功"
    else
      render "newmessages/show"
    end

  end

  def create
    @comment = Comment.new( comment_params )
    @comment.newmessage = @newmessage
    @comment.user = current_user
    if @comment.save
      redirect_to newmessage_path(@newmessage)
      flash[:notice] = "新增成功"
    else
      render "newmessages/show"
    end
  end

  def destroy
      @comment = @newmessage.comments.find(params[:id])
      @comment.destroy
      flash[:alert] = "刪除成功"
      redirect_to newmessage_path(@newmessage)
  end

  protected

  def comment_params
    params.require(:comment).permit(:comment, :newmessage_id, :user_id)
  end

# def set_comment
  # @comment = @newmessage.comments
# end

end
