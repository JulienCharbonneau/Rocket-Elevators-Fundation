require "json"


class RequestInterventionController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def intervention_form
    get_customer()
    get_building_by_customer()
  end

  def create 
    puts params
    request_intervention = RequestIntervention.new()
    request_intervention.customer_id = params[:Customer]
    request_intervention.save()
  end

 

 def get_customer
  @customer = []

  Customer.all.each  do |customer|
    @customer.push(customer)
  end


  puts "==================================="
end

def get_building_by_customer
  puts "+++++++++++++++++++++++="
  puts params[:customer_id]
  # @building = Building.where("customer_id = ?", params[:customer_id])
  # respond_to do |format|
  #   format.json { render :json => @building }
  # end
end
end
