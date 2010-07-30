class WidgetsController < ApplicationController

  respond_to :html, :json

  def index
    respond_with Widget.all
  end
  
  def show
    @widget = Widget.find(params[:id])
    respond_with @widget
  end
  
  def new
    @widget = Widget.new
    respond_with @widget
  end
  
  def create
    @widget = Widget.new(params[:widget])
    flash[:notice] = 'Successfully created widget.' if @widget.save
    respond_with @widget
  end

  def edit
    @widget = Widget.find(params[:id])
    respond_with @widget
  end
  
  def update
    @widget = Widget.find(params[:id])
    flash[:notice] = 'Successfully updated widget.' if @widget.update_attributes(params[:widget])
    respond_with @widget
  end
  
  def destroy
    @widget = Widget.find(params[:id])
    flash[:notice] = 'Successfully removed widget.' if @widget.destroy
    respond_with @widget
    
  end
  
  
  
  
end
