# frozen_string_literal: true

RSpec.describe Outerspace::Blockchain do
  it "has a version number" do
    expect(Outerspace::Blockchain::VERSION).not_to be nil
  end
end
