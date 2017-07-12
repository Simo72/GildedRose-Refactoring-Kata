# require File.join(File.dirname(__FILE__), 'gilded_rose')
require './gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("Aged Brie", 15, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Aged Brie"
    end

    it "reduces items quality by 1 other than Brie, Backstage and Sulfuras" do
      items = [Item.new("Chicken feet", 15, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 9
    end

    it "increases quality by 1 if brie" do
      items = [Item.new("Aged Brie", 15, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 11
    end

    it "increases quality by 1 if brie" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 11
    end

    it "doesn't decrease quality if 0" do
      items = [Item.new("Chip Butty", 15, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "increase quality by 2 if Backstage sell_in 10 or below" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 22
    end

    it "increase quality by 3 if Backstage sell_in 5 or below" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 23
    end

    it "decrease sell_in if Backstage" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4
    end

    it "decrease sell_in if Aged Brie" do
      items = [Item.new("Aged Brie", 5, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4
    end

    it "decrease sell_in if other item" do
      items = [Item.new("Big Mac", 5, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4
    end

    it "does not decrease sell_in if Sulfuras" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 5
    end

    it "decreases quality by 2 if other item has negative sell_in" do
      items = [Item.new("Tequila", -1, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 18
    end

    it "increase quality by 2 for Brie if negative sell_in" do
      items = [Item.new("Aged Brie", -1, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 22
    end

    it "decreases quality to 0 for Backstage if negative sell_in" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end
end
