/* rexx */
address tso "alloc da(aoc.input4) dd(aoc4) shr"
address tso "execio * diskr aoc4 (open stem invoer. finis"

antwoord = 0

do i = 1 to invoer.0
   invalid = 0
   parse var invoer.i 'Card' nummer ':' winning '|' trekking
   mijn_getallen.0 = 0
   balnr = 0
   do while trekking <> ""
      parse var trekking getal trekking
      balnr = balnr + 1
      mijn_getallen.balnr = getal
      mijn_getallen.0 = balnr
   end
   winnaars = 0
   do k = 1 to mijn_getallen.0
      if wordpos(mijn_getallen.k, winning) > 0 then
         winnaars = winnaars + 1
   end
   winnaars = winnaars - 1
   if winnaars = -1 then
   waarde = 0
   else
   waarde = 2 ** winnaars
   antwoord = antwoord + waarde
end
say antwoord
