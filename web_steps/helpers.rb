module Helpers
  def someone_shouts(person_name, message)
    browser = @browsers[person_name]
    # workaround for selenium bug. selenium only lets the
    # first line of a multiline string through to the field
    message_without_newlines = message.gsub(/\n/m, '')
    browser.fill_in('Message', :with => message_without_newlines)
    browser.click_button('Shout!')

    @shouted_message = message
  end
end
