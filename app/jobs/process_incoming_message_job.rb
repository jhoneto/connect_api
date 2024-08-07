# frozen_string_literal: true

class ProcessIncomingMessageJob < ApplicationJob
  queue_as :incoming_message

  def perform(incoming_message_id)

  end
end