Feature: Hear Shout

  Personas:
    * Lucy, the listener
    * Sean, the shouter

  Business rules:
    * Range is configurable
    * A shout is heard by listeners within range of the shouter
    * A shout is 140 characters or less

  Background:
    Given the shouting range is 100ft

  Scenario: Lucy hears Sean's shout
    Given Lucy is 99ft away from Sean
    When Sean shouts "10% off shoes today!"
    Then Lucy hears "10% off shoes today!"

  Scenario: Lucy's too far to hear Sean
    Given Lucy is 100ft away from Sean
    When Sean shouts "10% off shoes today!"
    Then Lucy does not hear "10% off shoes today!"
