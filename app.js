const cron = require('node-cron');
const {example} = require("./task/sync-db");

let times = 0;
cron.schedule('1-59/5 * * * * *',example)

console.log('start');