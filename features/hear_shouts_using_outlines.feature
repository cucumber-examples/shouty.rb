Feature: Hear Shout

  Scenario Outline: Lauren hears Claire's message
    Given "<shouter>" is in "<shouter_location>"
    And "<listener>" is in "<listener_location>"
    When "<shouter>" shouts "hi"
    Then "<listener>" should <expectation>

    Examples:
      | shouter | shouter_location | listener | listener_location | expectation             |
      | Jim     | Leeds Stadium    | Tom      | Westminster Abbey | not receive the message |
      | Claire  | Osterley Tube    | Lauren   | Osterley Tube     | receive the message     |
      | Claire  | Osterley Tube    | Claire   | Osterley Tube     | not receive the message |
