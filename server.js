'use strict';

const express = require('express');

// Constants
const PORT = 80;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World 👋');
});

// Health Check
app.get('/health-check', (req, res) => {
  res.send('Server is healthy');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);

console.log(`Hello from the app 📦`);
console.log(`The value of the MY_ENV_VAR environment variable is: ${ process.env.MY_ENV_VAR }`);
