import std/[math, sequtils]
proc onSquare*(n: int): uint64 =
  if n <= 0:
    raise newException(ValueError, "positive number required")
  if n > 64:
    raise newException(ValueError, "square must be between 1 and 64")
  let value = pow(2, float64(n-1))
  return uint64(value)

proc total*: uint64 =
  toSeq(1..64).map(onSquare).sum
