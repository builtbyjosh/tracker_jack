class MilestonesController < ApplicationController
  
  # GET: /milestones
  get "/children/:slug/milestones" do
    if logged_in?
      @child = Child.find_by_slug(params[:slug])
      if @child && @child.parent == current_user
        erb :"milestones/index_milestone"
      else
        redirect '/children'
      end
    else
      redirect to '/login'
    end
  end

  # GET: /milestones/new
  get "/children/:slug/milestones/new" do
    if logged_in?
      @child = Child.find_by_slug(params[:slug])
      if @child && @child.parent == current_user
        erb :"/milestones/new_milestone"
      else
        redirect to "/children/#{:slug}/milestones"
      end
    else
      redirect to '/login'
    end
  end

  # POST: /milestones
  post "/children/:slug/milestones" do
    if logged_in?
      if params[:date] == "" || params[:content] == ""
        redirect to '/children/milestones/new'
      else
        @child = Child.find_by_slug(params[:slug])
        @child.milestones.create(:date => params[:date], :content => params[:content])      
        redirect to "/children/#{@child.slug}/milestones"
      end
    else
      redirect to '/login'
    end    
  end

  # GET: /milestones/5
  get "/children/:slug/milestones/:id" do
    if logged_in?
      @milestone = Milestone.find_by_id(params[:id])
      if @milestone && @milestone.child.parent == current_user
        erb :"/milestones/show_milestone"
      else
        redirect to "/children"
      end
    else
      redirect to '/login'
    end
  end

  # GET: /milestones/5/edit
  get "/children/:slug/milestones/:id/edit" do
    if logged_in?
      @milestone = Milestone.find_by_id(params[:id])
      if @milestone && @milestone.child.parent == current_user
        erb :"/milestones/edit_milestone"
      else
        redirect to "/children/#{@milestone.child.slug}/milestones"
      end
    else
      redirect to '/login'
    end    
  end

  # PATCH: /milestones/5
  patch "/children/:slug/milestones/:id" do
    if logged_in?
      if params[:date] == "" || params[:content] == ""
        redirect to "/children/#{:slug}/milestones"
      else
        @milestone = Milestone.find_by_id(params[:id])
        if @milestone && @milestone.child.parent == current_user
          if @milestone.update(date: params[:date], content: params[:content])
            redirect to "/children/#{@milestone.child.slug}/milestones/#{params[:id]}"
          else
            redirect to "/children/#{@milestone.child.slug}/milestones/#{params[:id]}/edit"
          end
        else
          redirect to "/children/#{@milestone.child.slug}/milestones"
        end
      end
    else
      redirect to '/login'
    end    
  end

  # DELETE: /milestones/5/delete
  delete "/children/:slug/milestones/:id/delete" do    
    if logged_in?
      @milestone = Milestone.find_by_id(params[:id])
      if @milestone && @milestone.child.parent == current_user
        @milestone.delete
      end
      redirect to "/children/#{:slug}/milestones"
    else
      redirect to '/login'
    end
  end
end
