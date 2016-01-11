def test(array, element, sorted=false)
  if sorted
    return false if array.first > element || array.last < element

    left_anchor = 0
    right_anchor = array.size - 1

    loop do
      new_anchor = (left_anchor + right_anchor) / 2
      if element > array[new_anchor]
        left_anchor = new_anchor
      elsif element < array[new_anchor]
        right_anchor = new_anchor
      else
        return true
      end

      return false if right_anchor - left_anchor < 2
    end
  else
    array.each { |e| return true if e == element }
    false
  end
end

# Сложность - O(N)
# В случае заведомо отсортированного массива сложность O(log2(N))
# N = array.size
