class Api::V1::ReservesController < ApplicationController
  def index
    reserves = Reserve.all
    render json: reserves, status: 200
  end

  def create
    reserve = Reserve.new(reserve_params)

    if reserve.save
      render json: reserve, status: 200
    else
      render json: { error: "Error creating the reserve." }
    end
  end

  def show
    reserve = Reserve.find_by(id: params[:id])
    if reserve
      render json: reserve, status: 200
    else
      render json: { error: "Reserve not found." }
    end
  end

  private
  def reserve_params
    params.require(:reserve).permit([
      :name,
      :description
    ])
  end
end
