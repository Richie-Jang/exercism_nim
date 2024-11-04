import std/[strutils, tables]
type
  Plant* = enum
    Clover, Grass, Radishes, Violets

let students = @["Alice", "Bob", "Charlie", "David", "Eve", 
  "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

let stdMap = (
  var res = initTable[string, int]()
  for i, v in students:
    res[v] = i
  res
)

proc getPlant(c: char): Plant = 
  return 
    case c:
      of 'C': Clover
      of 'G': Grass
      of 'R': Radishes
      else:
        Violets


proc plants*(garden: string, student: string): seq[Plant] =
  let vv = split(garden, "\n")
  let idx = stdMap[student]
  var 
    stn = idx * 2
    edn = stn + 1
  let a1 = vv[0][stn .. edn]
  let a2 = vv[1][stn .. edn]
  result = @[
    getPlant(a1[0]),
    getPlant(a1[1]),
    getPlant(a2[0]),
    getPlant(a2[1]),
  ]