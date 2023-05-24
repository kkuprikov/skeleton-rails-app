# frozen_string_literal: true

# Test 3
module ArrayMath
  def calculate_average(a)
    if valid_array?(a)
      a.sum / Float(a.length)
    else
      0
    end
  end

  private

  def valid_array?(a)
    a.is_a?(Array) && a.length.positive? && a.all? { |el| el.is_a?(Integer) || el.is_a?(Float) }
  end
end
