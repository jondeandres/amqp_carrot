require 'carrot'
require 'json'

message_template = {
  type: 'payment',
  params: {
  }
}

q = Carrot.queue('payments', durable: true)

100.times do
  message = message_template.dup
  message[:params][:value] = rand(10)
  q.publish(message.to_json)
end
