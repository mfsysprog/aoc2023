/* rexx */
address tso "alloc da(aoc.input5) dd(aoc5) shr"
address tso "execio * diskr aoc5 (open stem invoer. finis"

numeric digits 14

antwoord = 0

invoer = ""

do i = 1 to invoer.0
   invoer = invoer || strip(invoer.i) || ' '
end

parse var invoer 'seeds:' seeds,
          'seed-to-soil map:' seeds_to_soil,
          'soil-to-fertilizer map:' soil_to_fertilizer,
          'fertilizer-to-water map:' fertilizer_to_water,
          'water-to-light map:' water_to_light,
          'light-to-temperature map:' light_to_temp,
          'temperature-to-humidity map:' temp_to_humidity,
          'humidity-to-location map:' humidity_to_loc

/* process seeds */
aantal = 0
seeds_string = ""
do while seeds <> ""
   parse var seeds seed number seeds
   aantal = aantal + 1
   seeds.aantal = seed
   top = seed + number - 1
   seeds_string = seeds_string||seed||','||top||'.'
end
sts_string = srctorange(seeds_to_soil)
stst_string = dsttorange(seeds_to_soil)
mapped = convert(seeds_string,sts_string,stst_string)
stf_string = srctorange(soil_to_fertilizer)
stft_string = dsttorange(soil_to_fertilizer)
mapped = convert(mapped,stf_string,stft_string)
ftw_string = srctorange(fertilizer_to_water)
ftwt_string = dsttorange(fertilizer_to_water)
mapped = convert(mapped,ftw_string,ftwt_string)
wtl_string = srctorange(water_to_light)
wtlt_string = dsttorange(water_to_light)
mapped = convert(mapped,wtl_string,wtlt_string)
ltt_string = srctorange(light_to_temp)
lttt_string = dsttorange(light_to_temp)
mapped = convert(mapped,ltt_string,lttt_string)
tth_string = srctorange(temp_to_humidity)
ttht_string = dsttorange(temp_to_humidity)
mapped = convert(mapped,tth_string,ttht_string)
htl_string = srctorange(humidity_to_loc)
htlt_string = dsttorange(humidity_to_loc)
mapped = convert(mapped,htl_string,htlt_string)

antwoord = 9999999999
do while mapped <> ""
   parse var mapped tip ',' top '.' mapped
   if tip < antwoord then antwoord = tip
end
say antwoord
exit 0

convert:
arg src,target,mapped
teller = 0
overflow_teller = 0
do while src <> ""
   parse var src ttip ',' ttop '.' src
   teller = teller + 1
   asrc.teller.tip = ttip
   asrc.teller.top = ttop
end
asrc.0 = teller
teller = 0
do while target <> ""
   parse var target ttip ',' ttop '.' target
   teller = teller + 1
   atarget.teller.tip = ttip
   atarget.teller.top = ttop
end
atarget.0 = teller
teller = 0
do while mapped <> ""
   parse var mapped ttip ',' ttop '.' mapped
   teller = teller + 1
   atarget.teller.amapped.tip = ttip
   atarget.teller.amapped.top = ttop
end
teller = 0
of_teller = 0
i = 1
do while i <= asrc.0
   do k = 1 to atarget.0
      if asrc.i.tip < atarget.k.tip &,
         asrc.i.top > atarget.k.top
         then do
            teller = teller + 1
            amapped.teller.tip = atarget.k.amapped.tip
            amapped.teller.top = atarget.k.amapped.top
            totaal = asrc.0 + 1
            asrc.0 = totaal
            asrc.totaal.tip = asrc.i.tip
            asrc.totaal.top = atarget.k.tip - 1
            totaal = asrc.0 + 1
            asrc.0 = totaal
            asrc.totaal.tip = atarget.k.top + 1
            asrc.totaal.top = asrc.i.top
            leave
         end
      else
      if asrc.i.tip < atarget.k.tip &,
         asrc.i.top >= atarget.k.tip &,
         asrc.i.top <= atarget.k.top
         then do
            teller = teller + 1
            ttop = atarget.k.amapped.top -,
                   (atarget.k.top - asrc.i.top)
            amapped.teller.tip = atarget.k.amapped.tip
            amapped.teller.top = ttop
            totaal = asrc.0 + 1
            asrc.0 = totaal
            asrc.totaal.tip = asrc.i.tip
            asrc.totaal.top = atarget.k.tip - 1
            leave
         end
      else
      if asrc.i.tip >= atarget.k.tip &,
         asrc.i.tip <= atarget.k.top &,
         asrc.i.top > atarget.k.top
         then do
            teller = teller + 1
            ttip = atarget.k.amapped.tip +,
                   (asrc.i.tip - atarget.k.tip)
            amapped.teller.tip = ttip
            amapped.teller.top = atarget.k.amapped.top
            totaal = asrc.0 + 1
            asrc.0 = totaal
            asrc.totaal.tip = atarget.k.top + 1
            asrc.totaal.top = asrc.i.top
            leave
         end
      else
      if asrc.i.tip >= atarget.k.tip &,
         asrc.i.top <= atarget.k.top
         then do
            ttip = atarget.k.amapped.tip +,
                   (asrc.i.tip - atarget.k.tip)
            ttop = atarget.k.amapped.top -,
                   (atarget.k.top - asrc.i.top)
            teller = teller + 1
            amapped.teller.tip = ttip
            amapped.teller.top = ttop
            leave
         end
      else if k = atarget.0 then
         do
            teller = teller + 1
            amapped.teller.tip = asrc.i.tip
            amapped.teller.top = asrc.i.top
         end
   end
   amapped.0 = teller
   /*
   say 'asrc.0' asrc.0
   say 'i' i */
   i = i + 1
end

mapped = ""
do i = 1 to amapped.0
   mapped = mapped||amapped.i.tip||','||amapped.i.top||'.'
end
return mapped

srctorange: procedure
arg invoer
uitvoer = ""
do while invoer <> ""
   parse var invoer dest src range invoer
   eind = src + range - 1
   uitvoer = uitvoer||src||','||eind||'.'
end
return uitvoer

dsttorange: procedure
arg invoer
uitvoer = ""
do while invoer <> ""
   parse var invoer dest src range invoer
   eind = dest + range - 1
   uitvoer = uitvoer||dest||','||eind||'.'
end
return uitvoer
