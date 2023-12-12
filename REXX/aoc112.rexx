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
   if pos('#',invoer.i) = 0 then do
      teller = teller + 1
      vcorrected.teller = copies('X',length(strip(invoer.i)))
   end
   else do
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
      /* no # in this column */
      if vcorrected.kcol.k = 0 then do
         kteller = kteller + 1
         hcorrected.i.kteller = 'X'
      end
      else do
         kteller = kteller + 1
         hcorrected.i.kteller = vcorrected.i.k
      end
   end
   hcorrected.i.0 = kteller - 1
end

teller = 0
do i = 1 to hcorrected.0
   string = ""
   do k = 1 to hcorrected.i.0
      string = string||hcorrected.i.k
      if hcorrected.i.k = '#' then do
         teller = teller + 1
         galaxy.teller.y = i
         galaxy.teller.x = k
      end
   end
   /* say string */
end
galaxy.0 = teller

distance = 0
do i = 1 to galaxy.0
   do k = i to galaxy.0
      aantalx = 0
      aantaly = 0
      if (galaxy.i.x < galaxy.k.x) then
      do z = galaxy.i.x to galaxy.k.x
         if vcorrected.kcol.z=0 then aantalx = aantalx + 1
      end
      else
      do z = galaxy.k.x to galaxy.i.x
         if vcorrected.kcol.z=0 then aantalx = aantalx + 1
      end
      if (galaxy.i.y < galaxy.k.y) then
      do z = galaxy.i.y to galaxy.k.y
         if vcorrected.z.1='X' then aantaly = aantaly + 1
      end
      else
      do z = galaxy.k.y to galaxy.i.y
         if vcorrected.z.1='X' then aantaly = aantaly + 1
      end
      distance = distance + abs(galaxy.i.x - galaxy.k.x) - aantalx
      distance = distance + abs(galaxy.i.y - galaxy.k.y) - aantaly
      distance = distance + (aantalx * 1000000)
      distance = distance + (aantaly * 1000000)
   end
end
say distance
