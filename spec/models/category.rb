require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with a name" do
    category = FactoryBot.build(:category, name: "Example Category")
    expect(category).to be_valid
  end

  it "is invalid without a name" do
    category = FactoryBot.build(:category, name: nil)
    expect(category).to be_invalid
    expect(category.errors[:name]).to include("can't be blank")
  end
end
