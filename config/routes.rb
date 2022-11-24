Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'corporate', to: 'home#corporate'
  get 'residential', to: 'home#residential'
  
  root 'home#index' # shortcut for the above /
  
  
  # root 'quotes#form'
  get '/quotes', to: 'quotes#form'
  post '/quotes', to: 'quotes#create'
  
  
  # root 'leads#form'
  get '/leads', to: 'leads#form'
  post '/leads', to: 'leads#create'
  
  
  
  # get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'home' => 'home#index' 
  
  # google map 
  
  get '/customer_map', to: 'customer_map#customer_map'
  
  #audi aws poly
  
  get '/audioPage', to: 'audio#audio'
  get '/playAudio', to: 'audio#playAudio'
  
  
  #graphsql
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end

  post "/graphql", to: "graphql#execute"





  # form request intervention
  get '/request_intervention', to: 'request_intervention#intervention_form'

  get '/request_intervention', to: 'request_interventions#intervention_form'
  post '/request_intervention', to: 'request_intervention#create'
  
  get 'ajax/:get_building_by_customer', to: 'ajax#:get_building_by_customer', :defaults => { :format => 'json' }
  get 'get_building_by_customer/:customer_id', to: 'request_intervention#get_building_by_customer'

  get 'ajax/:get_baterry_by_building', to: 'ajax#:get_baterry_by_building', :defaults => { :format => 'json' }
  get 'get_baterry_by_building/:building_id', to: 'request_intervention#get_baterry_by_building'

  get 'ajax/:get_column_by_battery', to: 'ajax#:get_column_by_battery', :defaults => { :format => 'json' }
  get 'get_column_by_battery/:battery_id', to: 'request_intervention#get_column_by_battery'

  get 'ajax/:get_elevator_by_column', to: 'ajax#:get_elevator_by_column', :defaults => { :format => 'json' }
  get 'get_elevator_by_column/:column_id', to: 'request_intervention#get_elevator_by_column'

  post '/request', to: 'request_intervention#create'
  
end
