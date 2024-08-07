# frozen_string_literal: true

class StandardizedMessageStruct < BaseStruct
  attribute :event, Types::String

  attribute :from do
    attribute :name, Types::String
    attribute :identifier, Types::String
  end

  attribute? :status do
    attribute :name, Types::String
    attribute :timestamp, Types::Integer
  end

  attribute? :message do
    attribute :type, Types::String
    attribute? :text do
      attribute :body, Types::String
    end
  end

end