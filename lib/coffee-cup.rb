require "coffee-cup/engine"

module CoffeeCup
  def self.body_data(request)
    request[:controller].camelize + '#' + request[:action].camelize
  end
end
