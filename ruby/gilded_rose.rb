class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie" then aged_brie
      when "Backstage passes to a TAFKAL80ETC concert" then backstage
      when "Sulfuras, Hand of Ragnaros" then sulfuras
      else other
      end
    end
  end

  def aged_brie
    @items.each do |item|
      item.quality += 1
      item.sell_in -= 1
      item.quality += 1 if item.sell_in < 0
    end
  end

  def backstage
    @items.each do |item|
      item.quality += 1
      item.quality += 1 if item.sell_in < 11
      item.quality += 1 if item.sell_in < 6
      item.sell_in -= 1
      item.quality = item.quality - item.quality if item.sell_in < 0
    end
  end

  def sulfuras

  end

  def other
    @items.each do |item|
      item.quality -= 1 if item.quality > 0
      item.sell_in -= 1
      item.quality -= 1 if item.sell_in < 0
  end
end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
