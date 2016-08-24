class ItemsController < ApplicationController
  before_action :bucket
  before_action :item, except: [:index, :new, :create]
  def show
  end

  def new
  end

  def create
    @item = @bucket.items.new(item_params)
    if @item.save
      redirect_to bucket_path(@bucket)
    else
      render :new
    end
  end

  def edit
  end

  def update
  if @item.update(item_params)
    redirect_to bucket_item_path(@bucket, @item)
  else
    redirect_to :edit
  end
end

def destroy
  @item.destroy
  redirect_to bucket_path(@bucket)
end

  private

    def item_params
      params.require(:item).permit(:item_name, :note, :done, :image)
    end

    def bucket
      @bucket = Bucket.find(params[:bucket_id])
    end

    def item
      @item = @bucket.items.find(params[:id])
    end
end
