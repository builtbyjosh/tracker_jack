class MilestonesController < ApplicationController

  # GET: /milestones
  get "/milestones" do
    erb :"/milestones/index.html"
  end

  # GET: /milestones/new
  get "/milestones/new" do
    erb :"/milestones/new.html"
  end

  # POST: /milestones
  post "/milestones" do
    redirect "/milestones"
  end

  # GET: /milestones/5
  get "/milestones/:id" do
    erb :"/milestones/show.html"
  end

  # GET: /milestones/5/edit
  get "/milestones/:id/edit" do
    erb :"/milestones/edit.html"
  end

  # PATCH: /milestones/5
  patch "/milestones/:id" do
    redirect "/milestones/:id"
  end

  # DELETE: /milestones/5/delete
  delete "/milestones/:id/delete" do
    redirect "/milestones"
  end
end
