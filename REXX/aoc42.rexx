/* rexx */
address tso "alloc da(aoc.input4) dd(aoc4) shr"
address tso "execio * diskr aoc4 (open stem invoer. finis"
address tso "free dd(aoc4)"

antwoord = 0

kaarten.0 = invoer.0

do i = 1 to kaarten.0
   kaarten.i = 1
end

do i = 1 to invoer.0
 do b = 1 to kaarten.i
   if b = 1 then do
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
