class GildedRose
  def initialize(items)
    @items = items
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

  def update_quality(item)
    if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
      decrease_quality(item, 1)
    else
      increase_quality(item, 1)
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        increase_quality(item, 1) if item.sell_in < 11
        increase_quality(item, 1) if item.sell_in < 6
      end
    end
    decrease_sellin(item, 1)
    if item.sell_in < 0
      if item.name != 'Aged Brie'
        if item.name != 'Backstage passes to a TAFKAL80ETC concert'
          decrease_quality(item, 1) if item.quality > 0
        else
          item.quality = item.quality - item.quality
        end
      else
        increase_quality(item, 1)
      end
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
