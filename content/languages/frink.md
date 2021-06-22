title=Frink
tags=language, jvm
summary=A practical calculating tool and programming language designed to make physical calculations simple, to help ensure that answers come out right, and to make a tool that's really useful in the real world. It tracks units of measure (feet, meters, kilograms, watts, etc.) through all calculations, allowing you to mix units of measure transparently, and helps you easily verify that your answers make sense.
~~~~~~

[Website](https://futureboy.us/frinkdocs/) |

### [Sample Calculations](https://futureboy.us/frinkdocs/#SampleCalculations):

#### Mass and Volume
Let's say you wanted to fill your bedroom up with water. How much water would it take? Let's say your room measures 10 feet by 12 feet wide by 8 feet high.

```
10 feet 12 feet 8 feet -> gallons
552960/77 (approx. 7181.298701298701)
```

It would take approximately 7181 gallons to fill it. Note that you get both an exact fraction and an approximation. (If you don't want to see the fraction, put a decimal point in any of the numbers, like 10. or 10.0 .) How much would that weigh, if you filled it with water? Frink has the unit "water" which stands for the density of water.

```
10. feet 12 feet 8 feet water -> pounds
59930.84215309883
```

So it would weigh almost 60,000 pounds. What if you knew that your floor could only support 2 tons? How deep could you fill the room with water?

```
2. tons / (10 feet 12 feet water) -> feet
0.5339487791320047
```

So you could only fill it about 0.53 feet deep. It'll be a pretty sad pool party.

#### Liquor
You can set variables on the fly, by using the assignment = operator. Let's say you want to define a new unit representing the amount of alcohol in a can of (quality) 3.2 beer. Keep in mind that 3.2 beer is measured by alcohol/weight, while almost all other liquors (and many beers) are usually measured in alcohol/volume. The density ratio between water and alcohol is given by:

```
water/alcohol
1.267
```

Water is thus 1.267 times denser than alcohol. 3.2 beer (measured by weight) is thus actually 4.0 percent alcohol as measured by volume. Now let's set that variable in terms of a beer's density of alcohol per volume so we can compare:

```
beer = 12 floz 3.2 percent water/alcohol
```

Then, you wanted to find out how many beers a big bottle of champagne is equal to:

```
magnum 13.5 percent -> beer
14.07
```

You probably don't want to drink that whole bottle. Now let's say you're mixing Jungle Juice (using a 1.75 liter bottle of Everclear (190 proof!)) and Kool-Aid to fill a 5-gallon bucket (any resemblance to my college parties is completely intentional.) What percent alcohol is that stuff?

```
junglejuice = 1.75 liter 190 proof / (5 gallon)
junglejuice -> "percent"
8.78372074090843481138500000 percent
```

It's really not that strong. About 8.8%. But if you drink 5 cups of that, at 12 fluid ounces each, how many beers have you had?

```
5 12 floz junglejuice -> "beer"
10.832 beer
```

Maybe that's why people were getting punched in the head. QED.

#### More Liquor
Some more useful calculations, most thanks to the lovely Steve Clymer:

How many cases in a keg? (A keg is a normal-sized keg, what those in the beer industry would call a "half barrel," or 1/2 beerbarrel in Frink notation. I don't think they sell full barrels. I've never seen one. It would weigh 258 pounds. A "pony keg" is a "quarter barrel" or, in Frink notation, ponykeg or 1/4 beerbarrel)

```
keg -> case
62/9 (approx. 6.888888888888889)
```

How many 12 fluid ounce drinks (i.e. cans o' beer) in a keg?

```
keg -> 12 floz
496/3 (approx. 165.33333333333334)
```

What is the price in dollars per fluid ounce of alcohol when buying a keg of 3.2 beer? (Remember that 3.2 beer is measured in alcohol/weight, so we correct by the density ratio of water/alcohol to get alcohol by volume:)

```
(60 dollars)/(keg 3.2 percent water/alcohol) -> "dollars/floz"
0.74593 dollars/floz
```

A bottle of cheap wine? (A "winebottle" is the standard 750 ml size.)

```
(6.99 dollars)/(winebottle 13 percent) -> "dollars/floz"
2.12 dollars/floz
```

A big plastic bottle of really bad vodka?

```
(13.99 dollars)/(1750 ml 80 proof) -> "dollars/floz"
0.59104811225625 dollars/floz
```

#### Fiscal Calculations
You can calculate the day that your company will run out of cash, based on their financial statements. The following is an example for a real company, based on SEC filings, which read as the following:

Cash and Cash Equivalents (in thousands)
December 31, 2000	| June 30, 2001
------------------+--------------
$86,481 | $41,601

To make this more readable, you can define variables to hold values:

```
burnrate = (#2001-06-30# - #2000-12-31#) / ((86481 - 41601) thousand dollars)

burnrate -> dollars/day
248012.89431247435
```
You can calculate the number of days until the money runs out at this rate:
```
41601 thousand dollars / burnrate -> "days"
167.7372 days
```
Using date/time math, starting from the last report date (June 30, 2001) you can find out the exact date this corresponds to:
```
#2001-06-30# + 41601 thousand dollars / burnrate
AD 2001-12-14 04:41:38.101 PM (Fri) Mountain Standard Time
```
Just in time to see the cinema release of the first Lord of the Rings movie with your last six bucks. Will they know it's Christmas Time at all?
