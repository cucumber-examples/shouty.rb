Feature: Basic Shout
  People on Shouty are able to broadcast messages to other people close enough to them.

  Rules:

  * hear shouts within 1km
  * shouts cannot be longer than 256 characters

  Personae:

  * Lucy is a listener.
  * Sean is a shouter.

  Scenario: the one where Lucy is in range
    Given Lucy is within Sean's range
    When Sean shouts
    Then Lucy should hear Sean's message

  Scenario: the one where Lucy is out of range
    Given Lucy is out of Sean's range
    When Sean shouts
    Then Lucy should not hear Sean's message

  Scenario: the one where Sean shouts a short enough message
    Given Lucy is within Sean's range
    When Sean shouts a short enough message
    Then Lucy should hear Sean's message

  Scenario: the one where Sean shouts a too-long message
    Given Lucy is within Sean's range
    When Sean shouts a too-long message
    Then Lucy should not hear Sean's message
