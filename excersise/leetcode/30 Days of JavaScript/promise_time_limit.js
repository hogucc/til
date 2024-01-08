/**
 * @param {Function} fn
 * @param {number} t
 * @return {Function}
 */
var timeLimit = function(fn, t) {
    let timeoutId = null;
    const timeoutPromise = new Promise((_, reject) => {
        timeoutId = setTimeout(() => reject("Time Limit Exceeded"), t);
    });

    return async function(...args) {
        return await Promise.race([fn(...args), timeoutPromise])
    }
};

// こっちのほうが戻り値がわかりやすいかも
var timeLimit = function(fn, t) {

    return async function(...args) {
        const result = await Promise.race([
            fn(...args),
            new Promise((_, reject) => setTimeout(() => reject("Time Limit Exceeded"), t))
        ])
        return result;
    }
};