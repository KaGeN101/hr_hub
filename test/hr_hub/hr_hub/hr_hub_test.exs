defmodule HrHub.HrHubTest do
  use HrHub.DataCase

  alias HrHub.HrHub

  describe "employees" do
    alias HrHub.HrHub.Employee

    @valid_attrs %{annual_salary: 42, first_name: "some first_name", last_name: "some last_name", payment_start_date: ~D[2010-04-17], pension_contribution: 42}
    @update_attrs %{annual_salary: 43, first_name: "some updated first_name", last_name: "some updated last_name", payment_start_date: ~D[2011-05-18], pension_contribution: 43}
    @invalid_attrs %{annual_salary: nil, first_name: nil, last_name: nil, payment_start_date: nil, pension_contribution: nil}

    def employee_fixture(attrs \\ %{}) do
      {:ok, employee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HrHub.create_employee()

      employee
    end

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert HrHub.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert HrHub.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      assert {:ok, %Employee{} = employee} = HrHub.create_employee(@valid_attrs)
      assert employee.annual_salary == 42
      assert employee.first_name == "some first_name"
      assert employee.last_name == "some last_name"
      assert employee.payment_start_date == ~D[2010-04-17]
      assert employee.pension_contribution == 42
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HrHub.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{} = employee} = HrHub.update_employee(employee, @update_attrs)
      assert employee.annual_salary == 43
      assert employee.first_name == "some updated first_name"
      assert employee.last_name == "some updated last_name"
      assert employee.payment_start_date == ~D[2011-05-18]
      assert employee.pension_contribution == 43
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = HrHub.update_employee(employee, @invalid_attrs)
      assert employee == HrHub.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = HrHub.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> HrHub.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = HrHub.change_employee(employee)
    end
  end
end
