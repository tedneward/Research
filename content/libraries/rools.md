title=Rools
tags=library, nodejs, rules, RETE
summary=A small rule engine for Node.
~~~~~~

[Source](https://github.com/frankthelen/rools)

Primary goal was to provide a nice and state-of-the-art interface for modern JavaScript (ES6). Facts are plain JavaScript or JSON objects or objects from ES6 classes with getters and setters. Rules are specified in pure JavaScript rather than in a separate, special-purpose language like DSL.

Secondary goal was to provide RETE-like efficiency and optimization.

`npm install rools`

Examples:
```
// import
const { Rools, Rule } = require('rools');

// facts
const facts = {
  user: {
    name: 'frank',
    stars: 347,
  },
  weather: {
    temperature: 20,
    windy: true,
    rainy: false,
  },
};

// rules
const ruleMoodGreat = new Rule({
  name: 'mood is great if 200 stars or more',
  when: (facts) => facts.user.stars >= 200,
  then: (facts) => {
    facts.user.mood = 'great';
  },
});
const ruleGoWalking = new Rule({
  name: 'go for a walk if mood is great and the weather is fine',
  when: [
    (facts) => facts.user.mood === 'great',
    (facts) => facts.weather.temperature >= 20,
    (facts) => !facts.weather.rainy,
  ],
  then: (facts) => {
    facts.goWalking = true;
  },
});

// evaluation
const rools = new Rools();
await rools.register([ruleMoodGreat, ruleGoWalking]);
await rools.evaluate(facts);

/*
These are the resulting facts:
 */
{ user: { name: 'frank', stars: 347, mood: 'great' },
  weather: { temperature: 20, windy: true, rainy: false },
  goWalking: true,
}
```

Looks very good as a RETE-based engine for rules evaluation in JS.
