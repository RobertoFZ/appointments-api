class ResponseSerializer < ActiveModel::Serializer
  attributes :data, :message, :code
end
