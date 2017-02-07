def mergeSort array
  # Base case
  if array.length <= 1
    array
  else
    # Find the midpoint of the array
    mid = (array.length / 2).floor
    # Split up the arrays by recalling the mergeSort function
    # Keep splitting until there are only single values in arrays
    left = mergeSort(array[0..mid - 1])
    right = mergeSort(array[mid..array.length])
    # Call merge function to merge the two arrays that have been sorted by mergeSort
    merging(left, right)
  end
end

def merging(left, right)
  # Check if the left array is empty
  if left.empty?
  # If so return the right array that has been sorted by merge_sort
    right
  # Check if the right array is empty
  elsif right.empty?
  # If so return the left array that has been sorted by merge_sort
    left
  # Check if the first value of the left array is greater than the first value of the right array
  elsif left.first < right.first
  # If so push the left value and keep running merging function
  # to keep pushing the left values or right values into array
    [left.first] + merging(left[1..left.length], right)
  else
  # Else push the right value and keep running merging function
  # to keep pushing the right values or left values into array
    [right.first] + merging(left, right[1..right.length])
  end
end


#------------------------------------------------------
# ANOTHER WAY TO SOLVE THIS
#------------------------------------------------------


def merge_sort(arr)
  return arr if arr.length == 1
  merge(merge_sort(arr.slice(0, arr.length/2)),
        merge_sort(arr.slice(arr.length/2, arr[-1])))
end

def merge(arr1, arr2)
  sorted = []
  begin
    less_than = arr1[0] <=> arr2[0]
    less_than = (arr1[0] == nil ? 1 : -1) if less_than == nil
    case less_than
    when -1
      sorted << arr1[0]
      arr1 = arr1.drop(1)
    when 0
      sorted << arr1[0]
      sorted << arr2[0]
      arr1 = arr1.drop(1)
      arr2 = arr2.drop(1)
    when 1
      sorted << arr2[0]
      arr2 = arr2.drop(1)
    end
  end until (arr1.length == 0 && arr2.length == 0)
  sorted
end

merge_sort([1,6,3,8,22,3,11,24,54,68,79,80,98,65,46,76,53])

#Returns => [1, 3, 3, 6, 8, 11, 22, 24, 46, 53, 54, 65, 68, 76, 79, 80, 98]
