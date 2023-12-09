/* rexx  */
address tso "alloc da(aoc.input9) dd(aoc9) shr"
address tso "execio * diskr aoc9 (open stem invoer. finis"
address tso "free dd(aoc9)"

numeric digits 31

/*
invoer.1 = "0 3 6 9 12 15"
invoer.2 = "1 3 6 10 15 21"
invoer.3 = "10 13 16 21 30 45"
invoer.0 = 3 */

antwoord = 0
do i = 1 to invoer.0
   reeks.0 = 1
   k = 1
   reeks.k = invoer.i
   do forever
      vorige = reeks.k
      k = k + 1
      reeks.k = verschil(vorige)
      getal = bottom(reeks.k)
      if getal <> -1 then do
         do z = k - 1 to 1 by -1
            nieuw_getal = word(reeks.z,1) - getal
            reeks.z = nieuw_getal||' '||reeks.z
            getal = nieuw_getal
         end
         antwoord = antwoord + getal
         leave
      end
   end
end
say antwoord
exit

bottom: procedure
arg invoer
do while invoer <> ""
   parse var invoer eerste tweede invoer
   if tweede = "" then return eerste
   if eerste <> tweede then return -1
end
return eerste

expand: procedure
arg invoer,getal
laatste = word(invoer,words(invoer))
uitvoer = invoer||' '||laatste+getal
return uitvoer

verschil: procedure
arg invoer
k = 0
do while invoer <> ""
   k = k + 1
   parse var invoer getal.k invoer
end
getal.0 = k
uitvoer = ""
do i = 1 to getal.0 - 1
   k = i + 1
   uitvoer = uitvoer||getal.k - getal.i||' '
end
return uitvoer
