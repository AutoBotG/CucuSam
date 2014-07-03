Feature: tesco search

  Background:
    Given I am on home page

   @test
  Scenario: Search for a term
    When I search for "milk"
     Then I should be on search results page


