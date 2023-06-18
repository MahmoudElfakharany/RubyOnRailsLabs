class TracksController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, except: [:index, :show]
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  def index
    @tracks = Track.all
  end

  def show
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to @track, notice: 'successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @track.update(track_params)
      redirect_to @track, notice: 'successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @track.destroy
    redirect_to tracks_url, notice: 'successfully destroyed.'
  end

  private

  def set_track
    @track = Track.find(params[:id])
    unless @track
      redirect_to tracks_url, alert: 'Track not found.'
    end
  end

  def track_params
    params.require(:track).permit(:name, :description)
  end

  def authorize_admin!
    unless current_user.admin?
      redirect_to root_path, alert: "You don't have permission to perform this action."
    end
  end
end