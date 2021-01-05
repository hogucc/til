# 『Rubyのしくみ』から引用
# クラスメソッドはsingleton_classに保存される
ObjectSpace.count_objects[:T_CLASS]
=> 1013
class Mathematician; end
=> nil
ObjectSpace.count_objects[:T_CLASS]
# クラスを定義すると2つクラスが追加される
=> 1015
p Mathematician.singleton_class
# Mathematicianクラス以外に作成されるのが以下のメタクラス
# メタクラスはRubyが自動生成するRClass構造体で、Rubyがクラスメソッドを保存する場所
#<Class:Mathematician>
=> #<Class:Mathematician>
