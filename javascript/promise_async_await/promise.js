function doubleNumber(data) {
  return new Promise(function(resolve) {
    setTimeout(function() {
      resolve(data * 2);
    }, Math.random() * 1000);
  });
}
function sample_promise() {
  doubleNumber(100)
    .then(data => {
      console.log(data); // => 200
      return doubleNumber(data);
    })
    .then(data => {
      console.log(data); // => 400
      return doubleNumber(data);
    })
    .then(data => {
      console.log(data); // => 800
    });
}

sample_promise();
