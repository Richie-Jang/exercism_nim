import std/sequtils, std/sugar, std/algorithm

type
  Student* = object
    name*: string
    grade*: int
  # Student* = tuple[name: string, grade: int] 
  School* = object
    students* : seq[Student]

proc roster*(school: School): seq[string] =
  var sts = school.students
  const cmpStudent = proc(a,b: Student): int = 
    if a.grade == b.grade:
      return cmp(a.name, b.name)
    return a.grade - b.grade
  sts.sort(cmpStudent)
  return sts.map(x => x.name)

proc addStudent*(school: var School, name: string, grade: int) =
  let i = Student(name:name, grade: grade)
  # check existed
  let existed = school.students.any(x => x.name == name)
  if existed:
    raise newException(ValueError, name & " is aleady existed")
  school.students.add(i)

proc grade*(school: School, grade: int): seq[string] =
  school.students.filter(x => x.grade == grade).map(x => x.name)

proc createStudent(name: string, grade: int): Student =
  return Student(name: name, grade: grade)
