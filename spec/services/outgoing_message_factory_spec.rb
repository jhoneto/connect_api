# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OutgoingMessageFactory, type: :service do
  describe '.create' do
    context 'when type is template' do
      let(:payload) do
        {
          type: 'template',
          template: {
            to: '+551199999999',
            template_code: 'template-code',
            header_parameters: %w[header-parameter-1 header-parameter-2],
            body_parameters: %w[body-parameter-1 body-parameter-2]
          }
        }
      end

      it 'returns a TemplateOutgoingMessage' do
        expect(described_class.create(payload)).to be_a(OutgoingMessages::TemplateOutgoingMessage)
      end
    end

    context 'when type is not implemented' do
      let(:payload) do
        {
          type: 'text',
          to: '+551199999999',
          body: 'Hello World'
        }
      end

      it 'raises an error' do
        expect { described_class.create(payload) }.to raise_error(ArgumentError)
      end
    end
  end
end
