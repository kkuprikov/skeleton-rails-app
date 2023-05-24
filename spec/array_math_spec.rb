# frozen_string_literal: true

require 'array_math'

INPUTS_TO_RESULTS = {
  [0] => 0,
  [1, 2] => 1.5,
  [1, '1'] => 0,
  [1, 2, 3, 4, 5, 6, 7, 8, 9] => 5,
  [nil] => 0,
  [1.5, {}] => 0,
  'test' => 0,
  [] => 0
}.freeze

RSpec.describe ArrayMath do
  let(:dummy) { Class.new { extend ArrayMath } }

  specify do
    INPUTS_TO_RESULTS.each do |input, result|
      expect(dummy.calculate_average(input)).to eq(result)
    end
  end
end
