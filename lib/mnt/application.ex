defmodule Mnt.Application do
  use Application

  require Logger

  alias ElixirALE.GPIO

  @pin 18

  def start(_type, _args) do
    {:ok, self()}
  end

  def turn_on do
    Logger.info("Turning remote control ON")
    {:ok, pid} = GPIO.start_link(@pin, :output)
    GPIO.write(pid, 0)
  end

  def turn_off do
    Logger.info("Turning remote control OFF")
    {:ok, pid} = GPIO.start_link(@pin, :output)
    GPIO.write(pid, 1)
  end

  def loop do
    turn_on()
    Process.sleep(2_000)

    turn_off()
    Process.sleep(2_000)

    loop()
  end
end