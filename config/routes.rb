Cafeagilfeedback::Application.routes.draw do

  resources :feedbacks

  root :to => "home#index"

end
