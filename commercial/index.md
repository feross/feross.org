---
layout: layout
title: Buy a Commercial License
class: commercial
---

# Buy a Commercial License

Some of my work is available under a commercial license. You can instantly obtain a commercial license for this work by paying a one-time fee of $99.

<script src="https://js.stripe.com/v3"></script>

<div class='stripe-container'>
  <!-- <button class='checkout-button' role='link' data-sku='sku_GS3kyfGgM0krXi'>Buy a commercial license (last-fm)</button> -->
  <button class='checkout-button' role='link' data-sku='sku_GS0baNR0QEWHbC'>Buy a commercial license (reddit)</button>
  <div id='error-message'></div>
</div>

<script>
  const stripe = Stripe('pk_live_rfGbMbP1lWTcHmOoA8n9hNY70020URHP1A')

  const $checkoutButtons = document.querySelectorAll('.checkout-button')

  $checkoutButtons.forEach($checkoutButton => {
    $checkoutButton.addEventListener('click', () => {
      const opts = {
        items: [{ sku: $checkoutButton.dataset.sku, quantity: 1 }],
        successUrl: 'https://feross.org/commercial/success',
        cancelUrl: 'https://feross.org/commercial/cancel'
      }

      stripe
        .redirectToCheckout(opts)
        .then(result => {
          if (result.error) {
            var displayError = document.getElementById('error-message')
            displayError.textContent = result.error.message
          }
        })
    })
  })
</script>

You will see a charge from "WebTorrent Open Source" on your credit card statement.

If you have questions about how this works, or want to chat about obtaining a commercial license for your company or team, email me at <a href="mailto:">[my first name]@feross.org</a>.

If you already [support my open source work](/thanks/) at any level (even $1/month) or have a [support contract](/support/), email me at <a href="mailto:">[my first name]@feross.org</a> to get any commercial license at no charge.
