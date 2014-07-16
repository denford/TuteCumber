# TuteCumber
A Cucumber.js Tutorial and example project. Uses [Cucumber.js](https://github.com/cucumber/cucumber-js) (obviously) in a [Node.js](http://nodejs.org/) environment. Explores [BDD](http://en.wikipedia.org/wiki/Behavior-driven_development) in general.

## Installation
``` bash
  $ git clone https://github.com/denford/TuteCumber.git
  $ cd TuteCumber
  $ npm install
```

## Usage
From the TuteCumber directory
``` bash
  $ npm test
```
You should see something like this to know that Cucumber.js has been properly installed by NPM and that the tests can run
``` bash
  .....................................

  9 scenarios (9 passed)
  37 steps (37 passed)
```

## Aims
To get a better understanding of:
 1. Cucumber.js
 2. Behaviour Driven Development (BDD)
 3. How to achieve #2 with #1

### BDD and Cucumber.js Overview
By no means is this meant to be an exhaustive tutorial on BDD. But basically, the hint is in the name...

BDD is about testing the *behaviour* of the system. Well, first agreeing and specifying the behaviour, and then testing the system's conformance to this desired behaviour. The idea is that these specifications are things that can be generated with, and understood by, the key stakeholders in the system. Not just developers, but other humans as well. It was borne out of Test Driven Development (TDD), and conceptually it's specifying the system with, and testing the system against, a higher level specification.

Basically you specify the behaviour of the system as some nice natual(ish) language specifications. These are called stories (or features in cucumber.js, and I'll call them features here). The features are composed of scenarios. Scenarios are composed of [potentially reusable] steps. And we write glue from these steps to drive our system code and test it.

## Tutorial
The tutorial is split into three stages. Each builds on the former and adds more complexity (to the tests and to the system). However, at all stages we are working with the same directory structure:
```
TuteCumber/
|- features/             # cucumber.js *.feature files (gherkin syntax)
   |- step_definitions/  # cucumber.js step definitions (CoffeeScript)
   |- support/           # cucumber.js World definition + hooks (CoffeeScript)
|- models/               # the code for the "calculator system". The actual system code to be tested
|- app.js                # ordinarily the main file for a Node.js project (unused in TuteCumber)
|- README.md             # you're staring at it
```
Thanks to the alphabetical gods (i.e. blind luck) the order of files here is the order in which we'd introduce them:
 * first, in cucumber.js, features are written using [gherkin syntax](https://github.com/cucumber/cucumber/wiki/Gherkin) (very free flowing natural language)
 * then, the features are broken down into steps, which are defined in the step definitions
 * then, the steps reference a World object which is the context which drives the...
 * actual code to be tested (the models here)

**Note**: cucumber.js automatically looks in, and expects content to be inside a `features/` directory, so you don't actually have to configure anything, just use this structure.

### System
As much as I hate trivial examples, the "system" that this tute uses is a *simple* calculator - *stupidly simple* actually; think addition and subtraction only. But it does provide enough "meat" to see how BDD can be used to evolve your system, and how the addition of new features in Cucumber drives this process.

### Stage 1 - Addition
Now, the first stage of the system sees us defining our first feature - addition. Calculators should let us add numbers. But first, let's update our code to the relevant release / commit:
``` bash
  $ git checkout Stage1
  $ npm test
```
The last command runs the tests again and this time we should be testing a smaller number of scenarios (indicating the code has been "reverted" back to the first stage where we only had a smaller number of tests defined). You should see something like:
``` bash
  ......

  2 scenarios (2 passed)
  6 steps (6 passed)
```
###### Features
The first file to look at is the [`features/Feature1.feature`](https://github.com/denford/TuteCumber/blob/Stage1/features/Feature1.feature) file (later I renamed this to `addition.feature`, but at this point I had it unimaginatively named). You can see that we have some basic scenarios here for this feature. The scenarios follow a *given-when-then* template:
 * Given: initial context or preconditions
 * When: events that occur
 * Then: expected outcomes

You'll see that at this stage, the addition feature just defines 2 simple (and obvious) scenarios.

###### Step Definitions
Now we want to define the steps. Our steps are in [`features/step_definitions/myStepDefinitions.coffee`](https://github.com/denford/TuteCumber/blob/Stage1/features/step_definitions/myStepDefinitions.coffee). However, if we had only written the .feature file, and nothing else, when we tried to run the tests we'd see something like this (you can test this out by clearing out the step definitions file and running the `npm test`):
``` bash
UUUUUU

2 scenarios (2 undefined)
6 steps (6 undefined)

You can implement step definitions for undefined steps with these snippets:

this.Given(/^the calculator is clear$/, function (callback) {
  // Write code here that turns the phrase above into concrete actions
  callback.pending();
});

this.When(/^I add (\d+) and (\d+)$/, function (arg1, arg2, callback) {
  // Write code here that turns the phrase above into concrete actions
  callback.pending();
});

this.Then(/^the result should be (\d+)$/, function (arg1, callback) {
  // Write code here that turns the phrase above into concrete actions
  callback.pending();
});
```
What this is telling us is that although we've defined the feature, there's no step definitions (yet!). Helpfully cucumber.js gives us the templates for these step definitions (in JavaScript). **Note** that since I'm using CoffeeScript, our [`features/step_definitions/myStepDefinitions.coffee`](https://github.com/denford/TuteCumber/blob/Stage1/features/step_definitions/myStepDefinitions.coffee) file uses a different syntax.

In essence, this file is where we declare the World object (`@World` - more on this below), then we have the `@Given/@When/@Then` definitions. Inside these definitions, we call methods on the World object (e.g. `@clearCalculator()` or `@setArguments arg1, arg2`) and then call the `callback()` to continue the party. In particular, in the `@Then` definition, we perform a test and either call the `callback()` (when it passes) or `callback.fail` (when it fails).
###### World
According to the [cucumber.js website](https://github.com/cucumber/cucumber-js), the World object is:
> *World* is a constructor function with utility properties, destined to be used in step definitions

Basically, inside our World definition, ([features/support/world.coffee](https://github.com/denford/TuteCumber/blob/Stage1/features/support/world.coffee)), we (finally?) reference our actual code to be tested. In this case our calculator (`Calc`) object (more on this below). We call methods on our calculator, like `@calc.clearCalculator()` and `@calc.add()` from those "utility properties" mentioned above.
###### Calculator Model
Finally, you can see the definition of our actual "system code", the definition of our Calculator class. This is defined in the [`models/calc.coffee`](https://github.com/denford/TuteCumber/blob/Stage1/models/calc.coffee) file. All we do is store the arguments when they are set, and use them when we want to add.
###### Stage 1 Comments
We can see that at this stage, the [`models/calc.coffee`](https://github.com/denford/TuteCumber/blob/Stage1/models/calc.coffee) class is *super* simple. Tragically simple really. In fact, what is interesting here is that although we "knew" from specification in natural language that the calculator should have a concept of being cleared, in order to pass our tests we don't really have to do anything in the `clearCalculator` method. We'll discuss this and come back to it more in Stage 3.

### Overall Comments
One thing that makes it interesting (to me), and what I'll try to demonstrate here, is that we can see how the system being tested becomes more sophisticated as more features are added. I don't just mean that it becomes more complex, that more code is added, I mean that adding more feature specs forces (or at least strongly encourages) us to write a system that evolves  quickly approximate what we think the final system should look like.
