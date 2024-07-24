# frozen_string_literal: true

class ProcessOutgoingMessageJob < ApplicationJob
  queue_as :outgoing_message

  def perform(message_id)

  end
end