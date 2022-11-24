
  require "json"

class RequestInterventionController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def intervention_form
    
  end

  def create 
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


    # Freshdesk
    requester =  Employee.find(current_user.id)
    

    customer = Customer.find(params[:Customer])
    customer_company_name = customer.company_name 

    building = Building.find(params[:Building])
    battery = Battery.find(params[:Battery])
    column = Column.find(params[:Column])
    elevator = Elevator.find( params[:Employee])
    
    employee_on_task = Employee.find(params[:Employee])

    description = params[:description]

    ticket = "#{requester.first_name} #{requester.last_name} request for an intervention.<br>The request is for #{customer_company_name}<br>Building id: #{building.id}<br>Batery id: #{battery.id}<br>Column id: #{column.id}<br>Elevator id: #{elevator.id}<br>Employee assigned to the task: #{employee_on_task.first_name} #{employee_on_task.last_name}<br>Description: <br>#{description}"


    # Your freshdesk domain
    freshdesk_domain = 'codeboxx-support'
        
    # It could be either your user name or api_key.
    user_name_or_api_key = ENV['freshdesk']
    # If you have given api_key, then it should be x. If you have given user name, it should be password
    password_or_x = 'X'
    
    json_payload = { status: 2,  
        priority: 1,
        type: "Feature Request",
        subject: "Request",
        name: params[:Employee],
        unique_external_id: params[:Employee],
        description: ticket
    }.to_json
    
    freshdesk_api_path = 'api/v2/tickets'
    
    freshdesk_api_url  = "https://#{freshdesk_domain}.freshdesk.com/#{freshdesk_api_path}"
    
    site = RestClient::Resource.new(freshdesk_api_url, user_name_or_api_key, password_or_x)
    
    begin
        response = site.post(json_payload, :content_type=>'application/json')
        puts "response_code: #{response.code} \n Location Header: #{response.headers[:location]}\n response_body: #{response.body}"
    rescue RestClient::Exception => exception
        puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
        puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
        puts "Response Code: #{exception.response.code} Response Body: #{exception.response.body} "
    end


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
