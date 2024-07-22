# frozen_string_literal: true
class MessagingProviders::FacebookWhatsappProvider < MessagingProviders::BaseProvider
  def send_message_from_template(params)
    # TODO: Implement
    puts params
    raise NotImplementedError
  end
end
