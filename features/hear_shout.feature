Feature: Hear Shout

  Rules
  =====
  - Must be within 500m
  - Must be in range at time of shout
  - No account needed to hear shouts

  Scenario: Gertrude hears Bob's nearby coffee shout
    Given Gertrude is 499 m away from Bob
    When Bob shouts "coffee promo"
    Then Gertrude hears "coffee promo"

  Scenario: Gertrude hears Bob's nearby chocolate shout
    Given Gertrude is 499 m away from Bob
    When Bob shouts "free chocolate"
    Then Gertrude hears "free chocolate"
