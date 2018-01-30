class GildedRose
  SULFURAS = 'Sulfuras, Hand of Ragnaros'
  BRIE = 'Aged Brie'
  PASS = 'Backstage passes to a TAFKAL80ETC concert'

  def initialize(items)
    @items = items
    @only_increase = [BRIE, PASS]
  end

  def next_day
    @items.each do |item|
      update_quality(item)
    end
  end

  def increase_quality(item, amount)
    amount *= 2 if item_out_of_date?(item)
    item.quality += amount
    item.quality = 50 if item.quality > 50
  end

  def decrease_quality(item, amount)
    amount *= 2 if item_out_of_date?(item)
    item.quality -= amount
    item.quality = 0 if item.quality < 0
  end

  def decrease_sellin(item, amount)
    item.sell_in -= amount
  end

  def backstage_pass_bonus_quality(item)
    increase_quality(item, 1) if item.sell_in < 11
    increase_quality(item, 1) if item.sell_in < 6
    item.quality = 0 if item_out_of_date?(item)
  end

  def item_out_of_date?(item)
    item.sell_in < 0
  end

  def quality_increases?(item)
    @only_increase.include?(item.name)
  end

  def maturing_items(item)
    increase_quality(item, 1)
    backstage_pass_bonus_quality(item) if item.name == PASS
  end

  def decaying_items(item)
    item.name.include?("Conjured") ? decrease_quality(item, 2) : decrease_quality(item, 1)
  end

  def update_quality(item)
    return if item.name == SULFURAS
    decrease_sellin(item, 1)
    quality_increases?(item) ? maturing_items(item) : decaying_items(item)
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
