## 親子コンポーネントのデータ受け渡し
### 親から子
- [プロパティ — Vue.js](https://jp.vuejs.org/v2/guide/components-props.html)

```
// 親コンポーネント
<example propA="Aだよ"></example>
```

```
// 子コンポーネント
Vue.component('example', {
  props: {
    // 基本的な型の検査 (`null` と `undefined` は全てのバリデーションにパスします)
    propA: Number,
    // 複数の型の許容
    propB: [String, Number],
    // 文字列型を必須で要求する
    propC: {
      type: String,
      required: true
    },
    // デフォルト値つきの数値型
    propD: {
      type: Number,
      default: 100
    },
    // デフォルト値つきのオブジェクト型
    propE: {
      type: Object,
      // オブジェクトもしくは配列のデフォルト値は
      // 必ずそれを生み出すための関数を返す必要があります。
      default: function () {
        return { message: 'hello' }
      }
    },
    // カスタマイズしたバリデーション関数
    propF: {
      validator: function (value) {
        // プロパティの値は、必ずいずれかの文字列でなければならない
        return ['success', 'warning', 'danger'].indexOf(value) !== -1
      }
    }
  }
})
```

### 子から親
- [API — Vue.js](https://jp.vuejs.org/v2/api/#vm-emit)
- 基礎から学ぶVue.js

```
// 親コンポーネント
<child-comp v-on:childs-event="parentsMethod">
```

```
// 子コンポーネント
Vue.component('comp-child', {
  template: '<button v-on:click="handleClick">イベント発火</button>,
  methods: {
    handleClick: function(){
      this.$emit('childs-event)
    }
  }
})
```
