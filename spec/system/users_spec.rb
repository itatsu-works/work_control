require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページへ遷移する' do
      
      #トップページに移動すると、ログイン画面に遷移される。
      visit root_path
      #ログイン画面から、新規登録ページへの遷移するボタンの存在を確認する。
      expect(page).to have_content('登録')
      #新規登録ページへ遷移する。
      visit new_user_registration_path
      #ユーザー情報を入力する。
      fill_in 'Name', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      #"Create Account"ボタンを押す。
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      #トップページへ遷移する
      expect(current_path).to eq(root_path)
      #ログアウトボタンが表示されることを確認する。
      expect(page).to have_content('ログアウト')
      #ログインページへ遷移するボタンや、新規登録ページへ遷移するボタンが表示されていないことを確認する。
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')

    end
  end

  context 'ユーザー新規登録ができない時' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページーへ戻る' do

    end
  end


  pending "add some scenarios (or delete) #{__FILE__}"
end
