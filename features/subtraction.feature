Feature: Subtract Numbers
  As a user of the calculator
  I want to subtract 2 numbers

  Scenario: Subtract 2 small numbers
    Given the calculator is cleared
    When I subtract 5 from 6
    Then the result should be 1