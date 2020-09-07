// async/awaitの基本形
async function f() {
  let promise = new Promise((resolve, reject) => {
    setTimeout(() => resolve("done!"), 1000);
  });

  let result = await promise; // ここでpromiseが確定されるまで待つ

  console.log(result);
}

// =======================================================
// promise.jsの内容をasync/awaitバージョンに修正
function doubleNumber(data) {
  return new Promise(function(resolve) {
    setTimeout(function() {
      resolve(data * 2);
    }, Math.random() * 1000);
  });
}

async function sample_async_await() {
  let num = 100;
  num = await doubleNumber(num);
  console.log(num);
  num = await doubleNumber(num);
  console.log(num);
  num = await doubleNumber(num);
  console.log(num);
}

sample_async_await();
