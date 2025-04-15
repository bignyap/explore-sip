const Srf = require('drachtio-srf');
const srf = new Srf();

srf.connect({
  host: 'drachtio-server',
  port: 9022,
  secret: 'cymru'
});

// ... existing code ...
srf.on('connect', (err, hp) => {
  if (err) {
    console.error(`Error connecting to drachtio server: ${err}`);
  } else {
    console.log(`Connected to drachtio server at ${hp}`);
  }
});
// ... existing code ...

srf.invite((req, res) => {
  res.send(486, 'So sorry, busy right now', {
    headers: {
      'X-Custom-Header': 'because why not?'
    }
  });
});
