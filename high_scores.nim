import std/[algorithm]

proc latest*(scores: openArray[int]): int =
  let r = @scores
  result = r[r.high]

proc personalBest*(scores: openArray[int]): int =
  let r = @scores
  result = r.max

proc personalTopThree*(scores: openArray[int]): seq[int] =
  var r = @scores
  sort(r, system.cmp, Descending)
  result = r[0 .. 2]

