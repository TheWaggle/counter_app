defmodule CounterWeb.CounterLive do
  use CounterWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>This count is：<%= @value %></h1>
    <.button type="button" phx-click="dec">-</.button>
    <.button type="button" phx-click="inc">+</.button>
    """
  end

  # "/counter"のルートにアクセスがあった場合まずこのmountが呼ばれる
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :value, 0)}
  end

  # <.button type="button" phx-click="inc">+</.button>のボタンが押された時に呼ばれるイベント
  def handle_event("inc", _params, socket) do
    socket =
      update(socket, :value, fn value ->
        value + 1
      end)

    {:noreply, socket}
  end

  # <.button type="button" phx-click="dec">-</.button>のボタンが押された時に呼ばれるイベント
  def handle_event("dec", _params, socket) do
    socket =
      update(socket, :value, fn value ->
        value - 1
      end)

    {:noreply, socket}
  end
end
