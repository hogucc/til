# 一時変数からチェインへ
# 変更前
mock = Mock.new
expectation = mock.expects(:a_method_name)
expectation.with("arguments")
expectation.returns([1, :array])

# 変更後
mock = Mock.new
mock.expects(:a_method_name).with("arguments").returns([1, :array)

# 関わるオブジェクトが1種類だけの場合に使う
# 1つのオブジェクトの表現力を高める

# 例2
class Select 
  def options
    @options ||= []
  end

  def add_option(arg)
    options << arg
  end

  select = Select.new
  select.add_option(1999)
  select.add_option(2000)
  select.add_option(2001)
  select.add_option(2002)
end

# 上のadd_option群をチェイン呼び出しに変更したのが以下
class Select
  def self.with_option(option)
    select = self.new
    select.options << options
    select
  end

  def options
    @options ||= []
  end

  def and
    options << arg
    self
  end
end

select = Select.with_option(1999).and(2000).and(2001).and(2002)
