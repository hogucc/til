# strconv

https://pkg.go.dev/strconv
数値変換、文字列変換を提供する

## Itoa

引数に指定された数値を文字列に変換して返す

```go
i := 10
s := strconv.Itoa(i)
fmt.Printf("%T, %v\n", s, s)
// => string, 10
```

## Atoi

引数に指定された文字列を数値に変換して返す

```go
v := "10"
if s, err := strconv.Atoi(v); err == nil {
    fmt.Printf("%T, %v", s, s)
}
// => int, 10
```
