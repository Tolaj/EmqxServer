const app = require('express')();
const http = require('http').Server(app);
const io = require('socket.io')(http);
const port1 = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.get('/ws', (req, res) => {
  io.emit('chat message', 'msg');
});

io.on('connection', (socket) => {
  socket.on('chat message', msg => {
    io.emit('chat message', msg);
  });
});

http.listen(port1, () => {
  console.log(`Socket.IO server running at http://localhost:${port1}/`);
});

const mqtt = require('mqtt')

const host = "foo_emqx"
const port = "1883"
const clientId = 'nodejsServer'

const connectUrl = `mqtt://${host}:${port}`
const client = mqtt.connect(connectUrl, {
  clientId,
  clean: true,
  connectTimeout: 4000,
  username: '',
  password: '',
  reconnectPeriod: 1000,
})

console.log('started')
const topic = "/testtopic/Temperature"
client.on('connect', () => {
  console.log('Connected')
  client.subscribe([topic], () => {
    console.log(`Subscribe to topic '${topic}'`)
  })
  client.publish(topic, 'nodejs mqtt test', { qos: 0, retain: false }, (error) => {
    if (error) {
      console.error(error)
    }
  })
})
client.on('message', (topic, payload) => {
  io.emit('chat message', "From: "+topic+" "+ payload.toString());
  console.log('Received Message:', topic, payload.toString())
})
