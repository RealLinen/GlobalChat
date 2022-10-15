const Table = require("./Modules")
const server = Table.express_ws(Table.express()).app
const connections = {}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\\
server.ws("/GlobalChat",async(req,res)=>{
    let [ identifier, fingerprint ] = [Table.findInTable(res.headers,"Identi"),Table.findInTable(res.headers,"Finger")]
    var close = async function(msg){await req.send(msg||"No message supplied");setTimeout(function(){req.close()},2000)};
    if( !identifier || !fingerprint ) return await close(`print([[Request Deined! Invalid Body]])`)
    close = async function(msg){try{await req.send(msg||"No message supplied")}catch(err){};connections[fingerprint] = null;setTimeout(function(){req.close()},2000)};
    if(connections[fingerprint]){
        await connections[fingerprint].close(`print[[ You already had an session, it was cleared! ]]`)
    }
    console.log(`Client "${fingerprint}" Connected!`)
    await req.send(`print[[Chat UI: Global Started Working]]`)
    connections[fingerprint] = { 
        send: async(msg)=>{ await req.send(msg||"No message supplied"); },
        close: close
    }
    var sendR = connections[fingerprint]
    req.on("message", async(msg)=>{ msg = msg.toString()
        let jsonFile = Table.parseTable(msg)
        if(jsonFile && typeof(jsonFile["userdata"])=="object"){
            let mType = jsonFile["type"]
            let mUsername = jsonFile["userdata"]["username"]
            let mUserId = jsonFile["userdata"]["userid"]
            let mMessage = jsonFile["userdata"]["message"]
            if(!connections[fingerprint].userId){
                connections[fingerprint].userId = mUserId
            }
            if(!connections[fingerprint].username){
                connections[fingerprint].username = mUsername 
            }
            if(mType=="msg" && Table.check(mType, mUsername, mUserId, mMessage)){
                jsonFile["userdata"]["username"] = Table.ranstring(7)
                jsonFile["userdata"]["userid"] = "Nice try spoofing L"
                for(i in connections){ let client = connections[i];if(!client)return;
                    try{ await client.send(JSON.stringify(jsonFile)) }catch(err){}
                }
            }
        }
    })
    req.on("close", async()=>{
        await close("print[[You ended the request lmao]]")
    })
    setTimeout(async()=>{ try{ await close(`print[[Maximum connection time exceeded, you have been disconnected!]]`) }catch{}}, (60000) * 300)
})
server.get("*",async(req,res)=>{ return res.end("hello!") })
server.listen(process.env.PORT || 3000, function(){ console.log("Express server listening on port %d in %s mode", this.address().port, server.settings.env); });