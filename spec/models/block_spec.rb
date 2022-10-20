require 'rails_helper'

RSpec.describe Block, type: :model do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain_id: chain.id) }

  it 'has a valid factory' do
    expect(block).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:chain) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:nonce) }
    it { is_expected.to validate_presence_of(:previous_hash) }
    it { is_expected.to validate_presence_of(:block_data) }
    it { is_expected.to validate_presence_of(:connections) }
  end
end
