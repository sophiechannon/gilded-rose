Gilded Rose
===========

- Systems need to be able to accept a new class of item (conjured)

Normal items:
- degrade at 1 a day but can't go below 0
- items degree at 2 a day when passed their sell-by date
- never over 50

Aged brie:
- increases in value by 1
- never over 50
- continues improving after SellIn date

Backstage pass:
- increases in value by 1
- by 2 within 10 days, and by 3 within 5 days
- drops to 0 after concert (end of SellIn day)
- never over 50

Sulfuras:
- Never have to be sold (infiniate SellIn date)
- Never degrade in quality
- never over 50

NEW - conjured:
- degrades by 2 each day
- degrades by 4 after SellIn date

## Tests

- check that all items' sell_in degrades at the correct rate
- check that all items' quality degrades at the correct rate
- check that quality cannot exceed 50 on any items
- prevent items from having negative sell_in when initialised
- prevent items from having > 50 quality when initialised
- capital letters etc