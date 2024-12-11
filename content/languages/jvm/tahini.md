title=Tahini
tags=language, jvm, dynamic, functional, design by contract
summary=A dynamic, interpreted and impurely functional programming language with testing and design-by-contract features.
~~~~~~

[Source](https://github.com/anirudhgray/tahini-lang)

```
scoop "./kitchen.tah" into kitchen;

fun totalIngredients(ingredientQuantities)
    // contract
    postcondition: total >= 0
{
    var total = 0;
    for (var i = 0; i < len(ingredientQuantities); i = i + 1) {
        total = total + ingredientQuantities[i];
    }
    return total;
}

fun prepareDish() {
    return kitchen::bake(100, kitchen::ovenTemperature);
}

test "totalIngredients test" {
    // Test case: summing 3 ingredients
    assertion: totalIngredients([1, 2, 3]) == 6, "Should be 6!";
    // Test case: summing 0 ingredients
    assertion: totalIngredients([]) == 0, "Should be 0!";
}

var flour = 2;
var sugar = 1;
var eggs = 3;

var ingredientsList = [flour, sugar, eggs];
print "Total ingredients needed: " + totalIngredients(ingredientsList);
print prepareDish();
```
