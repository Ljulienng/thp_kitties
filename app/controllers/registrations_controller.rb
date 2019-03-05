class RegistrationsController < Devise::RegistrationsController  
  respond_to :html
  respond_to :js, only: [:new]
end  