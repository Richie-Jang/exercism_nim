

proc isPaired*(s: string): bool = 
    var stack = newSeq[char]()

    func getLast(): char =
        let l = len(stack)
        stack[l-1]

    proc removedLast() =
        stack.del(len(stack)-1)

    for c in s:
        if c == '[' or c == '(' or c == '{':
            stack.add(c)
        elif c == ']' or c == ')' or c == '}':
            if len(stack) == 0: 
                return false
            let v = getLast()
            case c:
                of ']': 
                    if v != '[': return false else: removedLast()
                of ')': 
                    if v != '(': return false else: removedLast()
                of '}': 
                    if v != '{': return false else: removedLast()
                else:
                    discard
    if len(stack) > 0:
        return false            
    return true