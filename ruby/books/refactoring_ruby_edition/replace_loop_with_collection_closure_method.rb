# selectを使う
# 変更前
managers = []
employees.each do |e|
  managers << e if e.manager?
end

# 変更後
managers = employees.select { |e| e.manager?}

# collectを使う
# 変更前
officers = []

employees.each {|e| officers << e.office}

# 変更後
officers = employee.collect {|e| e.office}

# メソッドチェイン
# 変更前
managerOfficers - []
employees.each do |e|
  managerOfficers << e.office if e.manager?
end

# 変更後
managerOffices = employees.select {|e| e.manager?}.collect {|e| e.office}

# injectを使う
# 変更前
total = 0
employees.each {|e|total += e.salary}

# 変更後
total = employees.inject(0) {|sum, e| sum + e.salary}
