class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  before_action :authorize_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /movies or /movies.json
  def index
    @movies = Movie.all.with_attached_poster
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

      if @movie.save
         redirect_to movie_url(@movie), notice: ("created")
      else
        render :new, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
      if @movie.update(movie_params)
         redirect_to movie_url(@movie), notice: ("updated")
      else
        render :edit, status: :unprocessable_entity 
      end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!
    redirect_to movies_url, notice: t(".destroyed")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :poster, :start_date, :end_date, :genre_id)
    end
end
