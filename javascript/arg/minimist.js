// npmのminimistを使うと、コマンドライン引数をハッシュ形式で受け取れる
const argv = require("minimist")(process.argv.slice(2));
console.log(argv);
// xはハッシュのkey
console.log(argv["x"]);

// example

// $ node example/parse.js -x 3 -y 4 -n5 -abc --beep=boop foo bar baz
// output
// { _: [ 'foo', 'bar', 'baz' ],
//   x: 3,
//   y: 4,
//   n: 5,
//   a: true,
//   b: true,
//   c: true,
//   beep: 'boop' }

// install
// $ npm install minimist
