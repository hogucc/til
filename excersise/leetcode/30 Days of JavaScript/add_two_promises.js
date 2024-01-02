/**
 * @param {Promise} promise1
 * @param {Promise} promise2
 * @return {Promise}
 */
var addTwoPromises = async function(promise1, promise2) {
    return (await promise1) + (await promise2);
};

/**
 * addTwoPromises(Promise.resolve(2), Promise.resolve(2))
 *   .then(console.log); // 4
 */

// 上は自分の回答。以下の回答はPromise.allを使っていた
// var addTwoPromises = async function(promise1, promise2) {
//     const results = await Promise.all([promise1, promise2]);
//     return results[0] + results[1];
// };

// こちらはreduceを使っていた。2つ以上の値を足す場合にはこちらの方が良いかも
var addTwoPromises = async function(promise1, promise2) {
    return Promise.all([promise1, promise2]).then((resolve) => {
        return resolve.reduce((sum, value) => sum + value, 0);
    });
};