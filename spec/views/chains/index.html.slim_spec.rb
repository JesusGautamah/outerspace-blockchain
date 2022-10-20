require 'rails_helper'

RSpec.describe "chains/index", type: :view do
  let(:chain_hash) do
    { 
      name: Faker::Name.name, maintainer: Faker::Internet.email,
      chain_version: Faker::App.version, description: Faker::Lorem.paragraph
    }
  end

  let(:chain_hash_2) do
    {
      name: Faker::Name.name, maintainer: Faker::Internet.email,
      chain_version: Faker::App.version, description: Faker::Lorem.paragraph
    }
  end

  before(:each) do
    assign(:chains, [
      create(:chain, chain_hash),
      create(:chain, chain_hash_2)
    ])
  end

  it "renders a list of chains" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(chain_hash[:name]), count: 1
    assert_select cell_selector, text: Regexp.new(chain_hash_2[:name]), count: 1
    assert_select cell_selector, text: Regexp.new(chain_hash[:maintainer]), count: 1
    assert_select cell_selector, text: Regexp.new(chain_hash_2[:maintainer]), count: 1
    assert_select cell_selector, text: Regexp.new(chain_hash[:chain_version]), count: 1
    assert_select cell_selector, text: Regexp.new(chain_hash_2[:chain_version]), count: 1
    assert_select cell_selector, text: Regexp.new(chain_hash[:description]), count: 1
    assert_select cell_selector, text: Regexp.new(chain_hash_2[:description]), count: 1
  end
end
