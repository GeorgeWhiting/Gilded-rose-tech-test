require_relative 'normal'
require_relative 'brie'
require_relative 'pass'
require_relative 'sulfuras'
require_relative 'conjured'

class GildedRose
  def initialize(items)
    @items = items
  end

  def next_day
    @items.each do |item|
      update_quality(item)
    end
  end

  def get_item_type(item)
    case item.name
    when 'Aged Brie'
      Brie
    when 'Backstage passes to a TAFKAL80ETC concert'
      Pass
    when 'Sulfuras, Hand of Ragnaros'
      Sulfuras
    when 'Conjured Mana Strudel'
      Conjured
    else
      Normal
    end
  end

  def update_quality(item)
    get_item_type(item).new(item).update
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
