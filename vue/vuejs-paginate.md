## vuejs-paginateというnpmでページャを実装したのでざっくりメモ
[lokyoung/vuejs-paginate: A Vue.js(v2.x+) component for creating pagination.](https://github.com/lokyoung/vuejs-paginate)

基本形は以下の通り
```
<paginate
  :page-count="20"
  :click-handler="functionName"
  :prev-text="'Prev'"
  :next-text="'Next'"
  :container-class="'className'">
</paginate>
```

以下のような指定もできる
1 2 ... 5 6みたいに間のページを...で表したくないとき
`:break-view-text="null"`
と書けば...は消えて1 2 3 4 5 6と表示される
