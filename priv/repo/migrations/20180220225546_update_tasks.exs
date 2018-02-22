defmodule Tasker.Repo.Migrations.UpdateTasks do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      modify :assignee, :integer, default: 0
      modify :time_spent, :integer, default: 0
    end

  end
end
