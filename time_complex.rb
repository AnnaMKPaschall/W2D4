#phase2 - O(1)?
def my_min(arr)
    smallest = arr[0]
    (0...arr.length).each do |i|
        if arr[i] < smallest #|| smallest == nil
            smallest = arr[i]
        end
    end
    smallest
end

#phase 1 - O(n^2)?
def my_min1(arr)
    min = arr[0]
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            if (arr[i] < arr[j]) && (arr[i] < min)
                min = arr[i]
            end
        end
    end
    min
end

def largest_subsum(arr) #n^2 + m
    subs = []

    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            subs << arr[i..j]
        end 
    end 
    max_sub = subs[0]
    subs.each do |sub|
        if sub.sum > max_sub.sum
            max_sub = sub 
        end 
    end 
    max_sub
end 

def fastest_subsum(arr) #n^2 + nlogn
    subs = []
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            subs << arr[i..j]
        end
    end
    sub_quicksort(subs)
end

def sub_quicksort(subs)
    return subs if subs.length < 2
    pivot = subs[0]
    left = subs[1..-1].select {|sub| sub.sum < pivot.sum}
    right = subs[1..-1].select {|sub| sub.sum >= pivot.sum}
    sums = sub_quicksort(left) + [pivot] + sub_quicksort(right)
    sums.last
end


