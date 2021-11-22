defmodule Discuss.Topic do
  use DiscussWeb, :model

  schema "topics" do
    field :title, :string
    belongs_to :user, Discuss.User
    has_many :comment, Discuss.Comment
  end

  @doc """
  ```struct``` <- is the data as seen in the database.
  ```params``` <- is the data changes we expect to see.
  ```cast(...) produces a changeset which takes us from where we are to where we need to be
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end

end
