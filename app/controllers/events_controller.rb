class EventsController < ApplicationController
   before_filter :authenticate_user!
def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.pdf do
        pdf = EventsPdf.new(@event, view_context)
        send_data pdf.render, filename: 
        "evento_#{@event.created_at.strftime("%d/%m/%Y")}.pdf",
        type: "application/pdf"
      end
    end
  end

  def new
    @event = Event.new
    @event.discount = 0


    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'event was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
    end
  end
end
