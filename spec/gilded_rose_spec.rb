describe GildedRose do
  describe '#update_quality' do
    context 'Sulfuras, Hand of Ragnaros' do
      it 'never changes quality' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 80)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 80
      end

      it 'never changes sell_in' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 80)]
        GildedRose.new(items).next_day
        expect(items[0].sell_in).to eq 10
      end
    end

    context 'Aged Brie' do
      it 'increases in quality each day' do
        items = [Item.new('Aged Brie', 10, 10)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 11
      end

      it 'quality goes up by 2 after sell by date passes ' do
        items = [Item.new('Aged Brie', -1, 10)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 12
      end

      it 'cannot have a quality greater than 50' do
        items = [Item.new('Aged Brie', 10, 50)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 50
      end

      it 'sell_in value decreases by one each day' do
        items = [Item.new('Aged Brie', 0, 10)]
        GildedRose.new(items).next_day
        expect(items[0].sell_in).to eq -1
      end
    end

    context 'Backstage Pass' do
      it 'quality increases by 1 when its sell_in value is above 10' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 10)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 11
      end

      it 'quality increases by 2 when its sell_in value is between 6 and 10' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 8, 10)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 12
      end

      it 'quality increases by 3 when its sell_in value is below 6' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 13
      end

      it 'quality drops to 0 after the sell by date' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 0
      end

      it 'cannot have a quality greater than 50' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 50)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 50
      end

      it 'sell_in value decreases by one each day' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10)]
        GildedRose.new(items).next_day
        expect(items[0].sell_in).to eq -1
      end
    end

    context 'Conjured' do
      it "Conjured item quality decreases by 2 each day" do
        items = [Item.new("Conjured Mana Strudel", 10, 10)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 8
      end

      it "Conjured item quality decreases by 4 each day after sell by date passes" do
        items = [Item.new("Conjured Mana Strudel", 0, 10)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 6
      end

      it 'Item quality can never be negative' do
        items = [Item.new('Conjured Mana Strudel', 10, 0)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 0
      end

      it 'sell_in value decreases by one each day' do
        items = [Item.new('Conjured Mana Strudel', 0, 10)]
        GildedRose.new(items).next_day
        expect(items[0].sell_in).to eq -1
      end
    end

    context 'Normal item' do
      it 'has its quality decreased each day' do
        items = [Item.new('Glyph of Thorns', 10, 10)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 9
      end

      it 'quality can never be negative' do
        items = [Item.new('Glyph of Thorns', 10, 0)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 0
      end

      it 'quality decreases twice as fast after sell by date has passed' do
        items = [Item.new('Glyph of Thorns', 0, 10)]
        GildedRose.new(items).next_day
        expect(items[0].quality).to eq 8
      end

      it 'sell_in value decreases by one each day' do
        items = [Item.new('Glyph of Thorns', 0, 10)]
        GildedRose.new(items).next_day
        expect(items[0].sell_in).to eq -1
      end
    end
  end
end
