Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  post 'data_validation' => 'stops_api#data_validation'

  post 'search_ori' => 'stops_api#search_ori'



end
