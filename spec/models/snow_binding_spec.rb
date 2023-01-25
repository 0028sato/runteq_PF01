require 'rails_helper'

RSpec.describe SnowBinding, type: :model do
  describe 'validation' do
    it 'bindingが正常に作成されること' do
      binding = build(:snow_binding)
      expect(binding).to be_valid
      expect(binding.errors).to be_empty
    end
  end
end
