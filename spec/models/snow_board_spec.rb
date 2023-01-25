require 'rails_helper'

RSpec.describe SnowBoard, type: :model do
  describe 'validation' do
    it 'boardが正常に作成されること' do
      board = build(:snow_board)
      expect(board).to be_valid
      expect(board.errors).to be_empty
    end
  end
end
