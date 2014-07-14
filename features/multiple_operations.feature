Feature: Multiple Addition and Subtraction Operations
  In order to perform real world calculations
  As a user of the calculator
  I want to be able to chain multiple additions and subtractions

  Scenario: Multiple Addition
    Given the calculator is cleared
    When I add 5 and 6
    And then add 6
    And then add 65
    Then the result should be 82

  Scenario: Multiple Addition and subtraction
    Given the calculator is cleared
    When I add 5 and 6
    And then add 45
    And then subtract 24
    Then the result should be 32

  Scenario: Multiple Addition and subtraction result negative
    Given the calculator is cleared
    When I subtract 65 from 34
    And then add 45
    And then subtract 87
    Then the result should be -73

  Scenario: Multiple Addition with clear mid operation
    Given the calculator is cleared
    When I add 5 and 6
    And the calculator is cleared
    And then add 65
    Then the result should be 65

  Scenario: Clear resets result to zero
    When the calculator is cleared
    Then the result should be 0

  Scenario: Clear resets result to zero after complex operations
    When I add 5 and 6
    And then add 65
    And then subtract 4055
    And then add 3404
    And the calculator is cleared
    Then the result should be 0