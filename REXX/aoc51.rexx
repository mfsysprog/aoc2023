/* rexx */
address tso "alloc da(aoc.input5) dd(aoc5) shr"
address tso "execio * diskr aoc5 (open stem invoer. finis"
address tso "free dd(aoc5)"

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
do while seeds <> ""
   parse var seeds seed seeds
   aantal = aantal + 1
   seeds.aantal = seed
end
seeds.0 = aantal

/* process seeds_to_soil */
aantal = 0
do while seeds_to_soil <> ""
   parse var seeds_to_soil tdest tsrc trange seeds_to_soil
   aantal = aantal + 1
   seeds_to_soil.aantal.dest = tdest
   seeds_to_soil.aantal.src = tsrc
   seeds_to_soil.aantal.range = trange
end
seeds_to_soil.0 = aantal

/* process soil_to_fertilizer */
aantal = 0
do while soil_to_fertilizer <> ""
   parse var soil_to_fertilizer tdest tsrc trange soil_to_fertilizer
   aantal = aantal + 1
   soil_to_fertilizer.aantal.dest = tdest
   soil_to_fertilizer.aantal.src = tsrc
   soil_to_fertilizer.aantal.range = trange
end
soil_to_fertilizer.0 = aantal

/* process fertilizer_to_water */
aantal = 0
do while fertilizer_to_water <> ""
   parse var fertilizer_to_water tdest tsrc trange fertilizer_to_water
   aantal = aantal + 1
   fertilizer_to_water.aantal.dest = tdest
   fertilizer_to_water.aantal.src = tsrc
   fertilizer_to_water.aantal.range = trange
end
fertilizer_to_water.0 = aantal

/* process water_to_light */
aantal = 0
do while water_to_light <> ""
   parse var water_to_light tdest tsrc trange water_to_light
   aantal = aantal + 1
   water_to_light.aantal.dest = tdest
   water_to_light.aantal.src = tsrc
   water_to_light.aantal.range = trange
end
water_to_light.0 = aantal

/* process light_to_temperature */
aantal = 0
do while light_to_temp <> ""
   parse var light_to_temp tdest tsrc trange light_to_temp
   aantal = aantal + 1
   light_to_temp.aantal.dest = tdest
   light_to_temp.aantal.src = tsrc
   light_to_temp.aantal.range = trange
end
light_to_temp.0 = aantal

/* process temperature_to_humidity */
aantal = 0
do while temp_to_humidity <> ""
   parse var temp_to_humidity tdest tsrc trange temp_to_humidity
   aantal = aantal + 1
   temp_to_humidity.aantal.dest = tdest
   temp_to_humidity.aantal.src = tsrc
   temp_to_humidity.aantal.range = trange
end
temp_to_humidity.0 = aantal

/* process humidity_to_location */
aantal = 0
do while humidity_to_loc <> ""
   parse var humidity_to_loc tdest tsrc trange humidity_to_loc
   aantal = aantal + 1
   humidity_to_loc.aantal.dest = tdest
   humidity_to_loc.aantal.src = tsrc
   humidity_to_loc.aantal.range = trange
end
humidity_to_loc.0 = aantal

/* the big mapping game */
do i = 1 to seeds.0
   seeds_to_soil_found = 0
   do s = 1 to seeds_to_soil.0
      seeds_to_soil_to = ,
      seeds_to_soil.s.src + seeds_to_soil.s.range - 1
      if seeds.i >= seeds_to_soil.s.src &,
         seeds.i <= seeds_to_soil_to
      then do
           tsts_dest = seeds.i - seeds_to_soil.s.src +,
                       seeds_to_soil.s.dest
           seeds.i.sts = tsts_dest
           seeds_to_soil_found = 1
      end
   end
   /* \ is a logical not - sigh... */
   if \seeds_to_soil_found then seeds.i.sts = seeds.i
end

