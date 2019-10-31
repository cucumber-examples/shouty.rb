Feature: Hear Shout

  Rule: Shouts have a range up to 1000m

    Scenario: Lucy is within Sean's range
      Given Lucy is at 0, 0
      And Sean is at 0, 900
      When Sean shouts
      Then Lucy should hear Sean

    Scenario: Lucy is outside Sean's range
      Given Lucy is at 0, 0
      And Sean is at 800, 800
      When Sean shouts
      Then Lucy should hear nothing
