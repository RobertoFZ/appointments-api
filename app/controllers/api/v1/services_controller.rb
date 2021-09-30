class Api::V1::ServicesController < ApplicationController
  include ResponseHelper
  before_action :authenticate_api_user!
  before_action :load_service, only: [:show, :edit, :update, :destroy]

  def index
    services = Service.all
    ok(services)
  end

  def create
    service = Service.new(service_params)

    if service.save
      ok(service.to_json)
    else
      badRequest(nil, "Error creating the service.")
    end
  end

  def update
    service = Service.new(service_params)

    if service.save
      ok(service.to_json)
    else
      badRequest(nil, "Error creating the service.")
    end
  end

  def show
    ok(@service)
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
    unless @service
      notFound(nil, "Service not found.")
    end
  end
end
