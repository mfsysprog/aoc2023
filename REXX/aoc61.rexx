/* rexx */
address tso "alloc da(aoc.input6) dd(aoc6) shr"
address tso "execio * diskr aoc6 (open stem invoer. finis"
address tso "free dd(aoc6)"

antwoord = 0
races.0 = 0

do i = 1 to invoer.0
   if pos('Time:',invoer.i) > 0 then
      parse var invoer.i 'Time:' tijden
   if pos('Distance:',invoer.i) > 0 then
      parse var invoer.i 'Distance:' afstanden
   teller = 0
   do while tijden <> ""
      parse var tijden ttijd tijden
      teller = teller + 1
      races.teller.tijd = ttijd
   end
   races.0 = teller
   teller = 0
   do while afstanden <> ""
      parse var afstanden tafstand afstanden
      teller = teller + 1
      races.teller.afstand = tafstand
   end
   races.0 = teller
end
do i = 1 to races.0
   aantal = speed(races.i.tijd, races.i.afstand)
   if antwoord = 0 then antwoord = aantal
   else antwoord = antwoord * aantal
end
say antwoord
exit 0

speed: procedure
arg tijd,record
aantal = 0
do button = 1 to tijd
   afstand = button * ( tijd - button)
   if afstand > record then aantal = aantal + 1
end
return aantal
