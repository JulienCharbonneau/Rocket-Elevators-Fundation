
  require "json"

class RequestInterventionController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def intervention_form
    
  end

  def create 
    puts params
    request_intervention = RequestIntervention.new()
    request_intervention.author = current_user.id
    request_intervention.customer_id = params[:Customer]
    request_intervention.building_id = params[:Building]
    request_intervention.battery_id = params[:Battery]
    request_intervention.column_id = params[:Column]
    request_intervention.elevator_id = params[:Elevator]
    request_intervention.employee_id = params[:Employee]
    request_intervention.report = params[:description]
    request_intervention.save()
  end

def get_building_by_customer
  @building = Building.where("customer_id = ?", params[:customer_id])
  respond_with(@building)
  end

def get_baterry_by_building
  puts "=================="
  @battery = Battery.where("building_id = ?", params[:building_id])
  respond_with(@battery)
  end

  def get_column_by_battery
    @column = Column.where("battery_id = ?", params[:battery_id])
    respond_with(@column)
  end

  def get_elevator_by_column
    @elevator = Elevator.where("column_id = ?", params[:column_id])
    respond_with(@elevator)
  end

end
