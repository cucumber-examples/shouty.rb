Feature: Hear Shout

  Rules:
  - Listener must be within 1000m from shouter
  - Shout disappears when listener leaves
  - Shout appears when listener enters
  - Shouts must be 140 characters or less

  Scenario: Charles can't hear Elizabeth's shout
    Given Elizabeth is in "Buckingham Palace"
    But Charles is in "Trafalgar Square"
    When Elizabeth shouts "Tea is ready, dear!"
    Then Charles should not hear the shout

  Scenario: Charles hears Elizabeth's shout
    Given Elizabeth is in "Buckingham Palace"
    But Charles is in "St James' Park"
    When Elizabeth shouts "Tea is ready, dear!"
    Then Charles should hear the shout
