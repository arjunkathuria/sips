defmodule PingTest do
  use ExUnit.Case

  test "It responds to a pong with a ping" do
    ping = spawn_link(Ping, :start, []);
    send ping, {:pong, self()}
    assert_receive {:ping, ^ping}
  end

    test "It responds to 2 pongs with 2 pings" do
    ping = spawn_link(Ping, :start, []);

    send ping, {:pong, self()}
    assert_receive {:ping, ^ping}

    send ping, {:pong, self()}
    assert_receive {:ping, ^ping}
  end
    
end
