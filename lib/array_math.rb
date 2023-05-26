# frozen_string_literal: true

# Test 3
module ArrayMath
  def calculate_average(a)
    valid_array?(a) ? Float(a.sum) / a.length : 0
  end

  private

  def valid_array?(a)
    a.is_a?(Array) && a.length.positive? && a.all?(Numeric)
  end
end
