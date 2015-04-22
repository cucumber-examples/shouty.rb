Feature: Basic Shout
  People on Shouty are able to broadcast messages to other people close enough to them.

  Rules:

  * hear shouts within 1km
  * shouts cannot be longer than 256 characters

  Personae:

  * Lucy is a listener.
  * Sean is a shouter.

  Scenario: the one where Lucy is in range
    Given Lucy is 1000m away from Sean
    When Sean shouts "Hi SF!"
    Then Lucy hears "Hi SF!"

  Scenario: the one where Lucy is out of range
    Given Lucy is 1001m away from Sean
    When Sean shouts "Hi SF!"
    Then Lucy should not hear "Hi SF!"
