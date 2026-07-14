# Artwork-First Shopify Framework

This is a Shopify Online Store 2.0 theme scaffold for an artwork-first store connected to Printify.

The storefront model is:

- Artwork is the primary product.
- Products are canvases for the artwork.
- Collections are lifestyles, moods, and drops.
- Drops are temporary release chapters.
- Archived drops remain visible after sellout or close.

## What Is Built

- Theme shell: header, footer, layout, colors
- Homepage: active drop hero, featured artworks, lifestyle collection tiles, story panel
- Collections: visual collection hero and artwork grid
- Product page: large image-first gallery, sticky purchase panel, variant/canvas selector
- Cart: simple canvas-focused cart
- Archive: `page.drop-archive` and `collection.archive` templates
- Artwork index: `page.artworks` template
- Shop worlds: `page.shop-worlds`, `page.sports`, and `collection.world` templates
- Search and 404 pages
- Newsletter/drop notification section

## Shopify Setup Order

### 1. Upload or connect the theme

Use this folder as the theme source. In Shopify, install it as an unpublished theme first so we can test before publishing.

Minimum folders Shopify expects:

- `assets`
- `config`
- `layout`
- `locales`
- `sections`
- `snippets`
- `templates`

### 2. Set up navigation

In Shopify Admin, go to `Online Store > Navigation`.

Create or edit `Main menu`:

- New Drops: link to the active drop collection
- Sports: link to the `Sports` page
- Outdoors: link to the Fishing collection or a future Outdoors page
- Lifestyle: link to the Lifestyle collection
- Artworks: link to the `Artworks` page
- Archive: link to the `Drop Archive` page

Create or edit `Footer menu`:

- Shipping
- Returns
- Contact
- Instagram or social link

The header and footer sections already read Shopify menus.

### 3. Build the homepage

In `Online Store > Themes > Customize`, open the homepage.

Configure:

- `Artwork drop hero`: assign the current drop collection and hero image
- `Featured artworks`: assign the current drop collection or manually select products
- `Lifestyle collections`: add tiles for mood/lifestyle collections
- `Story panel`: keep this short and visual

The homepage should feel like a gallery entrance, not a catalog page.

### 4. Create collections

Create collections around big worlds first.

Core world collections:

- New Drops
- NFL
- NBA
- MLB
- NCAA
- Racing
- Fishing
- Lifestyle
- Best Sellers
- Archive

Use manual collections at first. Move to automated collections later when tags are consistent.

Create collections around two purposes inside that structure.

Drop collections:

- New Drops
- Drop 001
- Drop 002

Lifestyle collections:

- After Hours
- Sun Bleached
- Concrete Garden
- Studio Uniform
- Late Summer Static

For the active drop collection, assign the `collection.drop` template.

For older releases, assign the `collection.archive` template.

For normal lifestyle collections, use the default `collection` template.

For NFL, NBA, MLB, NCAA, Racing, Fishing, and Lifestyle, use the `collection.world` template.

### 5. Create archive and artwork index pages

Create a page named `Drop Archive`.

Assign template:

- `page.drop-archive`

Create a page named `Artworks`.

Assign template:

- `page.artworks`

Create a page named `Shop Worlds`.

Assign template:

- `page.shop-worlds`

Create a page named `Sports`.

Assign template:

- `page.sports`

Then add both pages to navigation.

### 6. Product model

Each Shopify product should represent one artwork.

The product title should be the customer-facing artwork name, not the Printify base product name.

Use variants/options for the physical canvas:

- Canvas: Tee, hoodie, poster, print
- Size: S, M, L, XL or print dimensions
- Color: garment/material color

Keep the main description practical:

- Fit
- Material
- Print method
- Shipping
- Returns

Put deeper creative context in metafields.

### 7. Recommended metafields

Create these product metafields in Shopify Admin:

- `custom.artwork_title`: single line text
- `custom.artist_name`: single line text
- `custom.artwork_story`: rich text
- `custom.drop_status`: single line text

Optional collection metafield:

- `custom.collection_label`: single line text

Examples:

- `Live drop`
- `Edition 01`
- `Archive`
- `Lifestyle`

### 8. Printify mapping

Printify should handle production and fulfillment. Shopify should control presentation.

When Printify syncs products into Shopify:

- Rename products to artwork-first titles
- Rewrite descriptions into short practical details
- Assign products to the correct drop and lifestyle collections
- Add artwork metafields
- Reorder images so the strongest visual comes first
- Confirm variants match the intended canvas model

Do not let generic Printify product names become the customer-facing brand system.

### 9. Cart and checkout

The cart is already styled around selected canvases.

Checkout itself is handled by Shopify. Test with a hidden/unpublished theme before launch.

### 10. Launch checklist

Before publishing:

- Add 2-3 test Printify products
- Assign them to a current drop collection
- Assign the collection to the homepage hero and featured artworks
- Add real artwork/lifestyle imagery
- Test product variant selection
- Test add to cart
- Test cart quantity updates
- Test mobile views
- Confirm Printify receives the order correctly

## Next Build Phase

Recommended next upgrades:

- Automated Printify-to-Shopify cleanup workflow
- Automated collection assignment by tags
- Drop countdown
- Edition quantity messaging
- Sold-out archive styling
- Artist profile pages
- Lookbook/editorial page template
- SMS/email drop reminder integration
