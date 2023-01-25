require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it 'ユーザーが正常に作成されること' do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    context 'passwordの桁数が三桁以上の時' do
      it '作成に成功する' do
        user = build(:user, password: 123, password_confirmation: 123)
        expect(user).to be_valid
      end
    end

    context 'passwordの桁数が三桁以下の時' do
      it '作成に失敗する' do
        user = build(:user, password: 12)
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("は3文字以上で入力してください")
      end
    end

    context 'emailが同じである時' do
      it '作成に失敗する' do
        user = create(:user)
        user2 = build(:user, email: user.email)
        expect(user2).to be_invalid
        expect(user2.errors[:email]).to eq ["はすでに存在します"]
      end
    end

    context 'emailがnilの時' do
      it '作成に失敗する' do
        user = build(:user, email: nil)
        expect(user.valid?).to eq(false)
        expect(user.errors[:email]).to eq ["を入力してください"]
      end
    end

    context 'nameがnilの時' do
      it '作成に失敗する' do
        user = build(:user, name: nil)
        expect(user.valid?).to eq(false)
        expect(user.errors[:name]).to eq ["を入力してください"]
      end
    end

    context 'nameが255文字を超える時' do
      it '作成に失敗する' do
        user = build(:user, name: 'a' * 256 )
        expect(user.valid?).to eq(false)
        expect(user.errors[:name]).to eq ["は255文字以内で入力してください"]
      end
    end
  end
end
