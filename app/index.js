const Srf = require('drachtio-srf');
const srf = new Srf();

srf.connect({
  host: 'drachtio-server',
  port: 9022,
  secret: 'cymru'
});

srf.on('connect', (err, hp) => {
  console.log(`Connected to drachtio server at ${hp}`);
});

srf.on('error', (err) => {
  console.error('Error connecting to Drachtio server:', err);
});

srf.invite((req, res) => {
  res.send(486); // Busy Here (just a test response)
});
