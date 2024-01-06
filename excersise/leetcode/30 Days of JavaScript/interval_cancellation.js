/**
 * @param {Function} fn
 * @param {Array} args
 * @param {number} t
 * @return {Function}
 */
var cancellable = function(fn, args, t) {
    let timeoutId = null;
    fn(...args);

    const startInterval = () => {
        timeoutId = setTimeout(() => {
            fn(...args);
            startInterval();
        }, t)
    };
    startInterval();

    const cancelFn = () => {
        if (timeoutId !== null) {
            clearTimeout(timeoutId);
        }
    };

    return cancelFn;
};

// setInterval使ったほうがシンプル
var cancellable = function(fn, args, t) {
    fn(...args)
    const interId = setInterval(()=>fn(...args), t)
    return function(){
        clearInterval(interId)
    }
};