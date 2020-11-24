require 'rails_helper'

RSpec.describe Work, type:  :model do
  before do
    @work = FactoryBot.build(:work)
  end

  describe '仕事登録' do
    context '仕事登録がうまくいく時' do
      it'work_name, deadline, contentsが入力されている時' do
        expect(@work).to be_valid
      end
    end
    context '仕事登録がうまくいかない時' do
      it 'work_nameが空欄だと登録できない' do
        @work.work_name = ''
        @work.valid?
        expect(@work.errors.full_messages).to include("Work name can't be blank")
      end

      it 'deadlineが空欄だと登録できない' do
        @work.deadline = ''
        @work.valid?
        expect(@work.errors.full_messages).to include("Deadline is already passed or is blank.")
      end

      it 'deadlineに入力された値が今日より過去のものだと登録できない' do
        @work.deadline = '1500-12-31'
        @work.valid?
        expect(@work.errors.full_messages).to include("Deadline is already passed or is blank.")
      end

      it 'contentsが空欄だと登録できない' do
        @work.contents = ''
        @work.valid?
        expect(@work.errors.full_messages).to include("Contents can't be blank")
      end
    end
  end
end



