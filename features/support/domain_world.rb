module DomainWorld

  def start_shouty
    @network = Network.new
  end

  def register_sean(position)
    @sean = Person.new(@network, position)
  end

  def register_lucy(position)
    @lucy = Person.new(@network, position)
  end

  def make_sean_shout(message)
    @message = message
    @sean.shout(@message)
  end

  def expect_lucy_to_have_heard_message
    expect(@lucy.last_heard_message).to eq @message
  end

  def expect_lucy_not_to_have_heard_message
    expect(@lucy.last_heard_message).not_to eq @message
  end
end
