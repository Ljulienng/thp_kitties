class SessionsController < Devise::SessionsController  
  respond_to :html
  respond_to :js

end