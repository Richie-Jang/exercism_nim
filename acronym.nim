import std/strutils

proc abbreviate*(s: string): string =
    let ss = s.split({' ', '-'})
    for i in ss:
        if i == "": continue
        result.add(i[0].toUpperAscii)