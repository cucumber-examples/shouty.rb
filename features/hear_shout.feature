Feature: Hear Shout

  People can shout. Other people nearby can hear it.

  Rules
  =====

  - Only heard within 500m of shouter
  - Can hear shouts without account
  - (Can hear shouts even if mobile app not open)
  - Seen shouts update as users move

  Personae
  ========

  - Lucy the listener. Likes to shop.
  - Sean the shouter. Shop manager.

  Scenario: Lucy walks past a shop with an offer on
    Given Lucy is 250 m from Sean
    When Sean shouts "50% off cheese at Sean's cheese hut"
    Then Lucy hears "50% off cheese at Sean's cheese hut"

  Scenario: Lucy doesn't walk past Sean who shouts an offer
    Given Lucy is 700 m from Sean
    When Sean shouts "50% off cheese at Sean's cheese hut"
    Then Lucy hears nothing

  Scenario: Lucy nearly walks away from Sean and still hears him
    Given Lucy is 351 m from Sean
    When Sean shouts "can anyone hear me?"
    And Lucy moves another 149 m away from Sean
    Then Lucy hears "can anyone hear me?"

  Scenario: Lucy walks away from Sean and message disappears
    Given Lucy is 351 m from Sean
    When Sean shouts "can anyone hear me?"
    And Lucy moves another 150 m away from Sean
    Then Lucy hears nothing

  @focus
  Scenario: Lucy hears close shouts first
    Given Sean is 250 m from Lucy
    And Shirley is 100 m from Lucy
    When Sean shouts "I'm Sean"
    And Shirley shouts "I'm Shirley"
    Then Lucy hears:
      | I'm Shirley |
      | I'm Sean    |
