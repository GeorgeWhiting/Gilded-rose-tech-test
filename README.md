# Gilded Rose Tech Test

#### List of rules:

- Each item has a sell_in value and a quality
- Each day reduces the sell_in value and quality by one
- Once the sell by date has passed, Quality degrades twice as fast
- Item quality can never go below 0
- Item quality can never go above 50

###### Special item specific rules

- Aged Brie gains quality at the same rate normal items lose Quality
 - Quality increases by 1 per day before sell by date
 - Quality increases by 2 per day after sell by date
- Sulfuras never decreases in quality and never has to be sold
 - Sulfuras is a legendary item and has a constant quality of 80
- Backstage passes gain quality until their sell by date, then fall to 0 after
 - They gain 1 quality per day at sell_in values above 10
 - They gain 2 quality per day at sell_in values in the range 5 < x ≤ 10
 - They gain 3 quality per day at sell_in values of 5 and below
- Conjured items degrade in quality twice as fast as normal items



#### Working feature test output:
```
-------- day 0 --------
name, sellIn, quality
+5 Dexterity Vest, 10, 20
Aged Brie, 2, 0
Elixir of the Mongoose, 5, 7
Sulfuras, Hand of Ragnaros, 0, 80
Sulfuras, Hand of Ragnaros, -1, 80
Backstage passes to a TAFKAL80ETC concert, 15, 20
Backstage passes to a TAFKAL80ETC concert, 10, 49
Backstage passes to a TAFKAL80ETC concert, 5, 49
Conjured Mana Cake, 3, 6

-------- day 1 --------
name, sellIn, quality
+5 Dexterity Vest, 9, 19
Aged Brie, 1, 1
Elixir of the Mongoose, 4, 6
Sulfuras, Hand of Ragnaros, 0, 80
Sulfuras, Hand of Ragnaros, -1, 80
Backstage passes to a TAFKAL80ETC concert, 14, 21
Backstage passes to a TAFKAL80ETC concert, 9, 50
Backstage passes to a TAFKAL80ETC concert, 4, 50
Conjured Mana Cake, 2, 5
```
