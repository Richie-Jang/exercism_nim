import std/[strutils, math]

type 
  CharSet = set[char]

var 
  cSet: CharSet = {'a'..'z', 'A'..'Z', '0'..'9'}

proc getXY(x: int, y: int, target: int, side: int): (int,int) = 
  let v = x * y
  if v == target:
    result = (x,y)
  elif v < target:    
    if side == 0:
      result = getXY(x+1, y, target, 1)
    else: 
      result = getXY(x, y+1, target, 0)
  else:
    if x > y: 
      result = (x,y)
    else:
      result = (y,x)

proc encrypt*(s: string): string =
  var plainStr = ""
  for c in s: 
    if not cSet.contains(c):
      continue
    else:
      plainStr &= c.toLowerAscii()
  
  let l = len(plainStr)
  var p = int(sqrt(float64(l)))
  var (x,y) = getXY(p,p,l,0)  
  var r1 = newSeq[seq[char]](y)

  for i in 0 ..< y:
    r1[i] = newSeq[char](x)  

  for i,c in plainStr:
    let m1 = i div x
    let m2 = i mod x
    r1[m1][m2] = c

  echo r1

  result = ""
  for xi in 0 ..< x:
    for yi in 0 ..< y:
      if r1[yi][xi] == '\x00':     
        result &= " "
      else:
        result &= r1[yi][xi]
    if xi != x-1:
      result &= " "

echo "|", encrypt("Chill out."), "|"