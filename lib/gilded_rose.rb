class GildedRose
  SULFURAS = 'Sulfuras, Hand of Ragnaros'

  def initialize(items)
    @items = items
    @only_increase = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert']
  end

  def next_day
    @items.each do |item|
      update_quality(item)
    end
  end

  def increase_quality(item, amount)
    # amount *= 2 if item.sell_in < 0
    item.quality += amount unless item.name == 'Sulfuras, Hand of Ragnaros'
    item.quality = 50 if item.quality > 50
  end

  def decrease_quality(item, amount)
    # amount *= 2 if item.sell_in < 0
    item.quality -= amount unless item.name == 'Sulfuras, Hand of Ragnaros'
    item.quality = 0 if item.quality < 0
  end

  def decrease_sellin(item, amount)
    item.sell_in -= amount unless item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def backstage_pass_bonus_quality(item)
    if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      increase_quality(item, 1) if item.sell_in < 11
      increase_quality(item, 1) if item.sell_in < 6
    end
  end

  def item_out_of_date?(item)
    item.sell_in < 0
  end

  def update_quality(item)
    if !@only_increase.include?(item.name)
      decrease_quality(item, 1)
    else
      increase_quality(item, 1)
      backstage_pass_bonus_quality(item)
    end
    decrease_sellin(item, 1)
    if item_out_of_date?(item)
      decrease_quality(item, 1) unless @only_increase.include?(item.name)
      increase_quality(item, 1) if item.name == 'Aged Brie'
      decrease_quality(item, item.quality) if item.name == 'Backstage passes to a TAFKAL80ETC concert'
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
