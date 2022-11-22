class RequestInterventionController < ApplicationController
  before_action :authenticate_user!

  def intervention_form
    request_intervention()
  end

 def request_intervention
  @customer = []

  Customer.all.each  do |customer|
    @customer.push(customer)
  end


  puts "==================================="
  puts @customer
 end
end
