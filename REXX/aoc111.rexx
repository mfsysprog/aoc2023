/* rexx  */
address tso "alloc da(aoc.input11) dd(aoc11) shr"
address tso "execio * diskr aoc11 (open stem invoer. finis"
address tso "free dd(aoc11)"
numeric digits 31

/*
invoer.1 = "...#......  "
invoer.2 = ".......#..  "
invoer.3 = "#.........  "
invoer.4 = "..........  "
invoer.5 = "......#...  "
invoer.6 = ".#........  "
invoer.7 = ".........#  "
invoer.8 = "..........  "
invoer.9 = ".......#..  "
invoer.10= "#...#.....  "
invoer.0 = 10 */

teller = 0
vcorrected.0 = 0
/* duplicate lines without # */
do i = 1 to invoer.0
   teller = teller + 1
   vcorrected.teller = invoer.i
   if pos('#',invoer.i) = 0 then do
      teller = teller + 1
      vcorrected.teller = invoer.i
   end
end
vcorrected.0 = teller

/* check if col has # */
do i = 1 to vcorrected.0
   do k = 1 to length(strip(vcorrected.i))
      if i = 1 then vcorrected.kcol.k = 0
      if substr(vcorrected.i,k,1) = '#' then vcorrected.kcol.k = 1
      vcorrected.i.k = substr(vcorrected.i,k,1)
   end
   vcorrected.i.0 = k
end

hcorrected.0 = vcorrected.0
do i = 1 to vcorrected.0
   kteller = 0
   do k = 1 to vcorrected.i.0
      kteller = kteller + 1
      hcorrected.i.kteller = vcorrected.i.k
      /* no # in this column */
      if vcorrected.kcol.k = 0 then do
         kteller = kteller + 1
         hcorrected.i.kteller = '.'
      end
   end
   hcorrected.i.0 = kteller - 1
end

teller = 0
do i = 1 to hcorrected.0
   do k = 1 to hcorrected.i.0
      if hcorrected.i.k = '#' then do
         teller = teller + 1
         galaxy.teller.y = i
         galaxy.teller.x = k
      end
   end
end
galaxy.0 = teller

distance = 0
do i = 1 to galaxy.0
   do k = i to galaxy.0
      distance = distance + abs(galaxy.i.x - galaxy.k.x)
      distance = distance + abs(galaxy.i.y - galaxy.k.y)
   end
end
say distance
