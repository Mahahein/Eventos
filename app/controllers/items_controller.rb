class ItemsController < ApplicationController
  respond_to :js
  before_filter :load_order

  def create
    @item = @event.items.build(params[:item])
    @item.save

    respond_with @item
  end

  def update
    @item = @event.items.find(params[:id])
    @item.update_attributes(params[:item])

    respond_with @item
  end

  def destroy
    @item = @event.items.find(params[:id])
    @item.destroy

    respond_with @item
  end
  
  def load_order
    @event = Event.find(params[:event_id])
  end

end
