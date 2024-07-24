# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::OutgoingMessagesController, type: :controller do
  let(:organization) { create(:organization) }
  let(:channel) { create(:channel, organization: organization) }
  let(:message) { create(:outgoing_message, channel: channel) }

  describe 'POST /api/v1/outgoing_messages' do
    context 'when message is valid' do
      let(:params) do
        {
          message: {
            channel: channel.uuid,
            type: 'text',
            text: {
              body: 'Hello World'
            }
          }
        }
      end
      before do
        request.headers['api_token'] = organization.api_token
        post :create, params: params, as: :json, format: :json
      end

      it 'returns 201' do
        expect(response).to have_http_status(:created)
      end

      it 'creates a new outgoing message' do
        expect(OutgoingMessage.count).to eq(1)
      end
    end

    context 'when message is invalid' do
      let(:params) do
        {
          message: {
            channel: 'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',
            type: 'text',
            text: {
              body: 'Hello World'
            }
          }
        }
      end
      before do
        request.headers['api_token'] = organization.api_token
        post :create, params: params, as: :json, format: :json
      end

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end