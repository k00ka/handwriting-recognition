require_relative './conv'
require_relative './pool'
require_relative './connect'

puts "What is the 3x3 rasterized image? (1 = on, -1 = off)"
example = gets.split(",").map(&:to_i)
unless example.count == 9
  puts "I need 9 command-separatd numbers"
  exit 1
end
puts "Your shape looks like:"
puts example.each_slice(3).map { |row| row.map { |e| (e==1) ? "* " : "  " }.join }.join("\n")

back_vector, forward_vector = convolute(example)
puts "After convolution:"
puts "The back vector is: #{back_vector}"
puts "The forward vector is: #{forward_vector}"

shape_vector = pool(back_vector, forward_vector)
puts "After pooling:"
puts "The shape vector is: #{shape_vector.each_slice(4).map(&:to_a)}"

x_score, o_score, forward_score, back_score = connect(shape_vector)
results = { X: x_score, O: o_score, :/ => forward_score, :'\\' => back_score }
puts "After fully connecting:"
results.each { |k,v| puts "#{k}: #{v}" }

shape_guess, shape_score = results.max_by { |k,v| v }
if shape_score > 4
  puts "Your shape looks like a #{shape_guess}"
else
  puts "Your shape looks like.... nothing I can recognize"
end

