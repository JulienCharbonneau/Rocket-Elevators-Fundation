# frozen_string_literal: true

module Types
  class BuildingdetailType < Types::BaseObject
    field :id, ID, null: false
    field :key, String, null: false
    # field :building_id, ID, null: false
    field :value, GraphQL::Types::ISO8601DateTime, null: false
    
  end
end
