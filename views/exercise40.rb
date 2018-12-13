# from https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/dependency_injection.md
# sophie s examples: https://github.com/soph-g/testing_classes_in_isolation_examples

class EmailClient
  def initialize(message_class = Message)
    @message_class = message_class
  end

  def message
    @message_class.new
  end
end

class Message
  def send(to, body)
    "To #{to} and the greeting is #{body}"
  end
end

class SayHelloToMyLittleFriend
  def initialize(emailclient_class = EmailClient)
    @emailclient_class = emailclient_class
  end

  def run
    email = @emailclient_class.new
    email.message.send('friend@example.com', 'HELLO!')
  end
end
