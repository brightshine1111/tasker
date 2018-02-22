defmodule Tasker.ItemsTest do
  use Tasker.DataCase

  alias Tasker.Items

  describe "tasks" do
    alias Tasker.Items.Task

    @valid_attrs %{assignee: 42, completed: true, description: "some description", time_spent: 42, title: "some title"}
    @update_attrs %{assignee: 43, completed: false, description: "some updated description", time_spent: 43, title: "some updated title"}
    @invalid_attrs %{assignee: nil, completed: nil, description: nil, time_spent: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Items.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Items.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Items.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Items.create_task(@valid_attrs)
      assert task.assignee == 42
      assert task.completed == true
      assert task.description == "some description"
      assert task.time_spent == 42
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Items.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.assignee == 43
      assert task.completed == false
      assert task.description == "some updated description"
      assert task.time_spent == 43
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_task(task, @invalid_attrs)
      assert task == Items.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Items.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Items.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Items.change_task(task)
    end
  end
end
