// server.js
const express = require('express');
const client - require('prom-client');
const app = express();

const collectDefaultMetrics = client.collectDefaultMetrics;
collectDefaultMetrics(); //cpu/mem, event loop, etc.

app.get('/', (_,res)=> res.send('ok'));
app.get('/metrics', async (_, res) => {
  res.set('Content-Type', client.register.contentType);
  res.end(await client.register.metrics());
});

app.listen(8080, '0.0.0.0', () => console.log('listening on 8080'));
