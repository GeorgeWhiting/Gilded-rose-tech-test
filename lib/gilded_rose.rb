require_relative 'normal'
require_relative 'brie'
require_relative 'pass'
require_relative 'sulfuras'
require_relative 'conjured'

class GildedRose

  SPECIAL_CASES = {
    'Aged Brie' => Brie,
    'Backstage passes to a TAFKAL80ETC concert' => Pass,
    'Sulfuras, Hand of Ragnaros' => Sulfuras,
    'Conjured Mana Strudel' => Conjured
  }
  DEFAULT_CASE = Normal

  def initialize(items)
    @items = items
  end

  def next_day
    @items.each do |item|
      update_quality(item)
    end
  end

  def update_quality(item)
    (SPECIAL_CASES[item.name] || DEFAULT_CASE).new(item).update
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
