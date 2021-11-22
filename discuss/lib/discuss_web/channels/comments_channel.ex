defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  alias Discuss.Topic
  alias Discuss.Repo

  @impl true
  def join("comments:" <> topic_id, payload, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Repo.get(Topic, topic_id)
    if authorized?(payload) do
      {:ok, %{}, assign(socket, :topic, topic), socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in(name, %{"content" => content}, socket) do
    IO.puts(content)
    {:reply, :ok, socket}
  end

  defp authorized?(_payload) do
    true
  end
end
