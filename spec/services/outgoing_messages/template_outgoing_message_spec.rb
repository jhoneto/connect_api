# frozen_string_literal: true
require 'rails_helper'

RSpec.describe OutgoingMessages::TemplateOutgoingMessage, type: :service do
  let(:payload) do
    {
      type: 'template',
      to: '+551199999999',
      id: 'template-code',
      header_parameters: ['header-parameter-1', 'header-parameter-2'],
      body_parameters: ['body-parameter-1', 'body-parameter-2']
    }
  end
  let(:outgoing_message) { described_class.new(payload) }

  describe '#translate' do
    it 'returns a TemplateMessageStruct' do
      expect(outgoing_message.translate).to be_a(TemplateMessageStruct)
    end
  end
end