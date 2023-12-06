/* rexx */
address tso "alloc da(aoc.input2) dd(aoc2) shr"
address tso "execio * diskr aoc2 (open stem invoer. finis"
address tso "free dd(aoc2)"

antwoord = 0

do i = 1 to invoer.0
   invalid = 0
   parse var invoer.i 'Game' nummer ':' trekking
   do while trekking <> ""
      parse var trekking getal kleur trekking
      parse var kleur kleur ','
      parse var kleur kleur ';'
      if kleur == 'red' & getal > 12 then invalid = 1
      if kleur == 'green' & getal > 13 then invalid = 1
      if kleur == 'blue' & getal > 14 then invalid = 1
   end
   if invalid = 0 then antwoord = antwoord + nummer
end
say antwoord
