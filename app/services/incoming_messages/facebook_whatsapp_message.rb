#frozen_string_literal: true

class IncomingMessages::FacebookWhatsappMessage < IncomingMessages::BaseIncomingMessage
  def translate
    if @payload[:entry][0][:changes][0][:value][:statuses].present?
      status_event
    else
      message_event
    end
  end

  private

  def status_event
    StandardizedMessageStruct.new(
      event: 'status',
      status: {
        provider_message_id: @payload[:entry][0][:changes][0][:value][:statuses][0][:id],
        name: @payload[:entry][0][:changes][0][:value][:statuses][0][:status],
        timestamp: @payload[:entry][0][:changes][0][:value][:statuses][0][:timestamp].to_i
      }
    )
  end

  def message_event
  end
end