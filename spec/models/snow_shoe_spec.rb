require 'rails_helper'

RSpec.describe SnowShoe, type: :model do
  describe 'validation' do
    it 'shoeが正常に作成されること' do
      shoe = build(:snow_shoe)
      expect(shoe).to be_valid
      expect(shoe.errors).to be_empty
    end
  end
end
