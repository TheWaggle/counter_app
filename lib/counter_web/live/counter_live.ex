defmodule CounterWeb.CounterLive do
  use CounterWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>This count is：<%= @value %></h1>
    <.button type="button">-</.button>
    <.button type="button">+</.button>
    """
  end

  # "/counter"のルートにアクセスがあった場合まずこのmountが呼ばれる
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :value, 0)}
  end
end
