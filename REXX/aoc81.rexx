/* rexx  */
address tso "alloc da(aoc.input8) dd(aoc8) shr"
address tso "execio * diskr aoc8 (open stem invoer. finis"
address tso "free dd(aoc8)"

/*
invoer.1 = "LLR"
invoer.2 = ""
invoer.3 = "AAA = (BBB, BBB)"
invoer.4 = "BBB = (AAA, ZZZ)"
invoer.5 = "ZZZ = (ZZZ, ZZZ)"
invoer.0 = 5 */

parse var invoer.1 instructions
instructions = strip(instructions)
ins_length = length(instructions)

do i = 3 to invoer.0
   parse var invoer.i node '= (' tlnk ',' trcht ')'
   node = strip(node)
   map.node.L = strip(tlnk)
   map.node.R = strip(trcht)
end

teller = 0
node = strip('AAA')
do forever
   next = teller // ins_length + 1
   teller = teller + 1
   richting = strip(substr(instructions, next, 1))
   node = map.node.richting
   if node = 'ZZZ' then leave
end

say teller
