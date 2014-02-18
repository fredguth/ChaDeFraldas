class SessionsController < Devise::SessionsController



def create
    # Since the authentication happens in the rack layer,
    # we need to tell Devise to call the action "sessions#new"
    # in case something goes bad. Feel free to change it.
    #user = authenticate_user!(:recall => "sessions#new")
    
    self.resource = warden.authenticate!(scope: resource_name, recall: "info#unauthorized")
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, :location => after_sign_in_path_for(resource)
end
 


end