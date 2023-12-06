/* rexx */
/* dit zou nog sneller kunnen met een binary search, maar zo is   */
/* het ook acceptabel                                             */
address tso "alloc da(aoc.input6) dd(aoc6) shr"
address tso "execio * diskr aoc6 (open stem invoer. finis"
address tso "free dd(aoc6)"

numeric digits 14

antwoord = 0
races.0 = 0

do i = 1 to invoer.0
   if pos('Time:',invoer.i) > 0 then
      parse var invoer.i 'Time:' tijden
   if pos('Distance:',invoer.i) > 0 then
      parse var invoer.i 'Distance:' afstanden
   teller = 0
end
tijd = ""
do while tijden <> ""
   parse var tijden ttijd tijden
   tijd = tijd||ttijd
end
afstand = ""
do while afstanden <> ""
   parse var afstanden tafstand afstanden
   afstand = afstand||tafstand
end
antwoord = speed(tijd, afstand)
say antwoord
exit 0

speed: procedure
arg tijd,record
aantal = 0
tip = 0
top = 0
do button = 1 to tijd
   afstand = button * ( tijd - button )
   if afstand > record then do
      tip = button
      leave
   end
end
do button = tijd to 1 by - 1
   afstand = button * ( tijd - button )
   if afstand > record then do
      top = button
      leave
   end
end
aantal = top - tip + 1
return aantal
