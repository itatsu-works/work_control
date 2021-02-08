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
      fill_in 'Password confirmation', with: @user.passwordconfirmation
      #"Create Account"ボタンを押す。
      #トップページへ遷移する
      #ログアウトボタンが表示されることを確認する。
      #ログインページへ遷移するボタンや、新規登録ページへ遷移するボタンが表示されていないことを確認する。

    end
  end

  context 'ユーザー新規登録ができない時' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページーへ戻る' do

    end
  end


  pending "add some scenarios (or delete) #{__FILE__}"
end
