defmodule Tasker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :description, :text
      add :assignee, :integer
      add :completed, :boolean, default: false, null: false
      add :time_spent, :integer

      timestamps()
    end

  end
end
