# Array
## eachSlice

```javascript
Array.prototype.eachSlice = function(size) {
this.arr = [];
for (var i = 0, l = this.length; i < l; i += size) {
this.arr.push(this.slice(i, i + size));
}
return this.arr;
};

[1, 2, 3, 4, 5, 6].eachSlice(2);

// output
/* [ [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] ] */
```

## splice

既存の要素の取り除き、置き換え、新しい要素の追加ができる

cf. https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Array/splice

```javascript
const months = ['Jan', 'March', 'April', 'June'];
months.splice(1, 0, 'Feb');
// inserts at index 1
console.log(months);
// expected output: Array ["Jan", "Feb", "March", "April", "June"]

months.splice(4, 1, 'May');
// replaces 1 element at index 4
console.log(months);
```

