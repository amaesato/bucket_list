class BucketsController < ApplicationController
  before_action :bucket, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
    @bucket = Bucket.new
  end

  def create
    @bucket = Bucket.new(bucket_params)

    if @bucket.save
      redirect_to bucket_path(@bucket)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bucket.update(bucket_params)
      redirect_to bucket_path(@bucket)
    else
      render :edit
    end
  end

  def destroy
    @bucket.destroy
    redirect_to buckets_path
  end

  private

    def bucket_params
      params.require(:bucket).permit(:name, :theme, :complete_by, :image)
    end

    def bucket
      @bucket = Bucket.find(params[:id])
    end
end
