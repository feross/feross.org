---
layout: layout
title: Buy a Commercial License
class: commercial
---

# Buy a Commercial License

Some of my work is available under a commercial license. You can instantly obtain a commercial license for this work by paying a one-time fee of $99.

<script src="https://js.stripe.com/v3"></script>

<div class='stripe-container'>
  <button id='checkout-button-sku_GS0baNR0QEWHbC' role='link'>Buy a commercial license</button>
  <div id='error-message'></div>
</div>

<script>
(function () {
  var stripe = Stripe('pk_live_rfGbMbP1lWTcHmOoA8n9hNY70020URHP1A')

  var checkoutButton = document.getElementById('checkout-button-sku_GS0baNR0QEWHbC')
  checkoutButton.addEventListener('click', function () {
    // When the customer clicks on the button, redirect
    // them to Checkout.
    stripe.redirectToCheckout({
      items: [{ sku: 'sku_GS0baNR0QEWHbC', quantity: 1 }],

      // Do not rely on the redirect to the successUrl for fulfilling
      // purchases, customers may not always reach the success_url after
      // a successful payment.
      // Instead use one of the strategies described in
      // https://stripe.com/docs/payments/checkout/fulfillment
      successUrl: 'https://feross.org/commercial/success',
      cancelUrl: 'https://feross.org/commercial/cancel'
    })
      .then(function (result) {
        if (result.error) {
          // If `redirectToCheckout` fails due to a browser or network
          // error, display the localized error message to your customer.
          var displayError = document.getElementById('error-message')
          displayError.textContent = result.error.message
        }
      })
  })
})()
</script>

You will see a charge from "WebTorrent Open Source" on your credit card statement.

If you have questions about how this works, or want to chat about obtaining a commercial license for your company or team, email me at <a href="mailto:">[my first name]@feross.org</a>.

If you already [support my open source work](/thanks/) or have a [support contract](/support/), email me at <a href="mailto:">[my first name]@feross.org</a> and I'll give you a commercial license for free.
