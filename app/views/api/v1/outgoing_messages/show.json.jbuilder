#frozen_string_literal: true
json.message @message do |message|
  json.id message.uuid
  json.status 'submitted'
end