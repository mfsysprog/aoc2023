/* rexx  */
/* there is a bit of cheating here, since I just assumed that */
/* I could step right from the S                              */
/* For debug use -oversize 160x43 with x3270                  */
/* and set data to max under option 0                         */
/* The display of the pipes shows that they do not reach to   */
/* the edges of the map, so if I start a flood fill from the  */
/* top left en top right corner of the map I should be ok     */
/* I expand the map into 3*3 tiles so the flood fill will go  */
/* in between the pipes. The code is not fully correct, the   */
/* example doesn't work, but the official input does          */

address tso "alloc da(aoc.input10) dd(aoc10) shr"
address tso "execio * diskr aoc10 (open stem invoer. finis"
address tso "free dd(aoc10)"

numeric digits 31

/*
invoer.1 = "......................"
invoer.2 = ".FF7FSF7F7F7F7F7F---7."
invoer.3 = ".L|LJ||||||||||||F--J."
invoer.4 = ".FL-7LJLJ||||||LJL-77."
invoer.5 = ".F--JF--7||LJLJ7F7FJ-."
invoer.6 = ".L---JF-JLJ.||-FJLJJ7."
invoer.7 = ".|F|F-JF---7F7-L7L|7|."
invoer.8 = ".|FFJF7L7F-JF7|JL---7."
invoer.9 = ".7-L-JL7||F7|L7F-7F7|."
invoer.10= ".L.L7LFJ|||||FJL7||LJ."
invoer.11= ".L7JLJL-JLJLJL--JLJ.L."
invoer.12= "......................"
invoer.0 = 12 */

antwoord = 0
posx=0
posy=0
sposx=0
sposy=0
blocked=0
lengte=length(strip(invoer.1))
diepte=invoer.0
do i = 1 to invoer.0
   do k = 1 to lengte
      z = substr(invoer.i,k,1)
      invoer.i.k.mapped = '000000000'
      if z = '|' then
         invoer.i.k = 'V'
      else
      if z = '-' then
         invoer.i.k = 'H'
      else
      if z = '.' then invoer.i.k = 'P'
      else
      if z = 'S' then do
         sposx=k
         sposy=i
         invoer.i.k = z
         invoer.i.k.mapped = '111111111'
      end
      else
      invoer.i.k = z
   end
   invoer.i.0 = k - 1
end

sposx = sposx + 1
posx=sposx
posy=sposy
richting='E'
stappen=0
do while \blocked
   stappen = stappen + 1
   waarde = invoer.posy.posx
   interpret "waarde = do_"waarde"()"
end
say 'BLOCKED!'
exit

do_V: procedure expose posx posy richting invoer.
  invoer.posy.posx.mapped = '010010010'
  /* 010
     010
     010 */
  if richting='N' then do
    posy=posy-1
    blocked = off_map()
  end
  else
  if richting='S' then do
    posy=posy+1
    blocked = off_map()
  end
  else blocked = 1
return blocked

do_H: procedure expose posx posy richting invoer.
  invoer.posy.posx.mapped = '000111000'
  /* 000
     111
     000 */
  if richting='E' then do
    posx=posx+1
    blocked = off_map()
  end
  else
  if richting='W' then do
    posx=posx-1
    blocked = off_map()
  end
  else blocked = 1
return blocked

do_L: procedure expose posx posy richting invoer.
  invoer.posy.posx.mapped = '010011000'
  /* 010
     011
     000 */
  if richting='S' then do
    richting='E'
    posx=posx+1
    blocked = off_map()
  end
  else
  if richting='W' then do
    richting='N'
    posy=posy-1
    blocked = off_map()
  end
  else blocked = 1
return blocked

do_J: procedure expose posx posy richting invoer.
  invoer.posy.posx.mapped = '010110000'
  /* 010
     110
     000 */
  if richting='S' then do
    richting='W'
    posx=posx-1
    blocked = off_map()
  end
  else
  if richting='E' then do
    richting='N'
    posy=posy-1
    blocked = off_map()
  end
  else blocked = 1
