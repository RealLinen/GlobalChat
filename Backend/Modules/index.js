const Table = {}
//++++++++++++++++++++++++++++++++++++++++++++\\
Table.express = require("express")
Table.fetch=require('cross-fetch');
Table.express_ws = require("express-ws")
Table.fs = require('fs')
Table.port = (process.env.PORT || process.env.pORT || process.env.Port || process.env.port)
Table.check = function(...par){
    let result = true;
    for(i in par){if(!par[i]){return null}result=par[i]};return result;
}
Table.luaTime=function(){return(new Date()).getTime().toString().substring(0,10);}
Table.ranstring = function (len, charSet) {
    charSet = charSet || 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var randomString = '';
    for (var i = 0; i < len; i++) {
        var randomPoz = Math.floor(Math.random() * charSet.length);
        randomString += charSet.substring(randomPoz,randomPoz+1);
    }
    return randomString;
}
Table.getMembers = function(args){
    let users = [];
    for(i in args){
        let v = args[i]
        v = (v).replace("<@","").replace(">","").replace("!","").replace("<@","").replace(">","").replace("!","").replace("<@","").replace(">","").replace("!","")
        if(Table.check(parseInt(v),parseInt(v)>=50000000000000000)){
            users.push(v)
        }
    };
    return users
}
Table.findInTable = function(t,s,a){
    for(i in t){
        try{
            if((i+"").toLowerCase().includes(s)){
                if(a)return i;
                return t[i]
            }
            if((t[i]+"").toLowerCase().includes(s)){
                if(a)return i;
                return t[i]
            }
            if((i+"").toLowerCase().includes(s.toLowerCase())){
                if(a)return i;
                return t[i]
            }
            if((t[i]+"").toLowerCase().includes(s.toLowerCase())){
                if(a)return i;
                return t[i]
            }
        }catch(err){}
    }
    return null
}
Table.filterTable = function(table = Table,v = Function){
    table=typeof(table)=="object"&&table||{Example:"You will not see or you will see ass contained in this table because it was filtered out",ass:true}
    v = typeof(v)=="function"&&v||function(v,i){if(v[i]=="ass")return false;return true}
    let returning={}
    for(i in table){let xd=v(table[i],i);if(xd){if(xd!==true){returning[xd]=table[i]}else{returning[i]=table[i]}}};return returning
}
Table.parseTable = function(s,a){
    let isJSON = function(x){try{JSON.parse(x)}catch(err){return false}return true}
    if(a){if(!isJSON(s)){s = JSON.stringify(s)}};let err = false;let gg=s;while(!err){try{gg=JSON.parse(gg)}catch(erxr){err=true}}return gg
}
//++++++++++++++++++++++++++++++++++++++++++++\\
module.exports=Table