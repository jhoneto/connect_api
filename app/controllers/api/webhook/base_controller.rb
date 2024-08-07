# frozen_string_literal: true

class Api::Webhook::BaseController < Api::BaseController
  before_action :require_organization_access_token

  private

  def require_organization_access_token
    token = params[:access_token]
    head :forbidden unless token
    head :forbidden unless valid_token(token)
  end

  def current_organization
    token = params[:access_token]
    Organization.find_by(api_token: token)
  end

  def valid_token(token)
    return false unless token

    begin
      Organization.find_by(api_token: token)
      return true
    rescue StandardError
      return false
    end
    false
  end
end