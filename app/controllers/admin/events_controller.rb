# encoding: UTF-8

class Admin::EventsController < Admin::BasicAuthController
  def index
    @event = Event.new
    @events = Event.all
    @newest_event = Event.first
  end

  def create
    @event = Event.new(params[:event])
    caption = @event.save ? "Event utworzony dnia #{@event.datetime}!" : "Event nie został utworzony"
    redirect_to admin_path, alert: caption
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_path, alert: "Event usunięty"
  end

  def tasks
    @event = Event.find(params[:id])
    @event.update_tasks(params[:tasks])
    redirect_to admin_path, alert: "Lista zadań została uaktualniona"
  end
end
