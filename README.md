# TuteCumber
A Cucumber.js Tutorial and example project. Uses Cucumber.js (obviously) in a Node.js environment. Explores BDD in general.

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
 1. Behaviour Driven Development (BDD)

## Scenario
As much as I hate trivial examples, the "system" that this tute uses is a simple calculator - stupidly simple actually; think addition and subtraction of integers only. But it does provide enough "meat" to see how BDD can be used to evolve your system, and how the addition of new features in Cucumber drives this process.

## Tutorial
The tutorial is split into three stages. Each builds on the former and adds more complexity. At all stages we are working with the same directory structure:
```
TuteCumber/
|- features/             # cucumber.js *.feature files (gherkin syntax)
   |- step_definitions/  # cucumber.js step definitions (coffee script)
   |- support/           # cucumber.js World definition + hooks (coffee script)
|- models/               # the code for the "calculator system". The actual code to be tested
|- app.js                # ordinarily the main file for a Node.js project (unused in TuteCumber)
|- README.md             # you're staring at it
```
Thanks to the alphabetical gods (i.e. blind luck) the order of files here is the order in which we'd introduce them:
 * first, features are written using gherkin syntax (very free flowing natural language)
 * then, the features are broken down into steps, which are defined in the step definitions
 * then, the steps make reference to a World object which is the context which drives the...
 * actual code to be tested (the models here)
