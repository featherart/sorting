require 'pry'

# divide lists recursively until lists have size of 1
# call merge on lists repeatedly
# this algorithm has average run-time of 0(n logn)
class MergeSort
  attr_accessor :elements, :midpoint

  def initialize()
  	#@elements = elements
  	@midpoint = 0
  end

  def merge_sort(list)
  	# base case
  	return list if list.size <= 1
  	# handle the case of an odd sized array
  	mid = list.size/2
  	left = list[0,mid]
  	right = list[mid, list.size-mid]

  	merge(merge_sort(left), merge_sort(right))
  end

  def merge(left, right)
  	sorted = []
  	until left.empty? or right.empty?
  	  if left.first <= right.first
  	  	sorted << left.shift
  	  else 
  	  	sorted << right.shift
  	  end
  	end
  	sorted = left + right
  	p sorted
  end

  def left_div(elements)
  	@midpoint += 1
  	if elements.length.even? && elements.length > 0
  	  p elements
  	  #p @midpoint
  	  p elements.length
  	  left = []
  	  if left != nil
  	    left = left_div(elements.slice(0...(elements.length/2))) 
  	  end
  	  left
  	elsif elements.length > 0
  	  p elements
  	  #p @midpoint
  	  p elements.length
  	  left = []
  	  if left != nil
  	  	left = left_div(elements.slice(0...(elements.length/2))) 
  	  end
  	  left
    end
  end

  def right_div(elements)
  	if elements.length.even?
  	  elements.slice((elements.length/2)...elements.length)
  	else 
  	  elements.slice((elements.length/2)..elements.length)
    end
  end

  # def merge_sort(elements)
  #   right = right_div(elements)
  #   #p right
  #   left = left_div(elements)
  #   p left
  # end

end

ms = MergeSort.new
arr_even = [1,2,3,6,8,9]
arr_odd = [4,6,1,0,9,8,7]

ms.merge_sort(arr_odd)
ms.merge_sort(arr_even)

binding.pry