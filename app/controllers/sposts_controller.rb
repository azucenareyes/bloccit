class SpostsController < ApplicationController
  def show
    @spost = Spost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @spost = Spost.new
  end

  def create
    @spost = Spost.new
    @spost.title = params[:spost][:title]
    @spost.body = params[:spost][:body]
    @spost.price = params[:spost][:price]
    @topic = Topic.find(params[:topic_id])
    @spost.topic = @topic
    if @spost.save
      flash[:notice] = 'Spost was saved.'
      redirect_to [@topic, @spost]
    else
      flash.now[:alert] = 'There was an error saving the spost. Please try again.'
      render :new
    end
  end

  def edit
    @spost = Spost.find(params[:id])
  end

  def update
    @spost = Spost.find(params[:id])
    @spost.title = params[:spost][:title]
    @spost.body = params[:spost][:body]
    @spost.price = params[:spost][:price]

    if @spost.save
      flash[:notice] = 'Spost was updated.'
      redirect_to [@spost.topic, @spost]
    else
      flash.now[:alert] = 'There was an error saving the spost. Please try again.'
      render :edit
    end
  end

   def destroy
     @spost = Spost.find(params[:id])

     if @spost.destroy
       flash[:notice] = "\"#{@spost.title}\" was deleted successfully."
       redirect_to @spost.topic
     else
       flash.now[:alert] = 'There was an error deleting the spost.'
       render :show
     end
  end
end
