class NewmessagesController < ApplicationController

# before_action :authenticate_user!, :except => [:index]

    before_action :set_newmessage, :only =>[:show, :update, :edit, :destroy]


  def index
    @newmessages = Newmessage.page(params[:page]).per(5)


  end

  def new
    @newmessage = Newmessage.new
  end

  def create
    @newmessage = Newmessage.new( newmessage_params )
      # @event.user = current_user
    if @newmessage.save
      flash[:notice] = "新增成功"
        redirect_to newmessages_url
    else
    render :action => :new   # new.html..erb
        # 當輸入沒填滿則顯示警告視窗
    end
  end

  def edit

  end

  def update


     if@newmessage.update(newmessage_params)

      flash[:notice] = "編輯成功"

      redirect_to newmessage_url
    else
      render :action => :edit
   end
 end


   def destroy

      @newmessage.destroy

      flash[:alert] = "刪除成功"

      redirect_to newmessages_url(:page => params[:page])
    end



       private

  def set_newmessage
      @newmessage = Newmessage.find(params[:id])
  end

   def newmessage_params
    params.require(:newmessage).permit(:topic, :content, :category_id, :user_id)
   end

end


