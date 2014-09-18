require 'shouty'

Before do
  @shouty = Shouty.new

  @lucy = @shouty.person('Lucy')
  @sean = @shouty.person('Sean')
end
