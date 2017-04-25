require_relative './vector'

# shape definitions 4 values for backslash and four for slash
X_SHAPE = [1, -1, -1, 1, -1, 1, 1, -1].freeze
O_SHAPE = [-1, 1, 1, -1, 1, -1, -1, 1].freeze
F_SHAPE = [-1, -1, -1, -1, -1, 1, 1, -1].freeze
B_SHAPE = [1, -1, -1, 1, -1, -1, -1, -1].freeze

def connect(shape_vector)
  [ shape_vector * X_SHAPE, shape_vector * O_SHAPE, shape_vector * F_SHAPE, shape_vector * B_SHAPE ]
end
