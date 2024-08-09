# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProcessIncomingMessageJob, type: :job do
  include ActiveJob::TestHelper

  let(:organization) { create(:organization) }
  let(:channel) { create(:channel, organization: organization) }

  describe 'perform incoming message with status update' do
    let(:outgoing_message) { create(:outgoing_message, organization: organization, channel: channel, provider_message_id: 'AAABBC') }
    before do
      clear_enqueued_jobs
      clear_performed_jobs
    end

    context 'when the message is processed' do
      let!(:incoming_message) {
        create(:incoming_message, organization: organization,
                provider: 'facebook', channel_type: 'whatsapp',
                payload: {
                  entry: [
                    {
                      changes: [
                        {
                          value: {
                            statuses: [
                                {id: outgoing_message.provider_message_id, status: 'read', timestamp: 1676903200}
                              ]
                            }
                        }
                      ]
                    }
                  ]
                })}
      before do
        perform_enqueued_jobs
      end

      it 'status message should be processed' do
        expect(IncomingMessage.last.processed).to be_truthy
      end

      it 'outcoming message should be updated' do
        outgoing_message.reload

        expect(outgoing_message.read_at).to_not be_nil
      end

      it 'notification should be sent' do
        expect(Notification::OutgoingMessageStatusChangedJob).to have_been_enqueued.with(outgoing_message.id, 'read', 1676903200)
      end
    end
  end

end