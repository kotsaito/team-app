require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end

  describe '新規スケジュール作成' do
    context '新規作成できる場合' do
      it "全ての項目が記入されて新規作成できる" do
        expect(@schedule).to be_valid
      end

      it "start_timeとtitleだけでも新規作成できる" do
        @schedule.place = ''
        @schedule.person = ''
        @schedule.practice = ''
        @schedule.others = ''
        expect(@schedule).to be_valid
      end


    end
    context '新規作成できない場合' do
      it "titleが空では作成できない" do
        @schedule.title = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Title can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @schedule.user = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('User must exist')
      end

    end
  end
end
