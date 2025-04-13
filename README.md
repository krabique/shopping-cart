# Shopping Cart

## Task

Use the latest version of Ruby and Ruby on Rails.

1. Design and implement the data model on the backend.
2. Create the frontend layout for the pages.
3. Implement the following behaviors:
Changing the quantity of items.
Deleting items.
Resetting the cart.
Amounts should recalculate when the state changes.
4. The "Checkout" button clears the cart.
5. (Bonus) Implement a discount slider: the slider controls the discount amount,
which is subtracted from the total product sum. The maximum discount value is
$100.
6. (Bonus) Deploy online using Kamal.

## Setup

It uses ruby 3.4.2 and rails 8.0.2 utilizing turbo for cart updates. It uses sqlite3 as a database for simplicity. Tailwind for css framework.

To start the project locally:

```bash
bin/setup
bin/rails s
```
And visit http://127.0.0.1:3000/

## Comments and assumptions

- It assumes that there is only one user ever, to save some time
- There was no mention of other pages, so I just added some buttons at the bottom of the cart to add new items
- I was not able to export icons from figma, so I used screenshots or very similar SVGs (trash bin for example)
- It should adapt to different screen sizes
- I added images for products into `/public` for simplicity
