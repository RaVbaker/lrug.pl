# encoding: UTF-8

class PresentationsController < ApplicationController
  def edit
    @presentation = Presentation.find(params[:id])
    if current_user.blank?
      session[:presentation_id] = @presentation.id
      redirect_to '/auth/github'
    elsif session[:presentation_id] == @presentation.id || current_user.lecture?(@presentation)
      render :action => 'edit'
    else
      redirect_to root_path
    end
  end

  def update
    @presentation = Presentation.find(params[:id])
    @presentation.topic = params[:presentation][:topic]
    @presentation.user = current_user
    if @presentation.save
      redirect_to root_path
    else
      flash.now.alert = 'Prezentacja nie została zgłoszona'
      render :action => 'edit'
    end
  end
end
