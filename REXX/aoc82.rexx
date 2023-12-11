/* rexx  */
address tso "alloc da(aoc.input8hk) dd(aoc8) shr"
address tso "execio * diskr aoc8 (open stem invoer. finis"
address tso "free dd(aoc8)"

numeric digits 31
/*
invoer.1 = "LR"
invoer.2 = ""
invoer.3 = "11A = (11B, XXX)"
invoer.4 = "11B = (XXX, 11Z)"
invoer.5 = "11Z = (11B, XXX)"
invoer.6 = "22A = (22B, XXX)"
invoer.7 = "22B = (22C, 22C)"
invoer.8 = "22C = (22Z, 22Z)"
invoer.9 = "22Z = (22B, 22B)"
invoer.10= "XXX = (XXX, XXX)"
invoer.0 = 10 */

parse var invoer.1 instructions
instructions = strip(instructions)
ins_length = length(instructions)

allmap.0 = invoer.0 - 2
do i = 3 to invoer.0
   parse var invoer.i node '= (' tlnk ',' trcht ')'
   node = strip(node)
   k = i - 2
   allmap.k = node
   map.node.L = strip(tlnk)
   map.node.R = strip(trcht)
end

ateller = 0
amap.0 = 0
do i = 1 to allmap.0
   if substr(allmap.i,3,1) = 'A' then do
      ateller = ateller+1
      amap.ateller = allmap.i
   end
end
amap.0 = ateller

antwoord = 0
do i = 1 to amap.0
   teller = 0
   do forever
      next = teller // ins_length + 1
      teller = teller + 1
      richting = strip(substr(instructions, next, 1))
        node = amap.i
        amap.i = map.node.richting
        if substr(amap.i,3,1) = 'Z' then do
           amap.i.aantal = teller
           leave
        end
   end
end

do i = 1 to amap.0
   k = i + 1
   if i = amap.0 then leave
   if i = 1 then waarde = find_lcm(amap.i.aantal, amap.k.aantal)
   else waarde=find_lcm(waarde, amap.k.aantal)
end
say waarde

exit 0

/* find lcm */
find_lcm: procedure
arg one,two
return one*two / find_gcf(one,two)

/* find greatest common factor */
find_gcf: procedure
arg one,two
onefac.0 = 0
twofac.0 = 0
teller = 0
do i = 1 to one
   if i * i > one then leave
   if one // i = 0 then do
      teller = teller + 1
      onefac.teller = i
      if one/i <> i then do
        teller = teller + 1
        onefac.teller = one/i
      end
   end
end
onefac.0 = teller
teller = 0
do i = 1 to two
   if i * i > two then leave
   if two // i = 0 then do
      teller = teller + 1
      twofac.teller = i
      if two/i <> i then do
        teller = teller + 1
        twofac.teller = two/i
      end
   end
end
twofac.0 = teller

largest = 0
do i = 1 to onefac.0
   do k = 1 to twofac.0
      if onefac.i = twofac.k then do
         largest = onefac.i
      end
   end
end

gevonden:
return largest
