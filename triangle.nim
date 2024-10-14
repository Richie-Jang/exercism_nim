proc checkTrangle(sides: array[3, int]): bool = 
  let 
    a = sides[0]
    b = sides[1]
    c = sides[2]
  if a == 0 or b == 0 or c == 0: return false
  return a + b >= c and a + c >= b and b + c >= a

proc isEquilateral*(sides: array[3, int]): bool =
  if not checkTrangle(sides): 
    return false
  return sides[0] == sides[1] and sides[1] == sides[2]

proc isIsosceles*(sides: array[3, int]): bool =
  if not checkTrangle(sides): 
    return false
  return sides[0] == sides[1] or sides[1] == sides[2] or sides[0] == sides[2]

proc isScalene*(sides: array[3, int]): bool =
  if not checkTrangle(sides): return false
  return sides[0] != sides[1] and sides[1] != sides[2] and sides[0] != sides[2]
