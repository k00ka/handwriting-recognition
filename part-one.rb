
THETA = [1, -1, -1 , 1]

example = gets.split(",").map(&:to_i)

h = THETA.zip(example).map { |te, ee| te * ee }.inject(0) { |sum, e| sum + e }

puts "The image #{example} evaluates to #{h}"
print "This looks like a " + ((h<0) ? "forward" : "backward")
puts "-slash."
