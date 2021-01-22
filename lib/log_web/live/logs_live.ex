defmodule LogWeb.LogsLive do
  use LogWeb, :live_view

  def mount(_, _, socket) do
    if connected?(socket) do
      pid = self()

      Tail.start_link("/home/emir/Documents/projects/rails-stimulus/log/development.log", fn data -> send(pid, {:new_log, data}) end)
    end

    socket = assign(socket, :logs, [])
    socket = assign(socket, :last_id, 1)

    {:ok, socket, temporary_assigns: [logs: []]}
  end

  def handle_info({:new_log, data}, socket) do
    entries = data
      |> Enum.with_index(socket.assigns.last_id)

    socket = assign(socket, :logs, entries)
    socket = assign(socket, :last_id, socket.assigns.last_id + Enum.count(data))

    {:noreply, socket}
  end
end
