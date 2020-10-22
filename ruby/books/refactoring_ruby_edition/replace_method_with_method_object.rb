# リファクタリング前
class Account
  def gamma(input_val, quantity, year_to_date)
    inportant_value1 = (input_val * quantity) + delta
    important_value2 = (input_val * year_to_date) + 100
    if(year_to_date -important_value1) > 100
      important_value2 -= 20
    end
    important_value3 = important_value2 * 7
    important_value3 - 2 * important_value1
  end
end

# ----------------------------------------
# リファクタリングの過程
# クラスの宣言
class Gammma
  attr_reader :account,
              :input_val_arg,
              :quantity,
              :year_to_date,
              :important_value1,
              :important_value2,
              :important_value3

  # コンストラクタの追加
  def initialize(account, input_val_arg, quantity_arg, year_to_date_arg)
    @account = account
    @input_val = input_val_arg
    @quantity = quantity_arg
    @year_to_date = year_to_date
  end

  def compute
    @inportant_value1 = (input_val * quantity) + @account.delta
    @important_value2 = (input_val * year_to_date) + 100
    important_thing
    @important_value3 = important_value2 * 7
    @important_value3 -2 * important_value1
  end

  # 引数渡しなどの心配をせずにcomputeメソッドに対してメソッドの抽出をできる
  def important_thing
    if(year_to_date -important_value1) > 100
      @important_value2 -= 20
    end
  end
end

# 
class Account
  def gamma(input_val, quantity, year_to_date)
    Gammma.new(self, input_val, quantity, year_to_date).compute
  end
end

