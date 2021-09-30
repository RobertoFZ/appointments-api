class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :price, :description, :created_at
end
