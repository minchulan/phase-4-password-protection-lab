class ApplicationRecord < ActiveRecord::Base
  include ActionController::Cookies 
  # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity 
  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found 

  # def render_unprocessable_entity
  #   render json: {errors.invalid.record.errors}, status: :unprocessable_entity 
  # end 

  # def render_not_found(error)
  #   render json: {errors: {error.model => "Not Found"}}, status: :not_found 
  # end 


  self.abstract_class = true

end
