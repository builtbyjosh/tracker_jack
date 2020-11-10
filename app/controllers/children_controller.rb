class ChildrenController < ApplicationController

  # GET: /children
  get "/children" do
    if logged_in?
      @child = current_user.children.all
      erb :"/children/index_child"
    else
      redirect to '/login'
    end
  end

  # GET: /children/new
  get "/children/new" do
    if logged_in?
      erb :"/children/new_child"
    else
      redirect to '/login'
    end
  end

  # POST: /children
  post "/children" do
    if logged_in?
      if params[:name] == "" || params[:dob] == ""
        redirect to '/children/new'
      else
        @child = current_user.children.create(:name => params[:name], :dob => params[:dob])      
        redirect to '/children'
      end
    else
      redirect to '/login'
    end
  end

  get '/children/:slug' do
    if logged_in?
      @child = Child.find_by_slug(params[:slug])
      if @child && @child.parent == current_user
        if @child.appointment != nil 
          @appointment = @child.appointment.last
        end
        if @child.milestones != nil
          @milestone = @child.milestones.last
        end
        erb :'children/show_child'
      else
        redirect to '/children'
      end
    end
  end

  get '/children/:slug/edit' do
    if logged_in?
      @child = Child.find_by_slug(params[:slug])
      if @child && @child.parent == current_user
        erb :"/children/edit_child"
      else
        redirect to '/children'
      end
    else
      redirect '/login'
    end
  end

  patch '/children/:slug' do
    if logged_in?
      if params[:name] == "" || params[:dob] == ""
        redirect to "/children/#{:slug}"
      else
        @child = Child.find_by_slug(params[:slug])
        if @child && @child.parent == current_user
          if @child.update(name: params[:name], dob: params[:dob])
            redirect to "/children/#{@child.name.downcase}"
          else
            redirect to "/children/#{@child.name.downcase}/edit"
          end
        else
          redirect to '/children'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/children/:slug/delete' do
    if logged_in?
      @child = Child.find_by_slug(params[:slug])
      if @child && @child.parent == current_user
        @child.delete
      end
      redirect to '/children'
    else
      redirect to '/login'
    end
  end
end
