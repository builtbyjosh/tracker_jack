class MilestonesController < ApplicationController

  # GET: /milestones
  get "/children/:slug/milestones" do
    @child = Child.find_by_slug(params[:slug])
    erb :"/milestones/index_milestone"
  end

  # GET: /milestones/new
  get "/children/:slug/milestones/new" do
    @child = Child.find_by_slug(params[:slug])
    erb :"/milestones/new_milestone"
  end

  # POST: /milestones
  post "/children/:slug/milestones" do
    if params[:date] == "" || params[:content] == ""
      redirect to '/children/new'
    else
      @child = Child.find_by_slug(params[:slug])
      @child.milestones.create(:date => params[:date], :content => params[:content])      
      redirect to "/children/#{@child.name.downcase}/milestones"
    end
  end

  # GET: /milestones/5
  get ":slug/milestones/:id" do
    erb :"/milestones/show"
  end

  # GET: /milestones/5/edit
  get ":slug/milestones/:id/edit" do
    erb :"/milestones/edit"
  end

  # PATCH: /milestones/5
  patch ":slug/milestones/:id" do
    redirect "/milestones/:id"
  end

  # DELETE: /milestones/5/delete
  delete ":slug/milestones/:id/delete" do
    redirect "/milestones"
  end
end
