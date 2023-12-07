/* rexx */
address tso "alloc da(input7) dd(aoc7) shr"
address tso "execio * diskr aoc7 (open stem invoer. finis"
address tso "free dd(aoc7)"

draw.0 = 0
antwoord = 0

do i = 1 to invoer.0
   thand = rank_hand(word(invoer.i,1))
   draw.i.cards = word(invoer.i,1)
   draw.i.hand = thand
   draw.i.bid = word(invoer.i,2)
end
draw.0 = i - 1
ordering = 1
do until ordering=0
k = 1
vorige = 1
teller = 0
ordering = 0
   do i = 1 to draw.0
      k = k + 1
      if i = draw.0 then iterate
      if draw.k.hand < draw.i.hand then do
         thand = draw.k.hand
         tcards = draw.k.cards
         tbid = draw.k.bid
         draw.k.hand = draw.i.hand
         draw.k.cards = draw.i.cards
         draw.k.bid = draw.i.bid
         draw.i.hand = thand
         draw.i.cards = tcards
         draw.i.bid = tbid
         ordering = 1
      end
      else
      if draw.k.hand = draw.i.hand then
         if first_card(draw.k.cards, draw.i.cards) = 2 then do
         thand = draw.k.hand
         tcards = draw.k.cards
         tbid = draw.k.bid
         draw.k.hand = draw.i.hand
         draw.k.cards = draw.i.cards
         draw.k.bid = draw.i.bid
         draw.i.hand = thand
         draw.i.cards = tcards
         draw.i.bid = tbid
         ordering = 1
      end
   end
end

do i = 1 to draw.0
   antwoord = antwoord + (draw.i.bid * i)
end
say antwoord

exit

first_card: procedure
arg hand1,hand2
do i = 1 to 5
   card1 = substr(hand1,i,1)
   card2 = substr(hand2,i,1)
   if card1 = 'T' then card1 = 10
   if card1 = 'J' then card1 = 11
   if card1 = 'Q' then card1 = 12
   if card1 = 'K' then card1 = 13
   if card1 = 'A' then card1 = 14
   if card2 = 'T' then card2 = 10
   if card2 = 'J' then card2 = 11
   if card2 = 'Q' then card2 = 12
   if card2 = 'K' then card2 = 13
   if card2 = 'A' then card2 = 14
   if card1 > card2 then return 1
   if card2 > card1 then return 2
end
say 'Ehh, twee identieke draws??'
return 0

rank_hand: procedure
arg kaarten
kaart.1 = substr(kaarten,1,1)
kaart.2 = substr(kaarten,2,1)
kaart.3 = substr(kaarten,3,1)
kaart.4 = substr(kaarten,4,1)
kaart.5 = substr(kaarten,5,1)
do i = 1 to 5
   if kaart.i = 'T' then kaart.i = 10
   if kaart.i = 'J' then kaart.i = 11
   if kaart.i = 'Q' then kaart.i = 12
   if kaart.i = 'K' then kaart.i = 13
   if kaart.i = 'A' then kaart.i = 14
end
kaart.0 = 5
do i = 2 to 14
   setje.i = ""
end
do i = 1 to kaart.0
   kaarthex = d2x(kaart.i)
   kaartnum = kaart.i
   setje.kaartnum = setje.kaartnum||kaarthex
end
hand = setje.2||' ',
       setje.3||' ',
       setje.4||' ',
       setje.5||' ',
       setje.6||' ',
       setje.7||' ',
       setje.8||' ',
       setje.9||' ',
       setje.10||' ',
       setje.11||' ',
       setje.12||' ',
       setje.13||' ',
       setje.14

aantal = words(hand)
select
   when aantal = 1 then return 7 /* five of a kind */
   when aantal = 2 then do
        lengte = length(word(hand,1))
        if lengte = 1 | lengte = 4 then return 6 /* four of a kind */
        else return 5 /* full house */
   end
   when aantal = 3 then do
        lengte = length(word(hand,1))
        lengte2 = length(word(hand,2))
        if lengte = 3 | (lengte = 1 &,
           (lengte2 = 1 | lengte2 = 3)) then return 4 /* three of a kind */
        else return 3 /* two pair */
   end
   when aantal = 4 then return 2 /* one pair */
   otherwise return 1 /* high card */
