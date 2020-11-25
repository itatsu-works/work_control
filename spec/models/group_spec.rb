require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
  end

  describe 'グループ作成' do
    context 'グループ作成がうまくいく時' do
      it 'group_name, ユーザーが入力されている時'do
        expect(@group).to be_valid
      end
    end

    context 'グループ作成がうまくいかない時' do
      it 'group_nameが空欄だと作成できない' do
        @group.group_name = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Group name can't be blank")
      end

      it 'ユーザーが空欄だと作成できない' do
        @group.user_id = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("User id can't be blank")
      end
    end
  end
end
