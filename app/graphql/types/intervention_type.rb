# frozen_string_literal: true

module Types
  class InterventionType < Types::BaseObject
    field :id, ID, null: false
    field :employeeId, Integer, null: false
    field :batteryId, Integer, null: false
    field :columnId, Integer, null: true
    field :elevatorId, Integer, null: true
    # field :interventionStartAt, GraphQL::Types::ISO8601DateTime, null: false
    # field :interventionEndAt, GraphQL::Types::ISO8601DateTime, null: true
    field :result, String, null: false
    field :report, String, null: false
    field :status, String, null: false
    field :buildingId, Integer, null: false
    # field :buildingdetails, [Types::Buildingdetail] , null: true
    field :interventionStartAt, String, null: false
    field :interventionEndAt, String
    field :building, Types::BuildingType , null: true
    # field :building, Types::BuildingType , null: true
    def building
      Building.find(object.buildingId)
    end

    
  #   def building
  #     Building.where(id: object.buildingId)
  #  end 
    
    field :buildingdetail, Types::BuildingDetailType, null: false
    def buildingdetail
       BuildingDetail.find(object.buildingId)
    end


    # field :address, [Types::AddressType], null: false do
    #   argument :id, ID, required: true
    # end
    # def address
    #   Address.all
    # end
    # field :building, Types::
    # Building.find(object.building_id)


    # def buildingdetails
    #   BuildingDetail.all
    # end
  
    # def user(id:)
    #   User.find(id)
    # end4
  end
end
