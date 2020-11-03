class ParentsController < ApplicationController

  get '/login' do    
    erb :"parents/login_parent"    
  end

  post '/login' do
    user = Parent.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/children"
    else
      redirect to '/signup'
    end
  end


  get '/signup' do    
    erb :"/parents/signup_parent"
  end

  post '/signup' do
    if params[:name] == "" || params[:email] == "" || params[:password] == ""
        redirect to '/signup'
    else
        @user = Parent.new(:name => params[:name], :email => params[:email], :password => params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect to '/children'
    end
  end

  # get '/homepage' do
  #   @child = current_user.children.all
  #   erb :"/parents/index_parent"
  # end

  get '/logout' do
    if logged_in?
        session.destroy
        redirect to '/login'
    else
        redirect to '/'
    end
end
end
