require 'pusher'

pusher = Pusher::Client.new(
  app_id: '1492363',
  key: '4d36179fd8f5e7efcc55',
  secret: '89393f72ef8220af53e3',
  cluster: 'ap2',
  encrypted: true
)

pusher.trigger('my-channel', 'my-event', {
  message: 'hello world'
})