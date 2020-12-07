require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "購物車" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      cart = Cart.new                   # 新增一台購物車
      cart.add_item 1                   # 隨便丟一個東西到購物車裡
      expect(cart.empty?).to be false   # 它應該不是空的
    end

    it "如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變" do
      cart = Cart.new # 新增購物車
      3.times { cart.add_item(3) } # 放編號3商品3次
      5.times { cart.add_item(1) } # 放編號1商品5次
      2.times { cart.add_item(5) } # 放編號5商品2次
      expect(cart.items.length).to be 3 # 預期購物車會有3樣商品
      expect(cart.items.frist.quantity).to be 3 # 預期第一樣商品數量為3
      expect(cart.items.seconde.quantity).to be 5 # 預期第二樣商品數量為5
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      cart = Cart.new
      p1 = Product.create(title:'鬼滅之刃')
      p2 = Product.create(title:'無限列車')


    end
    
    it "每個 Cart Item 都可以計算它自己的金額（小計）"
    it "可以計算整台購物車的總消費金額"
    it "特別活動可能可搭配折扣（例如聖誕節的時候全面打 9 折，或是滿額滿千送百）"
  end

  describe "購物車進階功能" do
    it "可以將購物車內容轉換成 Hash，存到 Session 裡"
    it "可以把 Session 的內容（Hash 格式），還原成購物車的內容"
  end
end
