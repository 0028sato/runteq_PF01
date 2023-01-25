require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validation' do
    it 'postが正常に作成されること' do
      post = build(:post)
      expect(post).to be_valid
      expect(post.errors).to be_empty
    end

    it 'budgetがnilの時' do
      post = Post.new(budget: nil)
      expect(post.valid?).to eq(false)
      expect(post.errors[:budget]).to eq ["を入力してください", "は数値で入力してください"]
    end

    it 'budgetが整数ではない時' do
      post = Post.new(budget: "文字列です")
      expect(post.valid?).to eq(false)
      expect(post.errors[:budget]).to eq ["は数値で入力してください"]
    end

    it 'budgetが9999999以上の時' do
      post = Post.new(budget: 999999911)
      expect(post.valid?).to eq(false)
      expect(post.errors[:budget]).to eq ["は9999999以下の値にしてください"]
    end

    it 'bodyがnilの状態の時' do
      post = Post.new(body: nil)
      expect(post.valid?).to eq(false)
      expect(post.errors[:body]).to eq ["を入力してください"]
    end

    context 'bodyが65535文字以内の場合' do
      it '有効であること' do
        post = build(:post, body: 'a' * 65535)
        expect(post).to be_valid
      end
    end

    context 'bodyが65536文字以上の場合' do
      it '無効であること' do
        post = build(:post, body: 'a' * 65536)
        expect(post).to be_invalid
        expect(post.errors[:body]).to include('は65535文字以内で入力してください')
      end
    end
  end
end
