(function test() {
    setInterval(() =>
        console.log(`[${new Date().toLocaleTimeString('short')}] - Test.ts Works!`)
        , 2000);
})();
 