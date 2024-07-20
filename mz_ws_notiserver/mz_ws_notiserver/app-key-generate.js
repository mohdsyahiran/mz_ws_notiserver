const {createHash,randomBytes} = require('node:crypto');

console.log(createHash('sha256').update(randomBytes(64)).digest('hex'));