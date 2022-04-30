# 提出したコード
puts gets.chomp.split.map(&:to_i).sum

# 提出されたコードの中にこんなものがあった
# evalを使うとこんなかんじで書けるっぽい
# getsに含まれるスペースをString#trメソッドで+に変換して計算している
# そうすると `"123+456\n"` のような文字列が生成されるので、evalでRubyプログラムとして評価し、その結果を返している
p eval gets.tr' ',?+
