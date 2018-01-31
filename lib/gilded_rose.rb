require_relative 'normal'
require_relative 'brie'
require_relative 'pass'
require_relative 'sulfuras'
class GildedRose
  def initialize(items)
    @items = items
  end

  def next_day
    @items.each do |item|
      update_quality(item)
    end
  end

  def update_quality(item)
    case item.name

    when 'Aged Brie'
      Brie.new(item).update

    when 'Backstage passes to a TAFKAL80ETC concert'
      Pass.new(item).update

    when 'Sulfuras, Hand of Ragnaros'
      Sulfuras.new(item).update

    else
      Normal.new(item).update
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

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
