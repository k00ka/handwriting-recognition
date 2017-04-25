require_relative './vector'

CUTOFF = 2.5

def pool(back_vector, forward_vector)
  Vector.new(each_meets_cutoff(back_vector) + each_meets_cutoff(forward_vector))
end

def each_meets_cutoff(vec)
  vec.map { |e| (e < CUTOFF) ? -1 : 1 }
end
