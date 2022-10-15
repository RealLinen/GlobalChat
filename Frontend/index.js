const luamin = require('lua-format')
const fs = require("fs")

const code = fs.readFileSync(__dirname + "/" + "input.lua", "utf-8")
const source = luamin.Minify(code, {
  RenameVariables: false,
  RenameGlobals: true,
  SolveMath: false
})
fs.writeFileSync("output.txt", source)