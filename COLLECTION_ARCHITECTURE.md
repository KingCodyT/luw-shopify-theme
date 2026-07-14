# LUW Collection Architecture

This is the store structure to create before adding real inventory.

## Main Store Worlds

Create these Shopify collections first:

- `New Drops`
- `NFL`
- `NBA`
- `MLB`
- `NCAA`
- `Racing`
- `Fishing`
- `Lifestyle`
- `Best Sellers`
- `Archive`

Use `Manual` collections while the catalog is small and while the Printify workflow is still being tuned.

Move to automated collections later when tags and product naming are consistent.

## Page Structure

Create these pages:

- `Shop Worlds`
- `Sports`
- `Artworks`
- `Drop Archive`

Template assignments when Shopify exposes the dropdown:

- `Shop Worlds` -> `page.shop-worlds`
- `Sports` -> `page.sports`
- `Artworks` -> `page.artworks`
- `Drop Archive` -> `page.drop-archive`

If Shopify does not show the template dropdown, create the pages anyway. The theme editor can be tuned after the custom theme is active.

## Collection Templates

Use these templates:

- `New Drops` / `Current Drop` -> `collection.drop`
- Old drops -> `collection.archive`
- NFL, NBA, MLB, NCAA, Racing, Fishing, Lifestyle -> `collection.world`
- Best Sellers -> default `collection`

## Navigation

Keep the main navigation short:

- New Drops
- Sports
- Outdoors
- Lifestyle
- Archive

Avoid adding every league, team, or product type to the main menu.

Use the `Shop Worlds` and `Sports` pages to show large collection tiles.

## Product Tagging System

Use tags consistently so collections and filters can become automated later.

Recommended tags:

- `world:nfl`
- `world:nba`
- `world:mlb`
- `world:ncaa`
- `world:racing`
- `world:fishing`
- `world:lifestyle`
- `drop:001`
- `drop:current`
- `canvas:tee`
- `canvas:hoodie`
- `canvas:poster`
- `canvas:hat`
- `status:archive`
- `status:evergreen`

Optional tags:

- `season:football`
- `season:basketball`
- `season:baseball`
- `season:spring`
- `season:summer`
- `mood:game-day`
- `mood:tailgate`
- `mood:lake`
- `mood:track`

## Product Naming

Use artwork-first product names, not Printify base names.

Good:

- `Sunday Standard`
- `Courtside Lyfe`
- `Bottom of the Ninth`
- `Bass Season`
- `Checkered Weekend`

Avoid:

- `Unisex Heavy Cotton Tee`
- `Men's Hoodie`
- `Poster Matte Vertical`

## Printify Workflow

For each product published from Printify:

1. Publish to Shopify.
2. Open it in Shopify Products.
3. Rename it to an artwork-first title.
4. Add it to the correct collection.
5. Add world/drop/canvas tags.
6. Remove duplicate mockups.
7. Put the strongest image first.
8. Keep the description short and practical.

Once this workflow is stable, automate cleanup through the Shopify and Printify APIs.
