class GenresController < ApplicationController
  before_action :set_genre, only: %i[ show edit update destroy ]
  before_action :authorize_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!

  
  # GET /genres or /genres.json
  def index
    @genres = Genre.all
  end

  # GET /genres/new
  def new
    @genre = Genre.new
  end

  # GET /genres/1/edit
  def edit
  end

  # POST /genres or /genres.json
  def create
    @genre = Genre.new(genre_params)

      if @genre.save
          redirect_to genre_url(@genre), notice: t(".created")
      else
           render :new, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /genres/1 or /genres/1.json
  def update
      if @genre.update(genre_params)
         redirect_to genre_url(@genre), notice: t(".updated")
      else
         render :edit, status: :unprocessable_entity 
      end
  end

  # DELETE /genres/1 or /genres/1.json
  def destroy
    @genre.destroy!

     redirect_to genres_url, notice: t(".destroyed")
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:name)
    end
end
