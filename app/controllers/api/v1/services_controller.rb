class Api::V1::ServicesController < ApplicationController
  before_action :authenticate_api_user!
  before_action :load_service, only: [:show, :edit, :update, :destroy]

  def index
    services = Service.all
    render json: services, status: 200
  end

  def create
    service = Service.new(service_params)

    if service.save
      render json: service, status: 200
    else
      render json: { error: "Error creating the service." }
    end
  end

  def update
    service = Service.new(service_params)

    if service.save
      render json: service, status: 200
    else
      render json: { error: "Error creating the service." }
    end
  end

  def show
    render json: @service, status: 200
  end

  private

  def service_params
    params.require(:service).permit([
      :name,
      :description,
      :price,
    ])
  end

  def load_service
    @service = Service.find_by(id: params[:id])
    if service
      render json: service, status: 200
    else
      render json: { error: "Service not found." }
    end
  end
end
