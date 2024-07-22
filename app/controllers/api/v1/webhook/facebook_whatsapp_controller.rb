# frozen_string_literal: true

class Api::V1::Webhook::FacebookWhatsappController < Api::V1::Webhook::BaseController
  def index
    render plain: params['hub.challenge'], status: :ok if !current_organization.nil? && params['hub.mode']
  end

  def create
    IncomingMessage.create!(
      organization: current_organization,
      provider: :facebook,
      channel_type: :whatsapp,
      payload: params[:facebook_whatsapp]
    )

    head :ok
  end
end
