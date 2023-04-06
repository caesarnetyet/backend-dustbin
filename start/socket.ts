import Ws from 'App/Services/Ws'
Ws.boot()

/**
 * Listen for incoming socket connections
 */
Ws.io.on('connection', (socket) => {
  socket.on('joystick', (data) => {
    console.log(data)
    socket.broadcast.emit('coordinates', data)
  })
})