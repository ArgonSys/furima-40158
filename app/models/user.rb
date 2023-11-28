class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  REGFORMAT_KATAKANA = /\a[ア-ヶー]+\Z/
  REGFORMAT_JAPANESE = /\a[ぁ-んァ-ヶ一-龥々]+\Z/
  REGFORMAT_ALPHANUM = /\a(?=.*?[a-z])(?=.*?\d)[a-z\d]+\Z/i
  MESSAGE_INVALID_KATAKANA = 'にはカタカナを入力してください。'.freeze
  MESSAGE_INVALID_JAPANESE = 'には漢字・かな・カタカナが使えます。'.freeze
  MESSAGE_INVALID_ALPHANUM = 'は英数字混合で入力してください。'.freeze

  validates :nickname, presence: true
  validates :password, format: { with: REGFORMAT_ALPHANUM, message: MESSAGE_INVALID_ALPHANUM }
  validates :first_name, presence: true, format: { with: REGFORMAT_JAPANESE, message: MESSAGE_INVALID_JAPANESE }
  validates :last_name, presence: true, format: { with: REGFORMAT_JAPANESE, message: MESSAGE_INVALID_JAPANESE }
  validates :first_name_kana, presence: true, format: { with: REGFORMAT_KATAKANA, message: MESSAGE_INVALID_KATAKANA }
  validates :last_name_kana, presence: true, format: { with: REGFORMAT_KATAKANA, message: MESSAGE_INVALID_KATAKANA }
  validates :birthday, presence: true
end
