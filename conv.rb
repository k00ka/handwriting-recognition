require_relative './vector'

BACK_SHAPE = [1, -1, -1, 1].freeze
FORWARD_SHAPE = [-1, 1, 1, -1].freeze

def convolute(example)
  b_score_vector = score_c(example, BACK_SHAPE)
  f_score_vector = score_c(example, FORWARD_SHAPE)
  [ b_score_vector, f_score_vector ]
end

CONV_LOCATIONS = [[0, 1, 3, 4], [1, 2, 4, 5], [3, 4, 6, 7], [4, 5, 7, 8]].freeze

def score_c(example, filter)
  CONV_LOCATIONS.map { |cl| Vector.new(example.values_at(*cl)) * filter }
end
