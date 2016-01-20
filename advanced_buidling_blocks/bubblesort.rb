#
#
# def bubblesort(nums)
#   times_to_iterate = nums.length-1
#   times_to_iterate.times do |x|
#     num_of_unsorted_nums = times_to_iterate - x
#     num_of_unsorted_nums.times do |index|
#       #p nums #debugging
#       if nums[index] > nums[index+1]
#         nums[index],nums[index+1] = nums[index+1],nums[index] #swap positions in nums array if the preceding number is larger
#       end
#     end
#   end
#   nums
# end
#
# p bubblesort([4,3,78,2,0,2])

def bubble_sort_by(to_sort)
  times_to_iterate = to_sort.length-1
  times_to_iterate.times do |x|
    num_of_unsorted = times_to_iterate - x
    num_of_unsorted.times do |index|
      left,right = to_sort[index],to_sort[index+1]
      ans = yield left,right
      if ans > 0 #if this true then left is bigger than right so swap positions
        to_sort[index],to_sort[index+1] = right,left
      end
    end
  end
  to_sort
end

p (bubble_sort_by(["hi","hello","hey","dog","helloworld","tree"]) do |left,right|
  left.length - right.length
end)