return blocked

do_7: procedure expose posx posy richting invoer.
  invoer.posy.posx.mapped = '000110010'
  /* 000
     110
     010 */
  if richting='N' then do
    richting='W'
    posx=posx-1
    blocked = off_map()
  end
  else
  if richting='E' then do
    richting='S'
    posy=posy+1
    blocked = off_map()
  end
  else blocked = 1
invoer.i.k.mapped = 1
return blocked

do_F: procedure expose posx posy richting invoer.
  invoer.posy.posx.mapped = '000011010'
  /* 000
     011
     010 */
  if richting='N' then do
    richting='E'
    posx=posx+1
    blocked = off_map()
  end
  else
  if richting='W' then do
    richting='S'
    posy=posy+1
    blocked = off_map()
  end
  else blocked = 1
return blocked

do_P: procedure
  blocked = 1
return blocked

do_S: proCedure expose stappen invoer.
  antwoord = 0
  invoer.posy.posx.mapped = '111111111'
  /* 111
     111
     111 */
  say 'Aantal stappen:' stappen % 2
  iteller = 0
  mapped.0 = invoer.0 * 3
  do i = 1 to invoer.0
     iteller = iteller + 1
     kteller = 0
     do k = 1 to invoer.i.0
        kteller = kteller + 1
        mapped.iteller.kteller = substr(invoer.i.k.mapped,1,1)
        kteller = kteller + 1
        mapped.iteller.kteller = substr(invoer.i.k.mapped,2,1)
        kteller = kteller + 1
        mapped.iteller.kteller = substr(invoer.i.k.mapped,3,1)
     end
     mapped.iteller.0 = kteller
     iteller = iteller + 1
     kteller = 0
     do k = 1 to invoer.i.0
        kteller = kteller + 1
        mapped.iteller.kteller = substr(invoer.i.k.mapped,4,1)
        kteller = kteller + 1
        mapped.iteller.kteller = substr(invoer.i.k.mapped,5,1)
        kteller = kteller + 1
        mapped.iteller.kteller = substr(invoer.i.k.mapped,6,1)
     end
     mapped.iteller.0 = kteller
     iteller = iteller + 1
     kteller = 0
     do k = 1 to invoer.i.0
        kteller = kteller + 1
        mapped.iteller.kteller = substr(invoer.i.k.mapped,7,1)
        kteller = kteller + 1
        mapped.iteller.kteller = substr(invoer.i.k.mapped,8,1)
        kteller = kteller + 1
        mapped.iteller.kteller = substr(invoer.i.k.mapped,9,1)
     end
     mapped.iteller.0 = kteller
  end
  depth = 0
  x = floodfill(1,1,0,2)
  say "-----------SEPARATOR---------------"
  do i = 2 to mapped.0 by 3
     regel = ""
     do k = 2 to mapped.i.0 by 3
        regel = regel||mapped.i.k
        if mapped.i.k = 0 then antwoord = antwoord + 1
     end
     say regel
  end
say 'Het antwoord is 'antwoord
exit 0

floodfill: procedure expose mapped. depth
arg x,y,match,replace
    push x y
    do while queued() > 0
       pull x y
       do i = 1 to 9
       if mapped.x.y = match then do
          mapped.x.y = replace
          if y < mapped.x.0 then
             push x y+1
          if y > 0 then
             push x y-1
          if x < mapped.0 then
             push x+1 y
          if x > 0 then
             push x-1 y
       end
             /*
          if x < invoer.0 & y < invoer.x.0 then
             push x+1 y+1
          if x < invoer.0 & y > 0 then
             push x+1 y-1
          if x > 0 & y < invoer.x.0 then
             push x-1 y+1
          if x > 0 & y > 0 then
             push x-1 y-1  */
       end
    end
return 0

off_map: procedure
if posx = 0 | posx > lengte then return 1
if posy = 0 | posy > diepte then return 1
return 0
