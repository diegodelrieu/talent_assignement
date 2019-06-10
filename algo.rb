require 'set'

def all_sums (arr, sum)
    solutions = Set.new
    remainers = []
    arr.each do |num|
        remainer = sum - num 
        if remainers.include?(num)
            solutions << [num, remainer]
        end
        remainers << remainer 
    end
    return solutions
end

# Here the time complexity is O(n^2)
# The space complexity is O(n)

def optimized_sums (arr, sum)
    solutions = []
    arr.each do |num|
        if num > sum - num
            break
        elsif arr.include?(sum - num) 
            solutions << [ num, sum - num ]
        end
    end
    p solutions
end
