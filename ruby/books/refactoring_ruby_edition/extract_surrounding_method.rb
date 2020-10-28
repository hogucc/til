# 変更前
class Person
  attr_reader :mother, :children, :name

  def initialize(name, date_of_birth, date_of_death=nil, mother=nil)
    @name, @mother = name, mother,
    @date_of_birth, @date_of_death = date_of_birth, date_of_death
    @children = []
    @mother.add_child(self) if @mother
  end

  def add_child(child)
    @children << child
  end

  def number_of_living_descendants
    children.inject(0) do |count, child|
      count += 1 if child.alive?
      count + child.number_of_living_descendants
    end
  end

  def number_of_descendants_named(name)
    children.inject(0) do |count, child|
      count += 1 if child.name == name
      count + child.number_of_descendants_named(name)
    end
  end

  def alive?
    @date_of_death.nil?
  end
end

# number_of_living_descendantsとnumber_of_descendants_namedは両方コレクションを反復処理し、家系図を再帰下降している
# 再帰ロジックの重複を取り除きたい

# まず基準に合う子孫の数を数えるという共通動作に基づくメソッド名をつける
def number_of_descendants_named(name)
  count_descendants_matching(name)
end

protected
def count_descendants_matching(name)
  children.inject(0) do |count, child|
    count += 1 if child.name == name
    count + child.count_descendants_matching(name)
  end
end

# 次に呼び出し元メソッドがサンドイッチメソッドにブロックを渡すようにする
# ブロックにメソッドの固有のロジックを組み込む
def number_of_descendants_named(name)
  count_descendants_matching { |descendant| descendant.name == name }
end

def count_descendant_matching(&block)
  children.inject(0) do |count, child|
    count += 1 if yield child
    count + child.count_descendants_matching(&block)
  end
end

def number_of_living_descendants
  count_descendants_matching { |descendant| descendant.alive? }
end
