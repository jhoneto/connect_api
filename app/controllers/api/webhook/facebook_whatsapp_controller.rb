# frozen_string_literal: true

class Api::Webhook::FacebookWhatsappController < Api::Webhook::BaseController
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
  rescue StandardError => e
    puts e.message
    puts e.backtrace
    head :ok
  end
end
