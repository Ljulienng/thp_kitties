class RegistrationsController < Devise::RegistrationsController  
  clear_respond_to  
  respond_to :js
end  