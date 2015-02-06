Feature: Hear Shout

  Rules:
  - [x] Listener must be within 1000m from shouter
  - [ ] Shout disappears when listener leaves
  - [ ] Shout appears when listener enters
  - [x] Shouts longer that 140 characters are not delivered
  - [ ] No newlines in messages

  Questions:
  - Will people hear their own messages?
  - What if a person is offline?

  Distances:
  - Buckingham Palace and Trafalgar Square are far apart (more than 1000m)
  - Buckingham Palace and St James's Park are close (less than 1000m)

  Background:
    Given the following geo locations:
      | name              | lat       | long      |
      | Buckingham Palace | 51.501364 | -0.141890 |
      | Trafalgar Square  | 51.508039 | -0.128069 |
      | St James's Park   | 51.499540 | -0.133580 |

  Scenario: Charles hears Elizabeth's shout
    Given Elizabeth is in Buckingham Palace
    And Charles is in St James's Park
    When Elizabeth shouts "Tea is ready, dear!"
    Then Charles should hear the message

  Scenario: Charles can't hear Elizabeth's shout
    Given Elizabeth is in Buckingham Palace
    But Charles is in Trafalgar Square
    When Elizabeth shouts "Tea is ready, dear!"
    Then Charles should not hear the message

  Scenario: Elizabeth shouts a message that is too long
    Given Elizabeth is in Buckingham Palace
    And Charles is in St James's Park
    When Elizabeth shouts:
      """
      Spam spam spam spam spam spam spam spam spam spam spam spam
      Spam spam spam spam spam spam spam spam spam spam spam spam
      Spam spam spam spam spam spam spam spam spam spam spam spam
      Spam spam spam spam spam spam spam spam spam spam spam spam
      Spam spam spam spam spam spam spam spam spam spam spam spam
      Spam spam spam spam spam spam spam spam spam spam spam spam
      Spam spam spam spam spam spam spam spam spam spam spam spam
      """
    Then Charles should not hear any messages
