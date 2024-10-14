proc binarySearch*(a: openArray[int], val: int): int = 
  proc loop(left: int, right: int, arr: seq[int]): int = 
    let mid = (left + right) div 2
    if arr[mid] == val: return mid
    if arr[mid] < val:
        return loop(mid+1, right, arr)
    else:
        return loop(left, mid-1, arr)

  loop(0, len(a)-1, @a)

let a = @[1,3,4,6,8,9,11]
echo binarySearch(a, 6)