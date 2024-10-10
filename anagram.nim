import std/strutils, std/tables

proc countMap(s: string): Table[char, int] =
  result = initTable[char, int]()
  for c in s:
    if c in result:
      result[c] += 1
    else:
      result[c] = 1

proc detectAnagrams*(word: string, candidates: openArray[string]): seq[string] =
  let lows = word.toLower
  let llen = word.len
  let lmap = countMap(lows)
  for s in candidates:
    let slen = s.len
    if llen != slen: continue
    let slow = s.toLower
    if lows == slow: continue
    let smap = countMap(slow)
    var isFailed = false
    for (k,v) in lmap.pairs:
      if not smap.contains(k): 
        isFailed = true
        break    
      if smap[k] != v: 
        isFailed = true
        break
    #for
    if not isFailed:
      result.add(s)
  #for
