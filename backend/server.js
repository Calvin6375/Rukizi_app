// server.js
const express = require('express');
const stripe = require('stripe')('your-secret-key-here');  // Replace with your Secret Key
const app = express();
app.use(express.json());

app.post('/create-payment-intent', async (req, res) => {
  try {
    const { amount } = req.body;  // You can dynamically pass the amount here
    const paymentIntent = await stripe.paymentIntents.create({
      amount: amount,
      currency: 'usd',  // Change currency if needed
      automatic_payment_methods: { enabled: true },
    });
    res.send({
      clientSecret: paymentIntent.client_secret,
    });
  } catch (error) {
    res.status(400).send({ error: error.message });
  }
});

app.listen(4242, () => {
  console.log('Server running on http://localhost:4242');
});
