class NewmessagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index

    if params[:cid]
      @category = Category.find( params[:cid] )
      @newmessages = @category.newmessages
    else
      @newmessages = Newmessage.all
    end

    @newmessages = @newmessages.page(params[:page]).per(10)

    #Parameter = {hfsj jfidshi fd , :category => "xxx"}
    # if params[:category]
    # @category = Category.find(params[:id])
     # @category.newmessages = @newmessage
     # @newmessage.category = @category
    # @newmessages = Newmessage.where().page(params[:page]).per(10)

    # prepare_variable_for_index_template


  end

  def show
    @newmessage = Newmessage.find(params[:id])
    @newmessage.user= current_user
    # @newmessage.view_count += 1



    if params[:cid]
    @comment = Comment.find(params[:cid])
    else
    @comment = Comment.new
    end
  end

  def new
    @newmessage = Newmessage.new
  end

  def create
    @newmessage = Newmessage.new( newmessage_params )
    @newmessage.user = current_user
    if @newmessage.save
      flash[:notice] = "新增成功"
        redirect_to newmessages_url
    else
    render :action => :new   # new.html..erb
        # 當輸入沒填滿則顯示警告視窗
    end

  end

  def edit
    @newmessage = Newmessage.find(params[:id])

  end

  def update

      @newmessage = Newmessage.find(params[:id])
      if@newmessage.update(newmessage_params)

      flash[:notice] = "編輯成功"

      redirect_to newmessage_url
       else
      render :action => :edit
     end
  end


   def destroy
       @newmessage = Newmessage.find(params[:id])

       @newmessage.destroy
      # @comments.newmessage = @newmessage

       flash[:alert] = "刪除成功"

       redirect_to newmessages_url(:page => params[:page])
    end


       private


  # def prepare_variable_for_index_template

    # if params[:keyword]
        # @newmessages = Newmessage.where(["name like ?", "%#{params[:keyword]}%" ] )
    # else
        # @newmessages = Newmessage.all
  # end

    # if params[:category => 1]
        # sort_by = (params[:category] == 1 )? 'name' : 'id'
        # @newmessages = @newmessages.order(sort_by)
    # end

      # @newmessages =@newmessages.page(params[:page]).per(5)


   def newmessage_params
    params.require(:newmessage).permit(:topic, :content, :category_id, :user_id)
   end

end


