# frozen_string_literal: true

class Api::V1::OutgoingMessagesController < Api::V1::BaseController
  before_action :set_channel, only: [:create]

  def create
    @message = OutgoingMessage.new
    @message.channel = @channel
    @message.organization = current_organization
    @message.payload = params[:message]
    if @message.save
      render :show, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end

  end

  private

  def set_channel
    @channel = current_organization.channels.find_by(uuid: params[:message][:channel])
  end
end