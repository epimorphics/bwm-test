Given(/^a visitor$/) do
  @@world = Hash.new
end

When(/^she waits (\d+) seconds$/) do |delay|
  sleep delay.to_i
end


When(/^she waits 1 second$/) do
  sleep 1
end
