import std/strutils

proc diamond*(c: char): string =
  let 
    cc = toUpperAscii(c)
    ci = ord(cc) - ord('A') + 1
    xc = ci*2-1
    yc = ci*2-1

  var arr = newSeq[seq[char]](yc)

  for i in 0 ..< yc:
    arr[i] = newSeq[char](xc)
    for j in 0 ..< xc:
      arr[i][j] = ' '
    
    let iend = yc-i-1
    let ccc = chr(ord('A') + i)
    var
      xi1 = ci-1-i
      xi2 = ci-1+i     
    if i == 0 or iend == yc-1:
      arr[i][xi1] = 'A'
    elif i < ci-1:            
      arr[i][xi1] = ccc
      arr[i][xi2] = ccc
    elif i > ci-1:
      xi1 = i - ci + 1 
      xi2 = xc - xi1 - 1
      let ccc2 = chr(ord(cc) - xi1)
      arr[i][xi1] = ccc2
      arr[i][xi2] = ccc2
    else:
      arr[i][xi1] = cc
      arr[i][xi2] = cc

  for i in 0 ..< yc:
    result &= (cast[string](arr[i]) & "\n")

echo diamond('e')