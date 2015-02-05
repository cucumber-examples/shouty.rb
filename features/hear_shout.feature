Feature: Hear Shout

  Rules:
  - Listener must be within 1000m from shouter
  - Shout disappears when listener leaves
  - Shout appears when listener enters
  - Shouts must be 140 characters or less

  Questions:
  - Will people hear their own messages?
  - What if a person is offline?

  Background:
    Given "Buckingham Palace" is at geo location 51.501364,-0.14189
    Given "Trafalgar Square" is at geo location 51.508039,-0.128069
    Given "St James' Park" is at geo location 51.49954,-0.13358

  @focus
  Scenario: Charles can't hear Elizabeth's shout
    Given Elizabeth is in "Buckingham Palace"
    But Charles is in "Trafalgar Square"
    When Elizabeth shouts "Tea is ready, dear!"
    Then Charles should not hear the message

  Scenario: Charles hears Elizabeth's shout
    Given Elizabeth is in "Buckingham Palace"
    But Charles is in "St James' Park"
    When Elizabeth shouts "Tea is ready, dear!"
    Then Charles should hear the message
