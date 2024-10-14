import std/[random, algorithm]

type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

randomize()

proc ability*: int =
  var stores = newSeq[int](4)
  for i in 0 ..< 4:
    stores[i] = rand(1 .. 6)
  sort(stores)
  result = 0
  for i in stores[1..3]:
    result += i

proc modifier*(n: int): int =
  let isNeg = (n - 10) < 0
  let a = (n - 10) div 2
  let b = (n - 10) mod 2
  if not isNeg and a >= 0:
    result = a
  else:
    if b == 0: 
      result = a
    else:
      result = a - 1

proc initCharacter*: Character =
  var powers = newSeq[int](6)
  for i in 0 ..< 6:
    powers[i] = ability()

  Character(
    strength: powers[0],
    dexterity: powers[1],
    constitution: powers[2],
    intelligence: powers[3],
    wisdom: powers[4],
    charisma: powers[5],
    hitpoints: 10 + modifier(powers[2]))