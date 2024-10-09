import std/[tables, strutils]

var map1 = initTable[char,char]()
var map2 = initTable[char, char]()

for i in 'a' .. 'z':
    let v = ord(i) - 97
    let vUp = i.toUpperAscii
    let k = chr(122-v)
    map1[i] = k
    map1[vUp] = map1[i]
    map2[k] = i

for i in '0' .. '9':
    map1[i] = i
    map2[i] = i

proc encode*(s: string): string =
    var res = newSeq[string]()
    var str = ""
    for c in s:
        if not map1.contains(c): continue
        let count = len(str)
        if count > 0 and (count mod 5) == 0: 
            res.add(str)
            str = ""
        str = str & map1[c]
    if str != "": res.add(str)
    return join(res, " ")

proc decode*(s: string): string = 
    result = ""
    for c in s:
        if not map2.contains(c): continue
        result = result & map2[c]

let v1 = encode("Testing,1 2 3, testing.")
echo v1
echo len(v1)