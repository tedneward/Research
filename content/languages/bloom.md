title=Bloom
tags=language, distribution
summary=A language for disorderly distributed programming with powerful consistency analysis and concise, familiar syntax.
~~~~~~

[Website](http://bloom-lang.net/) | [Source](https://github.com/bloom-lang/bud) *(Last update somewhere in 2019)*

Based around UCBerkeley [BOOM (Berkeley Orders of Magnitude) research project](https://boom.cs.berkeley.edu/).

Chat example:

```
# ruby chat_server.rb

# ruby chat.rb alice

# ruby chat.rb bob

# ruby chat.rb harvey
```

chat_protocol.rb
```
module ChatProtocol
  state do
    channel :connect, [:@addr, :client] => [:nick]
    channel :mcast
  end

  DEFAULT_ADDR = "127.0.0.1:12345"
end
```

chat.rb
```
require 'rubygems'
require 'backports'
require 'bud'
require_relative 'chat_protocol'

class ChatClient
  include Bud
  include ChatProtocol

  def initialize(nick, server, opts={})
    @nick = nick
    @server = server
    super opts
  end

  bootstrap do
    connect <~ [[@server, ip_port, @nick]]
  end

  bloom do
    mcast <~ stdio do |s|
      [@server, [ip_port, @nick, Time.new.strftime("%I:%M.%S"), s.line]]
    end

    stdio <~ mcast { |m| [pretty_print(m.val)] }
  end

  # format chat messages with color and timestamp on the right of the screen
  def pretty_print(val)
    str = "\033[34m"+val[1].to_s + ": " + "\033[31m" + (val[3].to_s || '') + "\033[0m"
    pad = "(" + val[2].to_s + ")"
    return str + " "*[66 - str.length,2].max + pad
  end
end

server = (ARGV.length == 2) ? ARGV[1] : ChatProtocol::DEFAULT_ADDR
puts "Server address: #{server}"
program = ChatClient.new(ARGV[0], server, :stdin => $stdin)
program.run_fg
```

chat_server.rb
```
require 'rubygems'
require 'backports'
require 'bud'
require_relative 'chat_protocol'

class ChatServer
  include Bud
  include ChatProtocol

  state { table :nodelist }

  bloom do
    nodelist <= connect { |c| [c.client, c.nick] }
    mcast <~ (mcast * nodelist).pairs { |m,n| [n.key, m.val] }
  end
end

# ruby command-line wrangling
addr = ARGV.first ? ARGV.first : ChatProtocol::DEFAULT_ADDR
ip, port = addr.split(":")
puts "Server address: #{ip}:#{port}"
program = ChatServer.new(:ip => ip, :port => port.to_i)
program.run_fg
```

