/* rexx */
address tso "alloc da(aoc.input4) dd(aoc4) shr"
address tso "execio * diskr aoc4 (open stem invoer. finis"

antwoord = 0

kaarten.0 = invoer.0

do i = 1 to kaarten.0
   kaarten.i = 1
end

do i = 1 to invoer.0
 say invoer.i
 do b = 1 to kaarten.i
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
      if wordpos(mijn_getallen.k, winning) > 0 then do
         winnaars = winnaars + 1
      end
   end
   do l = 1 to winnaars
      nummer = i + l
      kaarten.nummer = kaarten.nummer + 1
   end
 end
end

do i = 1 to kaarten.0
   antwoord = antwoord + kaarten.i
end
say antwoord
