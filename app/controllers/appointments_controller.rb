class AppointmentsController < ApplicationController

  # GET: /appointments
  get "/children/:slug/appointments" do
    if logged_in?
      @child = Child.find_by_slug(params[:slug])
      if @child && @child.parent == current_user
        erb :"/appointments/index_appointment"
      else
        redirect to "/children"
      end
    else 
      redirect to "/login"
    end    
  end

  # GET: /appointments/new
  get "/children/:slug/appointments/new" do
    if logged_in?
      @child = Child.find_by_slug(params[:slug])
      if @child && @child.parent == current_user
        erb :"/appointments/new_appointment"
      else
        redirect to '/children'
      end
    else
      redirect to '/login'
    end    
  end

  # POST: /appointments
  post "/children/:slug/appointments" do
    if logged_in?
      if params[:date] == "" || params[:time] == "" || params[:doctor] == ""
        redirect to '/children/appointments/new'
      else
        @child = Child.find_by_slug(params[:slug])
        #binding.pry
        @child.appointment.create(date: params[:date], time: params[:time], doctor: params[:doctor])
        redirect to "/children/#{@child.slug}/appointments"
      end
    else
      redirect to '/login'
    end
  end

  # GET: /appointments/5
  get "/children/:slug/appointments/:id" do
    if logged_in?
      @appointment = Appointment.find_by_id(params[:id])
      if @appointment && @appointment.child.parent == current_user
        erb :"/appointments/show_appointment"
      else
        redirect to "/childrent/#{@appointment.child.slug}/appointments"
      end
    else
      redirect to '/login'
    end    
  end

  # GET: /appointments/5/edit
  get "/children/:slug/appointments/:id/edit" do
    if logged_in?
      @appointment = Appointment.find_by_id(params[:id])
      if @appointment && @appointment.child.parent == current_user
        erb :"/appointments/edit_appointment"
      else
        redirect to "/children/#{@appointment.child.slug}/appointments"
      end
    else
      redirect to '/login'
    end    
  end

  # PATCH: /appointments/5
  patch "/children/:slug/appointments/:id" do
    if logged_in?
      if params[:date] == "" || params[:time] == "" || params[:doctor] == ""
        redirect to "/children/#{:slug}/appointment/#{params[:id]}"
      else
        @appointment = Appointment.find_by_id(params[:id])
        if @appointment && @appointment.child.parent == current_user
          if @appointment.update(date: params[:date], time: params[:time], doctor: params[:doctor])
            redirect to "/childrent/#{@appointment.child.slug}/appointments/#{params[:id]}"
          else
            redirect to "/children/#{:slug}/appointment/#{params[:id]}/edit"
          end
        else
          redirect to  "?children/#{@appointment.child.slug}/appointments"
        end
      end
    else
      redirect to "/login"
    end
  end

  # DELETE: /appointments/5/delete
  delete "/children/:slug/appointments/:id/delete" do
    if logged_in?
      @appointment = Appointment.find_by_id(params[:id])
      if @appointment && @appointment.child.parent == current_user
        @appointment.delete
      end
      redirect to "/children/#{:slug}/appointments"
    else
      redirect to '/login'
    end
  end
end
