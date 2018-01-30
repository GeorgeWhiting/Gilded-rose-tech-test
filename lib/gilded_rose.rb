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
    item.quality += amount
  end

  def decrease_quality(item, amount)
    item.quality -= amount
  end

  def decrease_sellin(item, amount)
    item.sell_in -= amount
  end

  def update_quality(item)
    if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
      if item.quality > 0
        if item.name != "Sulfuras, Hand of Ragnaros"
          decrease_quality(item, 1)
        end
      end
    else
      if item.quality < 50
        increase_quality(item, 1)
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in < 11
            if item.quality < 50
              increase_quality(item, 1)
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              increase_quality(item, 1)
            end
          end
        end
      end
    end
    if item.name != "Sulfuras, Hand of Ragnaros"
      decrease_sellin(item, 1)
    end
    if item.sell_in < 0
      if item.name != "Aged Brie"
        if item.name != "Backstage passes to a TAFKAL80ETC concert"
          if item.quality > 0
            if item.name != "Sulfuras, Hand of Ragnaros"
              decrease_quality(item, 1)
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if item.quality < 50
          increase_quality(item, 1)
        end
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

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
