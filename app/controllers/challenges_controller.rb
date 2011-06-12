class ChallengesController < ApplicationController
  def index
    if current_user.nil?
      redirect_to :controller=>'user_sessions', :action => 'new';
    end
    @challenges = Challenge.find_all_by_user_from_id(current_user.id)
    #puts "#{@challenges.count}"
    #@challenges
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
    if @challenge.save
      redirect_to @challenge, :notice => "Successfully created challenge."
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
    render 'my_challenges'
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to challenges_url, :notice => "Successfully destroyed challenge."
  end
end
