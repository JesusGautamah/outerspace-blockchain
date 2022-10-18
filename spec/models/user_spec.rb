require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid with null attributes" do
    expect(User.new).to_not be_valid
  end
end
