$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__))

require 'carrot'
require 'json'
require 'payment'

q = Carrot.queue('payments', durable: true)

while str_msg = q.pop(ack: true)
  msg = JSON.parse(str_msg)
  type = msg['type']

  worker_class = Object.const_get(type.capitalize)
  worker = worker_class.new(msg['params'])
  worker.perform
end
