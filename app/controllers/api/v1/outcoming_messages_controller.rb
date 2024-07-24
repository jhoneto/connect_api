# frozen_string_literal: true

class Api::V1::OutgoingMessagesController < Api::V1::BaseController
  def create
    @message = current_user.outgoing_messages.create!(message_params)
    render json: @message, status: :created
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end