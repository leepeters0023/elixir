defmodule SimpleServer.Application do

  use Application

  @impl true
  def start(_type, _args) do
    children = [
        Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: SimpleServer.Router, options: [port: 8000])
    ]
    opts = [strategy: :one_for_one, name: SimpleServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
