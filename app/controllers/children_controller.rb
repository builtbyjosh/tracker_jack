class ChildrenController < ApplicationController

  # GET: /children
  get "/children" do
    @child = current_user.children.all
    erb :"/children/index_child"
  end

  # GET: /children/new
  get "/children/new" do
    erb :"/children/new_child"
  end

  # POST: /children
  post "/children" do
    if params[:name] == "" || params[:dob] == ""
      redirect to '/children/new'
    else
      @child = current_user.children.create(:name => params[:name], :dob => params[:dob])      
      redirect to '/index_child'
    end
  end

  get '/children/:slug' do
    @child = Child.find_by_slug(params[:slug])
    erb :'children/show_child'
  end

  get '/children/:slug/edit' do
    @child = Child.find_by_slug(params[:slug])
    erb :"/children/edit_child"
  end

  patch '/children/:slug' do
    @child = Child.find_by_slug(params[:slug])
    @child.update(name: params[:name], dob: params[:dob])
    redirect to "/children/#{@child.name.downcase}"
  end

  

  delete '/children/:slug/delete' do
    @child = Child.find_by_slug(params[:slug])
    @child.delete
    redirect to '/children'
  end

  

end
