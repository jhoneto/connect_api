require 'rails_helper'

RSpec.describe Template, type: :model do
  describe 'associations' do
    it { should belong_to(:organization) }
    it { should belong_to(:channel) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:callback_method) }
    it { should validate_presence_of(:callback_url) }
  end
end
