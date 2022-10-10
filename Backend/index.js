const ws = require('sockjs');
const express = require("express")
const http = require('http');

const App = express()
const wsServer = ws.createServer()
//==============================\\
const connections = {}
//==============================\\
wsServer.on("connection", async(conn)=>{conn.resume();
    const headers = conn.headers
    for(i in headers){
        console.log(i, headers[i])
    }
    var connected = false
    conn.on("data", async(data=>{
        console.log(data)
    }))
    conn.close(async()=>{
        if(connected){
            connections[connected.hwid] = null
        }
    })
})
//==============================\\
const server = http.createServer(App);
wsServer.installHandlers(server, { prefix: "/ChatSystem" })
server.listen(8000, '0.0.0.0', () => {
    console.log(' [*] Listening on localhost:8000');
});