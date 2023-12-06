/* rexx */
address tso "alloc da(aoc.input2) dd(aoc2) shr"
address tso "execio * diskr aoc2 (open stem invoer. finis"
address tso "free dd(aoc2)"

antwoord = 0

do i = 1 to invoer.0
   rednum = 0
   bluenum = 0
   greennum = 0
   parse var invoer.i 'Game' nummer ':' trekking
   do while trekking <> ""
      parse var trekking getal kleur trekking
      parse var kleur kleur ','
      parse var kleur kleur ';'
      if kleur == 'red' then
         if getal > rednum then rednum = getal
      if kleur == 'green' then
         if getal > greennum then greennum = getal
      if kleur == 'blue' then
         if getal > bluenum then bluenum = getal
   end
   power = rednum * greennum * bluenum
   antwoord = antwoord + power
end
say antwoord
