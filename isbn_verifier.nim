import std/[strutils, options]

proc isValid*(s: string): bool =
  var s1 = replace(s, "-", "")
  if len(s1) != 10: return false

  let getIntValue = proc(c: char): Option[int] = 
    if c.isDigit:
      return some(ord(c) - ord('0'))
    else:
      none(int)
  var 
    counter = 10
    sum = 0
  for c in s1:
    var v = 0
    if counter == 1 and c == 'X': 
      v = 10
    else:
      let g = getIntValue(c)
      if g.isNone: return false
      v = g.get
    sum += v * counter
    dec(counter)
  result = sum mod 11 == 0