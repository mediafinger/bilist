class ItemsController < ApplicationController
  respond_to :html

  before_filter :get_items

  def index
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      flash[:notice] = 'added item to list'
    end

    render action: :index
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(update_params)
      flash[:notice] = 'updated item'
    end

    render action: :index
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = 'removed item from list'
    end

    render action: :index
  end


  private

    def get_items
      @items ||= Item.by_sorting
    end

    def create_params
      form_params = params.require(:item).permit(:source, :comment, :url, :done)
      { sorting: Item.count + 1 }.merge form_params
    end

    def update_params
      params.require(:item).permit(:sorting, :source, :comment, :url, :done)
    end

end
