const {example} = require("../../task/sync-db");


describe('section of testing',()=>{

    test('the function needs to be equivalent to 2',()=>{
        example();
        const sum =   example();
        expect(sum).toBe(2);
    })
})