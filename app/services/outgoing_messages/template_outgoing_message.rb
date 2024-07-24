# frozen_string_literal: true

class OutgoingMessages::TemplateOutgoingMessage < OutgoingMessages::BaseOutgoingMessage
  def translate
    TemplateMessageStruct.new(
      to: @payload[:to],
      template_code: @payload[:template_code],
      header_parameters: @payload[:header_parameters],
      body_parameters: @payload[:body_parameters]
    )
  end
end
