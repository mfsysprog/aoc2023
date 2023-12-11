/* rexx  */
/* there is a bit of cheating here, since I just assumed that */
/* I could step right from the S                              */
address tso "alloc da(aoc.input10) dd(aoc10) shr"
address tso "execio * diskr aoc10 (open stem invoer. finis"
address tso "free dd(aoc10)"

numeric digits 31

/*
invoer.1 = "..F7."
invoer.2 = ".FJ|."
invoer.3 = "SJ.L7"
invoer.4 = "|F--J"
invoer.5 = "LJ..."
invoer.0 = 5  */

antwoord = 0
posx=0
posy=0
sposx=0
sposy=0
blocked=0
lengte=length(strip(invoer.1))
diepte=invoer.0
map.0=invoer.0
do i = 1 to invoer.0
   do k = 1 to lengte
      z = substr(invoer.i,k,1)
      if z = '|' then invoer.i.k = 'V'
      else
      if z = '-' then invoer.i.k = 'H'
      else
      if z = '.' then invoer.i.k = 'P'
      else
      if z = 'S' then do
         sposx=k
         sposy=i
         invoer.i.k = z
      end
      else do
        invoer.i.k = z
        map.i.k = z
      end
   end
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

do_V: procedure expose posx posy richting
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

do_H: procedure expose posx posy richting
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

do_L: procedure expose posx posy richting
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

do_J: procedure expose posx posy richting
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

do_7: procedure expose posx posy richting
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
return blocked

do_F: procedure expose posx posy richting
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

do_S: proCedure expose stappen
  say stappen % 2
exit 0

off_map: procedure
if posx = 0 | posx > lengte then return 1
if posy = 0 | posy > diepte then return 1
return 0
