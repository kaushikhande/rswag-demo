class Api::V1::PetsController < ApplicationController
  before_action :set_api_v1_pet, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error


  # GET /api/v1/pets
  def index
    @api_v1_pets = Pet.all

    render json: @api_v1_pets
  end

  # GET /api/v1/pets/1
  def show
    render json: @api_v1_pet
  end

  # POST /api/v1/pets
  def create
    @api_v1_pet = Pet.new(api_v1_pet_params)

    if @api_v1_pet.save
      render json: @api_v1_pet, status: :created
    else
      render json: @api_v1_pet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/pets/1
  def update
    if @api_v1_pet.update(api_v1_pet_params)
      render json: @api_v1_pet
    else
      render json: @api_v1_pet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/pets/1
  def destroy
    @api_v1_pet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_pet
      @api_v1_pet = Pet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_pet_params
      params.fetch(:pet).permit(:name, :photo_url, :status)
    end

    def handle_error(e)
      render json: { error: e.to_s }, status: :not_found
    end
end
