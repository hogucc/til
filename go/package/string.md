# strings

https://pkg.go.dev/strings

## 文字列の連結

stringsBuilderを使う。 `+=` でも連携はできるが、追加するたびに新しい文字列が作成されてメモリが確保されるので、処理速度はstringsBuilderに比べて遅い
`WriteString` で文字列を連結する

```go
package main

import (
	"fmt"
	"strings"
)

func main() {
	var b strings.Builder
	for i := 3; i >= 1; i-- {
		fmt.Fprintf(&b, "%d...", i)
	}
	b.WriteString("ignition")
	fmt.Println(b.String())
    // => 3...2...1...ignition
}
```
