defmodule Cromer.MerchantTest do
  use Cromer.ModelCase

  alias Cromer.Merchant

  @valid_attrs %{username: "username", password: "12345678", password_confirmation: "12345678"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Merchant.changeset(%Merchant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Merchant.changeset(%Merchant{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "when password has less then 8 characters" do
    attributes = %{@valid_attrs | password: "1234567", password_confirmation: "1234567"}
    changeset = Merchant.changeset(%Merchant{}, attributes)
    refute changeset.valid?
  end

  test "when password and password confirmation are different" do
    attributes = %{@valid_attrs | password_confirmation: "12345677"}
    changeset = Merchant.changeset(%Merchant{}, attributes)
    refute changeset.valid?
  end
end
