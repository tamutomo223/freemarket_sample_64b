require 'rails_helper'
  describe Item do

    describe "文字数、数値のテスト" do

      it "item_name 41 can not valid" do
        item = build(:item,item_name:Faker::String.random(length: 41))
        item.valid?
        expect(item.errors[:item_name]).to include("は40文字以内で入力してください")
      end

      it "explain 1001 can not valid" do
        item = build(:item,explain:Faker::String.random(length: 1001))
        item.valid?
        expect(item.errors[:explain]).to include("は1000文字以内で入力してください")
      end
    
      it "explain 1001 can not valid" do
        item = build(:item,price:100)
        item.valid?
        expect(item.errors[:price]).to include("は300以上の値にしてください")
      end

      it "explain 1001 can not valid" do
        item = build(:item,price:10000000)
        item.valid?
        expect(item.errors[:price]).to include("は9999999以下の値にしてください")
      end
    
    
    end

    describe "空でエラー出るか確認" do
      #商品名が空だとバリデーション
      it "invalid without itemname" do
        item = build(:item, item_name: nil)
        item.valid?
        expect(item.errors[:item_name]).to include("を入力してください")
      end

      #oeder_idが空だとバリデーション
      it "invalid without order_id" do
        item = build(:item, order_id: nil)
        item.valid?
        expect(item.errors[:order_id]).to include("を入力してください")
      end
      #user_idが空だとバリデーション
      it "invalid without user_id" do
        item = build(:item, user_id: nil)
        item.valid?
        expect(item.errors[:user_id]).to include("を入力してください")
      end
      #explainが空だとバリデーション
      it "invalid without explain" do
        item = build(:item, explain: nil)
        item.valid?
        expect(item.errors[:explain]).to include("を入力してください")
      end

      #statusが空だとバリデーション
      it "invalid without status" do
        item = build(:item, status: nil)
        item.valid?
        expect(item.errors[:status]).to include("を入力してください")
      end

      #feeが空だとバリデーション
      it "invalid without status" do
        item = build(:item, fee: nil)
        item.valid?
        expect(item.errors[:fee]).to include("を入力してください")
      end

       #s_prefectureが空だとバリデーション
       it "invalid without status" do
        item = build(:item, s_prefecture: nil)
        item.valid?
        expect(item.errors[:s_prefecture]).to include("を入力してください")
      end

       #s_dateが空だとバリデーション
       it "invalid without s_date" do
        item = build(:item, s_date: nil)
        item.valid?
        expect(item.errors[:s_date]).to include("を入力してください")
      end

      #viewが空だとバリデーション
      it "invalid without view" do
        item = build(:item, view: nil)
        item.valid?
        expect(item.errors[:view]).to include("を入力してください")
      end

      #sizeが空だとバリデーション
      it "invalid without size" do
        item = build(:item, size: nil)
        item.valid?
        expect(item.errors[:size]).to include("を入力してください")
      end
      
      #size_typeが空だとバリデーション
      it "invalid without size_type" do
        item = build(:item, size_type: nil)
        item.valid?
        expect(item.errors[:size_type]).to include("を入力してください")
      end

      #category_id が空だとバリデーション
      it "invalid without category_id " do
        item = build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category_id ]).to include("を入力してください")
      end
    end
   
  end