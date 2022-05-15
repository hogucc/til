# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.length == 0

  common_prefix = ""
  strs.first.each_char do |c|
    strs[1..-1].each do |str|
      if(str.start_with?(common_prefix + c))
        next
      else
        return common_prefix
      end
    end
    common_prefix += c
  end
end
