# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OutgoingMessages::TemplateOutgoingMessage, type: :service do
  let(:template) { create(:template) }
  let(:payload) do
    {
      type: 'template',
      to: '+551199999999',
      template: {
        id: template.uuid,
        header_parameters: %w[header-parameter-1 header-parameter-2],
        body_parameters: %w[body-parameter-1 body-parameter-2]
      }
    }
  end
  let(:outgoing_message) { described_class.new(payload) }

  describe '#translate' do
    it 'returns a TemplateMessageStruct' do
      expect(outgoing_message.translate(template.channel_code)).to be_a(TemplateMessageStruct)
    end
  end
end
