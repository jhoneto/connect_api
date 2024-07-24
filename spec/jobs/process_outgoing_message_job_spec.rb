# frozen_string_literal: true
require 'rails_helper'

# RSpec.describe ProcessOutgoingMessageJob, type: :job do
#   include ActiveJob::TestHelper

#   describe 'perform template message' do
#     let(:orgazation) { create(:organization) }
#     let(:channel) { create(:channel, organization: orgazation) }
#     let(:template_payload) do
#       {
#         type: 'template',
#         template: {
#           to: '+551199999999',
#           template_code: 'template-code',
#           header_parameters: %w[header-parameter-1 header-parameter-2],
#           body_parameters: %w[body-parameter-1 body-parameter-2]
#         }
#       }
#     end
#     let(:outgoing_message) { create(:outgoing_message, organization: orgazation, channel: channel) }

#   end
# end