defmodule Tasker.Items.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasker.Items.Task


  schema "tasks" do
    field :assignee, :integer, default: 0
    field :completed, :boolean, default: false
    field :description, :string
    field :time_spent, :integer, default: 0
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :assignee, :completed, :time_spent])
    |> validate_required([:title, :description, :assignee, :completed, :time_spent])
  end
end
