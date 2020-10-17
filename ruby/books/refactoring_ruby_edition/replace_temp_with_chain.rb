# 変更前
mock = Mock.new
expectation = mock.expects(:a_method_name)
expectation.with("arguments")
expectation.returns([1, :array])

# 変更後
mock = Mock.new
mock.expects(:a_method_name).with("arguments").returns([1, :array)
