/* rexx */
address tso "alloc da(aoc.input3) dd(aoc3) shr"
address tso "execio * diskr aoc3 (open stem invoer. finis"

antwoord = 0

do i = 1 to invoer.0
   lengte = length(invoer.i)
   do k = 1 to lengte
      if datatype(substr(invoer.i,k,1)) = 'NUM' then do
         matrix.i.k = 'N'
         matrix.i.k.getal = substr(invoer.i,k,1)
      end
      else if substr(invoer.i,k,1) = '.' then matrix.i.k = 'P'
      else matrix.i.k = 'S'
   end
end

do i = 1 to invoer.0
   lengte = length(invoer.i)
   do k = 1 to lengte
      matrix.i.k.adjacent = 0
      ip = i - 1
      in = i + 1
      kp = k - 1
      kn = k + 1
      if i > 1 & k > 1 then
         if matrix.ip.kp = 'S' then matrix.i.k.adjacent = 1
      if i > 1 then
         if matrix.ip.k = 'S' then matrix.i.k.adjacent = 1
      if i > 1 & k < lengte then
         if matrix.ip.kn = 'S' then matrix.i.k.adjacent = 1
      if k > 1 then
         if matrix.i.kp = 'S' then matrix.i.k.adjacent = 1
      if k < lengte then
         if matrix.i.kn = 'S' then matrix.i.k.adjacent = 1
      if i < invoer.0 & k > 1 then
         if matrix.in.kp = 'S' then matrix.i.k.adjacent = 1
      if i < invoer.0 then
         if matrix.in.k = 'S' then matrix.i.k.adjacent = 1
      if i < invoer.0 & k < lengte then
         if matrix.in.kn = 'S' then matrix.i.k.adjacent = 1
   end
end

do i = 1 to invoer.0
   lengte = length(invoer.i)
   regel = ""
   regel2 = ""
   number = ""
   aansluitend = 0
   do k = 1 to lengte
      regel = regel || matrix.i.k
      regel2 = regel2 || matrix.i.k.adjacent
      if matrix.i.k = 'N' then do
         number = number || matrix.i.k.getal
         if matrix.i.k.adjacent = 1 then aansluitend = 1
      end
      if matrix.i.k <> 'N' | k = lengte then
         if number <> "" then do
            if aansluitend then do
               antwoord = antwoord + number
            end
            number = ""
            aansluitend = 0
         end
   end
end

say antwoord
