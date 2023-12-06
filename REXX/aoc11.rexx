/* rexx */
address tso "alloc da(aoc.input1) dd(aoc1) shr"
address tso "execio * diskr aoc1 (open stem invoer. finis"
address tso "free dd(aoc1)"

totaal = 0

do i = 1 to invoer.0
   mask = TRANSLATE(invoer.i,'@@@@@@@@@@','0123456789')
   first = pos('@',mask)
   last = lastpos('@',mask)
   waarde = substr(invoer.i,first,1)||substr(invoer.i,last,1)
   totaal = totaal + waarde
end
say 'The answer is: 'totaal
