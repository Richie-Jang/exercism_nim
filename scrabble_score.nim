import std/[tables, sequtils]
from std/strutils import toLowerAscii

var map = initTable[char, int]()

proc initMap() =
    let a1 = @['a','e','i','o','u','l','n','r','s','t']
    let a2 = @['d','g']
    let a3 = @['b','c','m','p']
    let a4 = @['f','h','v','w','y']
    let a5 = @['k']
    let a8 = @['j','x']
    let a10 = @['q','z']
    let vals = @[1, 2,3,4,5,8,10]
    let allSeqs = zip(@[a1,a2,a3,a4,a5,a8,a10], vals)
    for (a,b) in allSeqs:
        for c in a:
            map[c] = b


proc score*(word: string): int =
    initMap()
    result = 0
    for c in word:
        result += map[c.toLowerAscii]
