module Types
  class QueryType < Types::BaseObject
    field :address, [Types::AddressType], null: false
    def address
      Address.all
      FactIntervention.where.not(interventionStartAt: nil)
    end
    
    # Get all employees
    # field :employees, [Types::EmployeesType], null: false
    # def employees
    #   Employee.all
    # end

    # # Get a specific employees
    field :employee, Types::EmployeesType, null: false do
      argument :id, ID, required: true
    end
    def employee(id:)
      Employee.find(id)
    end

    field :interventions, [Types::InterventionType], null: false
    def interventions
      FactIntervention.all
    end

    field :intervention, Types::InterventionType, null: false do
      argument :id, ID, required: true
      # argument :employeeId, Integer, required: true
      # argument :buildingId, Integer, required: true
    end
    def intervention(id:)
      FactIntervention.find(id)
    end
    
    # field :employeeintervention, Types::InterventionType, null: false do
    #   # argument :id, ID, required: true
    #   # argument :employeeId, Integer, required: true
    #   # argument :buildingId, Integer, required: true
    # end
    # def employeeintervention
    #   FactIntervention.find(employeeId)

    # end


    # field :factint, [Types::FactintType], null: false
    # def factint
    #   FactIntervention.all
    # end




    field :buildings, [Types::BuildingType], null: false

    def buildings
      Building.all
    end
    
    ######################
    
    
    
    # Get a specific building
    field :building, Types::BuildingType, null: false do
      argument :id, ID, required: false 
      
    end
    def building(id:)
      Building.find(id)

    end
  end
end