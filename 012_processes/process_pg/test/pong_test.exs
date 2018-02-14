defmodule PongTest do
  use ExUnit.Case

  test "It responds to a ping with a pong" do
    pong = spawn_link(Pong, :start, []);
    send pong, {:ping, self()}
    assert_receive {:pong, ^pong}
  end

    test "It responds to 2 pings with 2 pongs" do
    pong = spawn_link(Pong, :start, []);

    send pong, {:ping, self()}
    assert_receive {:pong, ^pong}

    send pong, {:ping, self()}
    assert_receive {:pong, ^pong}
  end    
end
