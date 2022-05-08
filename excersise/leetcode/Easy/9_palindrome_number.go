// goで解くとこんなかんじ
// 以下から引用
// https://leetcode.com/problems/palindrome-number/discuss/1628471/Go-solution
func isPalindrome(x int) bool {
    if x < 0 {
        return false
    }

    tmp := x
    var value []int
    times := 1

    for tmp != 0 {
        // 10で割った余り＝下の桁から順に配列に格納する
        value = append(value, tmp%10)
        tmp /= 10
    }

    tmp = 0
    for i := len(value) - 1; i >= 0; i-- {
        // 各桁に重みづけ（1, 10, 100）して元の数値を取得
        tmp += value[i] * times
        times *= 10
    }

    return x == tmp
}
