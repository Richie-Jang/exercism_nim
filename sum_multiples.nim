import std/sets

proc getArr(limit, v: int): seq[int] = 
  if v == 0: return @[]
  var counter = 1
  while true:
    let vv = v * counter
    if vv >= limit:
      break
    result.add(vv)
    counter += 1
  return

proc sum*(limit: int, 
  factors: openArray[int]): int = 
  var allSet = initHashSet[int]()
  
  for i in factors:
    for j in getArr(limit, i):
      allSet.incl(j)

  var sum: int
   
  for i in allSet.items:
    sum += i
  return sum

echo sum(100, @[1])
