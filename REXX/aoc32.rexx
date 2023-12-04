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
      else if substr(invoer.i,k,1) = '*' then matrix.i.k = 'A'
      else matrix.i.k = 'S'
   end
end

do i = 1 to invoer.0
   do k = 1 to length(invoer.i)
      matrix.i.k.adjacent = 0
   end
end

pair = 0
do i = 1 to invoer.0
   lengte = length(invoer.i)
   gevonden = 0
   do k = 1 to lengte
      do l = 1 to 2
         if matrix.i.k <> 'A' then leave
         ip = i - 1
         in = i + 1
         kp = k - 1
         kn = k + 1
         ipkp_gevonden = 0
         ipk_gevonden = 0
         ipkn_gevonden = 0
         ikp_gevonden = 0
         ikn_gevonden = 0
         inkp_gevonden = 0
         ink_gevonden = 0
         inkn_gevonden = 0
         ronde_gevonden = 0
         if i > 1 & k > 1 then
            if matrix.ip.kp = 'N' then
               if l = 1 then ipkp_gevonden = 1
               else if gevonden = 1 then
               matrix.ip.kp.adjacent = pair
         if i > 1 then
            if matrix.ip.k = 'N' then
               if l = 1 then ipk_gevonden = 1
               else if gevonden = 1 then
               matrix.ip.k.adjacent = pair
         if i > 1 & k < lengte then
            if matrix.ip.kn = 'N' then
               if l = 1 then ipkn_gevonden = 1
               else if gevonden = 1 then
               matrix.ip.kn.adjacent = pair
         if k > 1 then
            if matrix.i.kp = 'N' then
               if l = 1 then ikp_gevonden = 1
               else if gevonden = 1 then
               matrix.i.kp.adjacent = pair
         if k < lengte then
            if matrix.i.kn = 'N' then
               if l = 1 then ikn_gevonden = 1
               else if gevonden = 1 then
               matrix.i.kn.adjacent = pair
         if i < invoer.0 & k > 1 then
            if matrix.in.kp = 'N' then
               if l = 1 then inkp_gevonden = 1
               else if gevonden = 1 then
               matrix.in.kp.adjacent = pair
         if i < invoer.0 then
            if matrix.in.k = 'N' then
               if l = 1 then ink_gevonden = 1
               else if gevonden = 1 then
               matrix.in.k.adjacent = pair
         if i < invoer.0 & k < lengte then
            if matrix.in.kn = 'N' then
               if l = 1 then inkn_gevonden = 1
               else if gevonden = 1 then
               matrix.in.kn.adjacent = pair
         ronde_gevonden = ipkp_gevonden +,
                          ipk_gevonden +,
                          ipkn_gevonden +,
                          ikn_gevonden +,
                          ikp_gevonden +,
                          inkp_gevonden +,
                          ink_gevonden +,
                          inkn_gevonden
         if ipkp_gevonden + ipk_gevonden = 2
            then ronde_gevonden = ronde_gevonden - 1
         if ipkn_gevonden + ipk_gevonden = 2
            then ronde_gevonden = ronde_gevonden - 1
         if inkp_gevonden + ink_gevonden = 2
            then ronde_gevonden = ronde_gevonden - 1
         if inkn_gevonden + ink_gevonden = 2
            then ronde_gevonden = ronde_gevonden - 1
         if gevonden = 1 then do
            matrix.i.k.adjacent = pair
            gevonden = 0
         end
         else
         if ronde_gevonden = 2 then do
            gevonden = 1
            pair = pair + 1
         end
      end
   end
end

do i = 1 to pair
   paar.i.0 = 0
   paar.i.eerste = 0
   paar.i.tweede = 0
end

do i = 1 to invoer.0
   lengte = length(invoer.i)
   aansluitend = 0
   do k = 1 to lengte
      if matrix.i.k = 'N' then do
         number = number || matrix.i.k.getal
         if matrix.i.k.adjacent > 0 then do
            aansluitend = matrix.i.k.adjacent
         end
      end
      if matrix.i.k <> 'N' | k = lengte then do
         if number <> "" then do
            if aansluitend > 0 then do
               paarnbr = aansluitend
               if paar.paarnbr.0 = 0 then do
                  paar.paarnbr.0 = 1
                  paar.paarnbr.eerste = number
               end
               else do
                  paar.paarnbr.0 = 2
                  paar.paarnbr.tweede = number
               end
            end
            number = ""
            aansluitend = 0
         end
      end
   end
end

do i = 1 to pair
   waarde = paar.i.eerste * paar.i.tweede
   antwoord = antwoord + waarde
end

say antwoord
