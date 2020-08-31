---
layout: layout
title: One Hour Consultation
class: consult
---

# One Hour Consultation

- **Get support and advice** on JavaScript, Node.js, or open source issues
- **One hour** of dedicated time with an expert
- **$500** secure one-time payment through Stripe (invoice provided)

<script src="https://js.stripe.com/v3"></script>

<div class='stripe-container'>
  <button class='checkout-button' role='link' data-sku='sku_Hw9o4I6Iv7x77F'>Book a one hour consultation</button>
  <div id='error-message'></div>
</div>

<script>
  const stripe = Stripe('pk_live_rfGbMbP1lWTcHmOoA8n9hNY70020URHP1A')

  const $checkoutButtons = document.querySelectorAll('.checkout-button')

  $checkoutButtons.forEach($checkoutButton => {
    $checkoutButton.addEventListener('click', () => {
      const opts = {
        items: [{ sku: $checkoutButton.dataset.sku, quantity: 1 }],
        successUrl: 'https://feross.org/consult/success',
        cancelUrl: 'https://feross.org/consult/cancel'
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

After you pay, you will be able to schedule a time for the consultation which will take place over Google Meet or Zoom.

You will see a charge from "WebTorrent Open Source" on your credit card statement.

If you have questions about how this works, or want to chat about obtaining a consultation for your company or team, email me at <a href="mailto:">[my first name]@feross.org</a>.
