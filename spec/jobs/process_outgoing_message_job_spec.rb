# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ProcessOutgoingMessageJob, type: :job do
  include ActiveJob::TestHelper

  describe 'perform template message' do
    let(:orgazation) { create(:organization) }
    let(:channel) { create(:channel, organization: orgazation) }
    let(:template) { create(:template, organization: orgazation, channel: channel) }
    let(:template_payload) do
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

    before do
      clear_enqueued_jobs
      clear_performed_jobs

      create(:outgoing_message, organization: orgazation, channel: channel, template: template, payload: template_payload)
    end

    context 'when the message is processed' do
      it 'should send the message to the provider' do
        perform_enqueued_jobs

        byebug
        expect(OutgoingMessage.last.processed).to be_truthy
      end
    end
  end
end