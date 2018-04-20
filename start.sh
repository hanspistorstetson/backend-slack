echo "Sleeping for 10s"
sleep 10s
echo "Starting server"
mix ecto.create && mix ecto.migrate && mix phx.server