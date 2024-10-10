import std/math

proc isArmstrongNumber*(n: int): bool =
  let size = int(log10(float64 n)) + 1
  var
    sum = 0.0
    cur = n
  for i in countdown(size-1, 0):
    let v = int(pow(10.0, float64(i)))
    let m = cur div v
    cur = n mod v
    let addInt = pow(float64(m), float64(size))
    #echo "cur ",cur," ", addInt
    sum += addInt

  return int(sum) == n

echo isArmstrongNumber(154)
