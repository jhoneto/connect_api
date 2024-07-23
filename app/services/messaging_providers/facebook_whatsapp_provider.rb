# frozen_string_literal: true

class MessagingProviders::FacebookWhatsappProvider < MessagingProviders::BaseProvider
  URL = 'https://graph.facebook.com/v17.0'
  def send_message_from_template(template_message)
    req_body = {
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{@config[:facebook_api_token]}"
      },
      body: template_body(template_message).to_json
    }

    HTTParty.post(
      "#{URL}/#{@config[:facebook_whatsapp_number]}/messages",
      req_body
    )
  end

  private

  def template_body(template_message)
    {
      messaging_product: 'whatsapp',
      recipient_type: 'individual',
      to: template_message.to,
      type: 'template',
      template: {
        name: template_message.template_code,
        language: {
          code: 'pt_BR'
        },
        components: [
          {
            type: 'header',
            parameters: template_message.header_parameters.map { |v| { type: 'text', text: v } }
          },
          {
            type: 'body',
            parameters: template_message.body_parameters.map { |v| { type: 'text', text: v } }
          }
        ]
      }
    }
  end
end
