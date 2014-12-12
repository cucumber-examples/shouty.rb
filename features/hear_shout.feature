Feature: Hear Shout

  Personas:
    * Lucy, the listener
    * Sean, the shouter

  Business rules:
    * A shout is heard by listeners less than 1000ft from the shouter
    * A shout is 140 characters or less

  Scenario: Lucy hears Sean's shout
    Given Lucy is 999ft away from Sean
    When Sean shouts "10% off shoes today!"
    Then Lucy hears "10% off shoes today!"
