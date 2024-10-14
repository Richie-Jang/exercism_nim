import std/[random,tables]

randomize()

proc privateKey*(p: int): int =
  result = rand(2..<p)

proc computeMod(p, g, a: int): int =
  var t = initTable[int, int]()
  proc loop(cur: int): int =
    if t.contains(cur):
      return t[cur]
    if cur == 1:
      t[1] = g
      return g
    let isEven = cur mod 2 == 0
    
    let a1 = loop(cur div 2)
    let a2 = a1 mod p
    if isEven:
      t[cur] = (a2 * a2) mod p
    else:
      t[cur] = (a2 * a2 * g) mod p
    return t[cur]
  
  result = loop(a)  
  t.clear()
#

proc publicKey*(p, g, a: int): int =
  #A = gᵃ mod p
  result = computeMod(p,g,a)
#

proc secret*(p, bPub, a: int): int =
  #Bᵃ mod p
  result = computeMod(p, bPub, a)
#

echo publicKey(23, 5, 6)