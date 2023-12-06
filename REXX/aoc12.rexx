/* rexx */
address tso "alloc da(aoc.input1) dd(aoc1) shr"
address tso "execio * diskr aoc1 (open stem invoer. finis"
address tso "free dd(aoc1)"

totaal = 0
uitvoer.0 = invoer.0

do i = 1 to invoer.0
   uitvoer.i = invoer.i
   correctie = 0
   do k = 1 to length(invoer.i)
      x = compare('one',substr(invoer.i,k,3))
      if x = 0 then do
         uitvoer.i = insert('1',uitvoer.i,k+correctie)
         correctie = correctie + 1
      end
      x = compare('two',substr(invoer.i,k,3))
      if x = 0 then do
         uitvoer.i = insert('2',uitvoer.i,k+correctie)
         correctie = correctie + 1
      end
      x = compare('three',substr(invoer.i,k,5))
      if x = 0 then do
         uitvoer.i = insert('3',uitvoer.i,k+correctie)
         correctie = correctie + 1
      end
      x = compare('four',substr(invoer.i,k,4))
      if x = 0 then do
         uitvoer.i = insert('4',uitvoer.i,k+correctie)
         correctie = correctie + 1
      end
      x = compare('five',substr(invoer.i,k,4))
      if x = 0 then do
         uitvoer.i = insert('5',uitvoer.i,k+correctie)
         correctie = correctie + 1
      end
      x = compare('six',substr(invoer.i,k,3))
      if x = 0 then do
         uitvoer.i = insert('6',uitvoer.i,k+correctie)
         correctie = correctie + 1
      end
      x = compare('seven',substr(invoer.i,k,5))
      if x = 0 then do
         uitvoer.i = insert('7',uitvoer.i,k+correctie)
         correctie = correctie + 1
      end
      x = compare('eight',substr(invoer.i,k,5))
      if x = 0 then do
         uitvoer.i = insert('8',uitvoer.i,k+correctie)
         correctie = correctie + 1
      end
      x = compare('nine',substr(invoer.i,k,4))
      if x = 0 then do
         uitvoer.i = insert('9',uitvoer.i,k+correctie)
         correctie = correctie + 1
      end
   end
   mask = TRANSLATE(uitvoer.i,'@@@@@@@@@@','0123456789')
   first = pos('@',mask)
   last = lastpos('@',mask)
   waarde = substr(uitvoer.i,first,1)||substr(uitvoer.i,last,1)
   totaal = totaal + waarde
end
say 'The answer is: 'totaal
