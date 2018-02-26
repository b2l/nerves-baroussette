defmodule Mnt.Application do
  use Application

  require Logger

  alias ElixirALE.GPIO

  @pin 18

  def start(type, args) do
    Logger.info("=================")
    Logger.info("Starting MNT")
    Logger.info("type #{type}")
    Logger.info("=================")

    # {:ok, pid} = GPIO.start_link(@pin, :output)
    # loop(pid)
  end

  def turn_on do
    {:ok, pid} = GPIO.start_link(@pin, :output)
    GPIO.write(pid, 0)
  end

  def turn_off do
    {:ok, pid} = GPIO.start_link(@pin, :output)
    GPIO.write(pid, 1)
  end
end