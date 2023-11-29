require 'rails_helper'

RSpec.describe '新規登録機能', type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録できる場合' do
    it '適切なemail, nickname, password, password_confirmation,
        first_name, last_name, first_name_kana, last_name_kana, birthdayがある' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できない場合' do
    it 'emailが空' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Email can\'t be blank')
    end
    it 'emailに"@"がない' do
      @user.email.delete!('@')
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailが既に使われている' do
      another_user = FactoryBot.create(:user)
      @user.email = another_user.email
      @user.valid?
      expect(@user.errors.full_messages).to include('Email has already been taken')
    end
    it 'nicknameが空' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Nickname can\'t be blank')
    end
    it 'passwordが空' do
      @user.password = ''
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password can\'t be blank')
    end
    it 'passwordが6文字未満' do
      @user.password = Faker::Lorem.characters(min_numeric: 1, min_alpha: 1, number: 5)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが128文字を超過' do
      @user.password = Faker::Lorem.characters(min_numeric: 1, min_alpha: 1, number: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
    end
    it 'passwordが英字のみ' do
      @user.password.gsub!(/\d/, '')
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は英数字混合で入力してください。')
    end
    it 'passwordが数字のみ' do
      @user.password.gsub!(/[a-z]/i, '')
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は英数字混合で入力してください。')
    end
    it 'password_confirmationがpasswordと合わない' do
      @user.password_confirmation += 'typo'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
    end
    it 'first_nameが空' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name can\'t be blank')
    end
    it 'first_nameに英字が含まれている' do
      @user.first_name += 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name には漢字・かな・カタカナが使えます。')
    end
    it 'first_nameに数字が含まれている' do
      @user.first_name += '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name には漢字・かな・カタカナが使えます。')
    end
    it 'last_nameが空' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name can\'t be blank')
    end
    it 'last_nameに英字が含まれている' do
      @user.last_name += 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name には漢字・かな・カタカナが使えます。')
    end
    it 'last_nameに数字が含まれている' do
      @user.last_name += '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name には漢字・かな・カタカナが使えます。')
    end
    it 'first_name_kanaが空' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana can\'t be blank')
    end
    it 'first_name_kanaにひらがなが含まれている' do
      @user.first_name_kana += 'あいう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana にはカタカナを入力してください。')
    end
    it 'first_name_kanaに漢字が含まれている' do
      @user.first_name_kana += '安以宇'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana にはカタカナを入力してください。')
    end
    it 'first_name_kanaに英字が含まれている' do
      @user.first_name_kana += 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana にはカタカナを入力してください。')
    end
    it 'first_name_kanaに数字が含まれている' do
      @user.first_name_kana += '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana にはカタカナを入力してください。')
    end
    it 'last_name_kanaが空' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana can\'t be blank')
    end
    it 'last_name_kanaにひらがなが含まれている' do
      @user.last_name_kana += 'あいう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana にはカタカナを入力してください。')
    end
    it 'last_name_kanaに漢字が含まれている' do
      @user.last_name_kana += '安以宇'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana にはカタカナを入力してください。')
    end
    it 'last_name_kanaに英字が含まれている' do
      @user.last_name_kana += 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana にはカタカナを入力してください。')
    end
    it 'last_name_kanaに数字が含まれている' do
      @user.last_name_kana += '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana にはカタカナを入力してください。')
    end
    it 'birthdayが空' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Birthday can\'t be blank')
    end
  end
end

RSpec.describe 'ログイン機能', type: :model do
end

RSpec.describe 'ログアウト機能', type: :model do
end
