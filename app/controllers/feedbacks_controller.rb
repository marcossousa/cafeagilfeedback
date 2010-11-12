class FeedbacksController < ApplicationController
  
   def new
     @feedback = Feedback.new
     respond_with @feedback
   end

   def create
     @feedback = Feedback.new(params[:feedback])
     flash[:notice] = 'Obrigado pela sua contribuição' if @feedback.save
     respond_with @feedback, :location => root_path 
   end

end
