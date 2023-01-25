require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validation' do
    it 'タグが正常に作成されること' do
      tag = build(:tag)
      expect(tag).to be_valid
      expect(tag.errors).to be_empty
    end

    context '同じタグが複数存在する時' do
      it '作成に失敗する' do
        tag = create(:tag)
        tag2 = build(:tag, name: tag.name)
        expect(tag2).to be_invalid
        expect(tag2.errors[:name]).to eq ["はすでに存在します"]
      end
    end

    context 'タグがnilの時' do
      it '作成に失敗する' do
        tag = build(:tag, name: nil)
        expect(tag.valid?).to eq(false)
        expect(tag.errors[:name]).to eq ["を入力してください"]
      end
    end
  end
end
