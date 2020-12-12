# frozen_string_literal: true

Doorkeeper.configure do
  orm :active_record
  default_scopes :public
  api_only
  base_controller 'ActionController::API'

  resource_owner_from_credentials do |_routes|
    user = User.find_for_database_authentication(email: params[:username])
    if user&.valid_for_authentication? { user.valid_password?(params[:password]) } && user&.active_for_authentication?
      request.env['warden'].set_user(user, scope: :user, store: false)
      user
    end
  end

  use_refresh_token
  grant_flows %w[password]
end
