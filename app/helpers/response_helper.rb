module ResponseHelper
  def ok(data, message = "Success", serializer_options: {})
    data = { data: ActiveModelSerializers::SerializableResource.new(data, serializer_options), message: message, code: 200 }
    render json: data, status: 200
  end

  def badRequest(data, message = "Bad request", serializer_options: {})
    data = { data: ActiveModelSerializers::SerializableResource.new(data, serializer_options), message: message, code: 400 }
    render json: data, status: 400
  end

  def notFound(data, message = "Not found", serializer_options: {})
    data = { data: ActiveModelSerializers::SerializableResource.new(data, serializer_options), message: message, code: 404 }
    render json: data, status: 404
  end

  def unauthorized(data, message = "Unauthorized", serializer_options: {})
    data = { data: ActiveModelSerializers::SerializableResource.new(data, serializer_options), message: message, code: 401 }
    render json: data, status: 401
  end
end
