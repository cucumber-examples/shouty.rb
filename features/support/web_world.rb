require 'capybara'

module WebWorld
  def start_shouty
    #no-op
  end

  def register_sean(position)
    @sean = Capybara::Session.new(:selenium, ShoutyApp)
    @sean.visit "/"
    @sean.fill_in "name", with: "Sean"
    @sean.fill_in "position", with: position
    @sean.click_button "Register"
  end

  def register_lucy(position)
    @lucy = Capybara::Session.new(:selenium, ShoutyApp)
    @lucy.visit "/"
    @lucy.fill_in "name", with: "Lucy"
    @lucy.fill_in "position", with: position
    @lucy.click_button "Register"
  end

  def make_sean_shout(message)
    @message = message
    @sean.fill_in "message", with: message
    @sean.click_button "Shout"
  end

  def expect_lucy_to_have_heard_message
    expect(@lucy).to have_content @message
  end

  def expect_lucy_not_to_have_heard_message
    expect(@lucy).not_to have_content @message
  end
end
