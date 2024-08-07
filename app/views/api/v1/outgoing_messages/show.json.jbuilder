# frozen_string_literal: true

json.message do
  json.id @message.uuid
  json.status 'submitted'
end
