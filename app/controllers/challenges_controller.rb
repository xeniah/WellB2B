class ChallengesController < ApplicationController
  def index
    if current_user.nil?
      redirect_to :controller=>'user_sessions', :action => 'new';
    end
    @challenges = Challenge.find_all_by_user_from_id(current_user.id)
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(params[:challenge])
    @challenge[:user_from_id] = current_user.id
    @challenge[:complete_dt] = nil;
    @challenge[:accepted_dt] = nil;
    if @challenge.save
      #render :action => "sent_challenges", :object => @challenges
      #redirect_to :action => "sent_challenges"
      #redirect_to @challenge, :notice => "Successfully created challenge."
      render :action => 'sent_challenges'
    else
      render :action => 'new'
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])
    
    if @challenge.update_attributes(params[:challenge])
      redirect_to @challenge, :notice  => "Successfully updated challenge."
    else
      render :action => 'edit'
    end
  end
  
  def my_challenges
    #@challenges = Challenge.find_all_by_user_to_id(current_user.id)
    respond_to do |format|
      format.html # 
     # format.xml { render :xml => @user_session }
    end
     # render 'my_challenges';
  end
  
  def sent_challenges
    #@challenges = Challenge.find_all_by_user_from_id(current_user.id)
    respond_to do |format|
      format.html # 
     # format.xml { render :xml => @user_session }
    end
     # render 'my_challenges';
  end
  
  

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to challenges_url, :notice => "Successfully destroyed challenge."
  end
end
