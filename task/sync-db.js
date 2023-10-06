
let times = 0;
 const example = ()=>{
    console.log('Running a task every 5 second: tick',times);
    times++;

    return times;
}

module.exports = { example }