/* the big mapping game */
do i = 1 to seeds.0
   soil_to_fertilizer_found = 0
   do s = 1 to soil_to_fertilizer.0
      soil_to_fertilizer_to = ,
      soil_to_fertilizer.s.src + soil_to_fertilizer.s.range - 1
      if seeds.i.sts >= soil_to_fertilizer.s.src &,
         seeds.i.sts <= soil_to_fertilizer_to
      then do
           tstf_dest = seeds.i.sts - soil_to_fertilizer.s.src +,
                       soil_to_fertilizer.s.dest
           seeds.i.stf = tstf_dest
           soil_to_fertilizer_found = 1
      end
   end
   /* \ is a logical not - sigh... */
   if \soil_to_fertilizer_found then seeds.i.stf = seeds.i.sts
end

/* the big mapping game */
do i = 1 to seeds.0
   fertilizer_to_water_found = 0
   do s = 1 to fertilizer_to_water.0
      fertilizer_to_water_to = ,
      fertilizer_to_water.s.src + fertilizer_to_water.s.range - 1
      if seeds.i.stf >= fertilizer_to_water.s.src &,
         seeds.i.stf <= fertilizer_to_water_to
      then do
           tftw_dest = seeds.i.stf - fertilizer_to_water.s.src +,
                       fertilizer_to_water.s.dest
           seeds.i.ftw = tftw_dest
           fertilizer_to_water_found = 1
      end
   end
   /* \ is a logical not - sigh... */
   if \fertilizer_to_water_found then seeds.i.ftw = seeds.i.stf
end

/* the big mapping game */
do i = 1 to seeds.0
   water_to_light_found = 0
   do s = 1 to water_to_light.0
      water_to_light_to = ,
      water_to_light.s.src + water_to_light.s.range - 1
      if seeds.i.ftw >= water_to_light.s.src &,
         seeds.i.ftw <= water_to_light_to
      then do
           twtl_dest = seeds.i.ftw - water_to_light.s.src +,
                       water_to_light.s.dest
           seeds.i.wtl = twtl_dest
           water_to_light_found = 1
      end
   end
   /* \ is a logical not - sigh... */
   if \water_to_light_found then seeds.i.wtl = seeds.i.ftw
end

/* the big mapping game */
do i = 1 to seeds.0
   light_to_temp_found = 0
   do s = 1 to light_to_temp.0
      light_to_temp_to = ,
      light_to_temp.s.src + light_to_temp.s.range - 1
      if seeds.i.wtl >= light_to_temp.s.src &,
         seeds.i.wtl <= light_to_temp_to
      then do
           tltt_dest = seeds.i.wtl - light_to_temp.s.src +,
                       light_to_temp.s.dest
           seeds.i.ltt = tltt_dest
           light_to_temp_found = 1
      end
   end
   /* \ is a logical not - sigh... */
   if \light_to_temp_found then seeds.i.ltt = seeds.i.wtl
end

/* the big mapping game */
do i = 1 to seeds.0
   temp_to_humidity_found = 0
   do s = 1 to temp_to_humidity.0
      temp_to_humidity_to = ,
      temp_to_humidity.s.src + temp_to_humidity.s.range - 1
      if seeds.i.ltt >= temp_to_humidity.s.src &,
         seeds.i.ltt <= temp_to_humidity_to
      then do
           ttth_dest = seeds.i.ltt - temp_to_humidity.s.src +,
                       temp_to_humidity.s.dest
           seeds.i.tth = ttth_dest
           temp_to_humidity_found = 1
      end
   end
   /* \ is a logical not - sigh... */
   if \temp_to_humidity_found then seeds.i.tth = seeds.i.ltt
end

/* the big mapping game */
do i = 1 to seeds.0
   humidity_to_loc_found = 0
   do s = 1 to humidity_to_loc.0
      humidity_to_loc_to = ,
      humidity_to_loc.s.src + humidity_to_loc.s.range - 1
      if seeds.i.tth >= humidity_to_loc.s.src &,
         seeds.i.tth <= humidity_to_loc_to
      then do
           thtl_dest = seeds.i.tth - humidity_to_loc.s.src +,
                       humidity_to_loc.s.dest
           seeds.i.htl = thtl_dest
           humidity_to_loc_found = 1
      end
   end
   /* \ is a logical not - sigh... */
   if \humidity_to_loc_found then seeds.i.htl = seeds.i.tth
end

antwoord = 9999999999
/* lets get the big answer */
do i = 1 to seeds.0
   if seeds.i.htl < antwoord then
   antwoord = seeds.i.htl
end

say antwoord
