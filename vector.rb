# It's a mathematical term, represented by an arrow with both direction and magnitude. Vector! Oh yeah! 

class Vector < Array
  def *(v)
    self.zip(v).map { |a,b| a * b }.inject(0) { |s,r| s + r }
  end
end
