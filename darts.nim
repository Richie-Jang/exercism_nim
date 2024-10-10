import std/math

proc dist2(x,y: float): float = 
  return x*x + y*y

proc score*(x, y: float): int =
  let d = dist2(x,y)
  if d <= 1.0:
    return 10
  elif d <= 25.0:
    return 5
  elif d <= 100.0:
    return 1
  else:
    return 0