require 'rails_helper'

RSpec.describe '商品登録機能', type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '商品登録できるとき' do
    it '適切な name, description, category_id, condition_id, shipping_cost_on_id, prefecture_id,
        days_to_shipping_id, price の入力があり、imageのattachとuserとの関連付けがある' do
      expect(@item).to be_valid
    end
  end
  context '商品登録できないとき' do
    it 'imageがattachされていない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Image must be attached')
    end

    it 'nameが空' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Name can\'t be blank')
    end

    it 'descriptionが空' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Description can\'t be blank')
    end

    it 'category_idが空' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category can\'t be blank')
    end
    it 'category_idが1' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'category_idに英字が含まれる' do
      @item.category_id = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end
    it 'category_idに全角文字が含まれる' do
      @item.category_id = 'あいう'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end
    it 'category_idに記号が含まれる' do
      @item.category_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end

    it 'condition_idが空' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition can\'t be blank')
    end
    it 'condition_idが1' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end
    it 'condition_idに英字が含まれる' do
      @item.condition_id = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition is not a number')
    end
    it 'condition_idに全角文字が含まれる' do
      @item.condition_id = 'あいう'
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition is not a number')
    end
    it 'condition_idに記号が含まれる' do
      @item.condition_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition is not a number')
    end

    it 'shipping_cost_on_idが空' do
      @item.shipping_cost_on_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping cost on can\'t be blank')
    end
    it 'shipping_cost_on_idが1' do
      @item.shipping_cost_on_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping cost on must be other than 1')
    end
    it 'shipping_cost_on_idに英字が含まれる' do
      @item.shipping_cost_on_id = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping cost on is not a number')
    end
    it 'shipping_cost_on_idに全角文字が含まれる' do
      @item.shipping_cost_on_id = 'あいう'
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping cost on is not a number')
    end
    it 'shipping_cost_on_idに記号が含まれる' do
      @item.shipping_cost_on_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping cost on is not a number')
    end

    it 'prefecture_idが空' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture can\'t be blank')
    end
    it 'prefecture_idが1' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'prefecture_idに英字が含まれる' do
      @item.prefecture_id = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture is not a number')
    end
    it 'prefecture_idに全角文字が含まれる' do
      @item.prefecture_id = 'あいう'
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture is not a number')
    end
    it 'prefecture_idに記号が含まれる' do
      @item.prefecture_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture is not a number')
    end

    it 'days_to_shipping_idが空' do
      @item.days_to_shipping_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to shipping can\'t be blank')
    end
    it 'days_to_shipping_idが1' do
      @item.days_to_shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to shipping must be other than 1')
    end
    it 'days_to_shipping_idに英字が含まれる' do
      @item.days_to_shipping_id = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to shipping is not a number')
    end
    it 'days_to_shipping_idに全角文字が含まれる' do
      @item.days_to_shipping_id = 'あいう'
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to shipping is not a number')
    end
    it 'days_to_shipping_idに記号が含まれる' do
      @item.days_to_shipping_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to shipping is not a number')
    end

    it 'priceが空' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Price can\'t be blank')
    end
    it 'priceに英字が含まれる' do
      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceに全角文字が含まれる' do
      @item.price = 'あいう'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceに記号が含まれる' do
      @item.price = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceが小数' do
      @item.price = 300.1
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be an integer')
    end
    it 'priceが300未満' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが9,999,999を超える' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'userとのassociationがない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
