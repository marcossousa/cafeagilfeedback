Cafeagilfeedback::Application.routes.draw do

  resources :feedbacks, :except => [:destroy, :show, :edit, :update]

  root :to => "home#index"

end
