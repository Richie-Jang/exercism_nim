import std/[math, sequtils, lists]

proc convert*(digits: openArray[int], fromBase: int, toBase: int): seq[int] =
  if fromBase <= 1 or toBase <= 1: 
    raise newException(ValueError, "base case wrong")
  result = newSeq[int]()
  let tpos = len(digits)
  var b10 = 0
  for i,v in digits:
    let pos = tpos-i-1
    if v < 0:
      raise newException(ValueError, "negative value")
    if v >= fromBase:
      raise newException(ValueError, "value too large")
    let p = int(pow(float64(fromBase), float64(pos)))
    b10 += v * p

  proc getToBase(base10: int, toBase: int, acc: var seq[int]): seq[int] = 
    if base10 < toBase: 
        acc = base10 & acc
        return acc
    else:
        let value = base10 div toBase
        let modval = base10 mod toBase
        acc = modval & acc
        return getToBase(value, toBase, acc)

  var acc = newSeq[int]()
  result = getToBase(b10, toBase, acc)

let c = convert([0,6,0], 7, 10)
echo c