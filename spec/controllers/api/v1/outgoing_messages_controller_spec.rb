# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::OutgoingMessagesController, type: :controller do
  include ActiveJob::TestHelper

  let(:organization) { create(:organization) }
  let(:channel) { create(:channel, organization:) }
  let(:message) { create(:outgoing_message, channel:) }

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
        request.headers['Api-Token'] = organization.api_token
      end

      after do
        clear_enqueued_jobs
        clear_performed_jobs
      end

      it 'returns 201' do
        post :create, params:, as: :json, format: :json
        expect(response).to have_http_status(:created)
      end

      it 'creates a new outgoing message' do
        expect { post :create, params:, as: :json, format: :json }.to change(OutgoingMessage, :count).by(1)
      end

      it 'enqueues a job' do
        expect do
          post :create, params:, as: :json, format: :json
        end.to have_enqueued_job(ProcessOutgoingMessageJob).with(kind_of(Integer))
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
        request.headers['Api-Token'] = organization.api_token
        post :create, params:, as: :json, format: :json
      end

      it 'returns 422' do
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end
end
