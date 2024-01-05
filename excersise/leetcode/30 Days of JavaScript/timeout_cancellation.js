/**
 * @param {Function} fn
 * @param {Array} args
 * @param {number} t
 * @return {Function}
 */
var cancellable = function(fn, args, t) {
    const timerID = setTimeout(function() { fn.apply(null, args);}, t);

    const cancelFn = function() {
        clearTimeout(timerID);
    }

    return cancelFn;
};

// 即時関数を使って書くとこんなかんじ
var cancellable = function(fn, args, t) {
    const timeout = setTimeout(() => fn(...args), t)
    return () => clearTimeout(timeout)
};

