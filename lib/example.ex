defmodule Example do
  use Application
  # @x 10

  def start(_type, _args) do
    # Example.main()
    # Example.compoundTypes()
    # Example.tupleExample()
    mapExample()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    name = "Caleb"
    status = Enum.random([:bronze, :gold, :"not member"])

    case status do
      :gold -> IO.puts("Welcome to the fancy Lounge #{name}")
      :"not member" -> IO.puts("this is a string with \"double quotes\"")
      _ -> IO.puts("Get Lost Bruh")
    end
    IO.puts(Integer.gcd(10, 20))

    IO.puts("This \nis \na \nmessage")
    IO.puts("variable")

 end

 def compoundTypes do
  time = Time.new!(0, 0, 0, 0)
  date = Date.new!(2025, 1, 1)
  currentDate = DateTime.new!(date, time, "Etc/UTC")
  time_till = DateTime.diff(currentDate, DateTime.utc_now())

  days = div(time_till, 86400)
  hours = div(rem(time_till, 86400), 3600)
  mins = div(rem(time_till, 3600), 60)
  seconds = rem(time_till, 60)
  IO.puts("#{days} days, #{hours} hours, #{mins} minutes, #{seconds} seconds left ")

 end

 def tupleExample do
   memberships = {:gold, :silver}
   memberships = Tuple.append(memberships, :bronze)

   prices = {5, 10, 15}
   avg = Tuple.sum(prices) / tuple_size(prices)

   users = [
    {"caleb", :gold},
    {"dean", :silver},
    {"gabriel", :bronze}
   ]

   Enum.each(users, fn {name, membership} ->
    IO.puts("#{name} has a Membership of #{membership}.")
   end)

   IO.puts("The total average for #{elem(memberships, 0)}, #{elem(memberships, 1)} and #{elem(memberships, 2)} memberships is #{avg}")

  end

  def mapExample do
    gymMembers = %{
      gold: :gold,
      silver: :silver,
      bronze: :bronze
    }

    IO.puts(gymMembers.gold)
  end

end
