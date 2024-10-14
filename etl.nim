import std/[tables, strutils]

proc transform*(t: Table[int, seq[char]]): Table[char, int] =
  result = initTable[char, int]()

  for (k,v) in t.pairs:
    for i in v:
      result[i.toLowerAscii] = k