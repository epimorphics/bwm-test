Given(/^a visitor$/) do
  
end

When(/^she waits (\d+) seconds$/) do |delay|
  sleep delay.to_i
end


When(/^she waits 1 second$/) do
  sleep 1
end
