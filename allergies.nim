import std/tables

type
  Allergen* = enum
    Eggs
    Peanuts
    Shellfish
    Strawberries
    Tomatoes
    Chocolate
    Pollen
    Cats

const
  allerMap: Table[Allergen, int] = block:
    var m = initTable[Allergen, int]()
    for i in low(Allergen) .. high(Allergen):
      m[i] = (1 shl i.ord)
    m

proc allergies*(score: int): set[Allergen]

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  var allset = allergies(score)
  return allset.contains(allergen)

proc allergies*(score: int): set[Allergen] =
  var g = score mod 256
  if g == 0: return
  var 
    g1 = uint8(g)
  for i in allerMap.keys:
    var v = uint8(allerMap[i])
    if (g1 and v) != uint8(0):
      result.incl(i)
  return

#run
echo cast[set[Allergen]](255)

import std/strutils, std/sequtils

type
  ProductGroup {.pure.} = enum
    Food = (3, "Food and drinks"),
    Kitchen = (9, "Kitchen appliance and cutlery"),
    Bedroom = (15, "Pillows, Beddings and stuff"),
    Bathroom = (17, "Shower gels and shampoo")
  
const
  p1 = [3,3,17,9,15].mapIt(ProductGroup(it))
  p2 = ["Kitchen appliance and cutlery", "Pillows, Beddings and stuff", "Shower gels and shampoo"]
    .mapIt(parseEnum[ProductGroup](it))

echo p1
echo p2