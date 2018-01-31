class GildedRose
  def initialize(items)
    @items = items
  end

  def next_day
    @items.each do |item|
      update_quality(item)
    end
  end

  def update_normal_item(item)
    item.sell_in -= 1
    return if item.quality <= 0
    item.quality -= 1
    item.quality -= 1 if item.sell_in < 0
  end

  def update_brie(item)
    item.sell_in -= 1
    return if item.quality >= 50
    item.quality += 1
    item.quality += 1 if item.sell_in < 0
  end

  def update_pass(item)
    item.sell_in -= 1
    return item.quality = 0 if item.sell_in < 0
    return if item.quality >= 50
    item.quality += 1
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 6
  end

  def update_sulfuras(item); end

  def update_quality(item)
    case item.name

    when 'Glyph of Thorns'
      update_normal_item(item)

    when 'Aged Brie'
      update_brie(item)

    when 'Backstage passes to a TAFKAL80ETC concert'
      update_pass(item)

    when 'Sulfuras, Hand of Ragnaros'
      update_sulfuras(item)
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
