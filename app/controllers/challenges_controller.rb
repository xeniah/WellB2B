class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(params[:challenge])
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

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to challenges_url, :notice => "Successfully destroyed challenge."
  end
end
