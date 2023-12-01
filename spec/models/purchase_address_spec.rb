require 'rails_helper'

RSpec.describe '購入機能', type: :model do
  before do
    @item = FactoryBot.create(:item)
    @seller = @item.user
    @buyer = FactoryBot.create(:user)
    @purchase = FactoryBot.build(:purchase_address, user_id: @buyer.id, item_id: @item.id)
  end
  context '購入できるとき' do
    it '適切なpostcode, prefecture_id, municipality, street_address, phone_number, tokenがあり、
        userとitemが紐づけられているとき' do
      expect(@purchase).to be_valid
    end
    it 'buildingは空でも購入できる' do
      @purchase.building = ''
      expect(@purchase).to be_valid
    end
  end
  context '購入できないとき' do
    it 'userの紐づけがない' do
      purchase = FactoryBot.build(:purchase_address, item_id: @item.id)
      purchase.valid?
      expect(purchase.errors.full_messages).to include('User can\'t be blank')
    end

    it 'itemの紐づけがない' do
      purchase = FactoryBot.build(:purchase_address, user_id: @buyer.id)
      purchase.valid?
      expect(purchase.errors.full_messages).to include('Item can\'t be blank')
    end

    it 'postcodeが空' do
      @purchase.postcode = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Postcode can\'t be blank')
    end
    it 'postcodeにハイフンが含まれない' do
      @purchase.postcode.delete! '-'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Postcode is invalid')
    end
    it 'postcodeの前半が3桁でない' do
      @purchase.postcode = '1234-5678'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Postcode is invalid')
    end
    it 'postcodeの後半が4桁でない' do
      @purchase.postcode = '123-45678'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Postcode is invalid')
    end
    it 'postcodeに英字が含まれる' do
      @purchase.postcode = '1b3-4f67'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Postcode is invalid')
    end

    it 'prefecture_idが空' do
      @purchase.prefecture_id = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Prefecture can\'t be blank')
    end
    it 'prefecture_idが1' do
      @purchase.prefecture_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'prefecture_idに英字が含まれる' do
      @purchase.prefecture_id = 'abc'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Prefecture is not a number')
    end
    it 'prefecture_idに全角文字が含まれる' do
      @purchase.prefecture_id = 'あいう'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Prefecture is not a number')
    end
    it 'prefecture_idに記号が含まれる' do
      @purchase.prefecture_id = '---'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Prefecture is not a number')
    end

    it 'municipalityが空' do
      @purchase.municipality = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Municipality can\'t be blank')
    end

    it 'street_addressが空' do
      @purchase.street_address = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Street address can\'t be blank')
    end

    it 'phone_numberが空' do
      @purchase.phone_number = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number can\'t be blank')
    end
    it 'phone_numberが10桁未満' do
      @purchase.phone_number = Faker::Number.number(digits: 9)
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが11桁を超える' do
      @purchase.phone_number = Faker::Number.number(digits: 12)
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberに英字が含まれる' do
      @purchase.phone_number = 'abcdefghij'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberに全角文字が含まれる' do
      @purchase.phone_number = 'あいうえおかきくけこ'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberに記号が含まれる' do
      @purchase.phone_number = '080-5555-2222'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end

    it 'tokenが空' do
      @purchase.token = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Token can\'t be blank')
    end
  end
end
