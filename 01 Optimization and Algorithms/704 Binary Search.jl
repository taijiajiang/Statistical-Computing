
#Julia

# Naive Solution
# This makes me think of the concept of bisection method for finding roots, so i'll go this way first.

begin

#1.Generate a vector "nums"
using Random
Random.seed!(123)

x = rand(1:2000, 100) #Generate 100 random number
y = rand([-1, 1], 100) #Generate corresponding sign.

nums= x .* y

[nums[1:6],nums[end-6:end]]
sort!(nums)

target=7 #Assuming target to be 7.

#2.Main function
function search(nums, target)
    if target<nums[1] || target>nums[end]
      return -1
    else

      #initialization
      IU = length(nums)
      IL = 1
            while true
                  #On boundary, return answer. Note that Julia start at 1.
                  if target==nums[IU]
                        return IU-1
                  elseif target==nums[IL]
                        return IL-1

                  #update boundary
                  elseif nums[IL]<= target <= nums[floor(Int,(IU+IL)/2)]
                        IU = floor(Int, (IU + IL) / 2)
                  else
                        IL = ceil(Int,((IU+IL)/2))

                  end
                  if target>nums[IU] || target<nums[IL]
                        return -1

                  #Consider situation when target falls between upper and lower, but there's no intermediate index.

                  elseif (IU-IL)==1
                        return -1
                  end
      end
end
end

#3.Evaluate
search(nums,target)
end
