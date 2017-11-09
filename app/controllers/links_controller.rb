class LinksController < ApplicationController
  before_action :check_logged_in, only: :index

  def index
    @links = Link.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @link = Link.find(params[:id])
  end

  def redirect
    @link = Link.where(short_url: params[:short_url]).first
    @link.increment!(:clicks)

    redirect_to @link.original_url
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to link_url(@link)
    else
      render 'new'
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url, :clicks)
  end

end
