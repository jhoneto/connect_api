# frozen_string_literal: true

class OutgoingMessages::TemplateOutgoingMessage < OutgoingMessages::BaseOutgoingMessage
  def translate(template_code)
    TemplateMessageStruct.new(
      to: @payload[:to],
      template_code: template_code, #@payload[:template][:template_code],
      header_parameters: @payload[:template][:header_parameters],
      body_parameters: @payload[:template][:body_parameters]
    )
  end
end
