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

  Scenario: Lucy walks past a shop with an offer on
    Given Lucy is 250 m from Sean
    When Sean shouts "50% off cheese at Sean's cheese hut"
    Then Lucy hears "50% off cheese at Sean's cheese hut"

  Scenario: Lucy doesn't walk past Sean who shouts an offer
    Given Lucy is 700 m from Sean
    When Sean shouts "50% off cheese at Sean's cheese hut"
    Then Lucy hears nothing
