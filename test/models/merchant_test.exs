defmodule Cromer.MerchantTest do
  use Cromer.ModelCase

  alias Cromer.Merchant

  @valid_attrs %{username: "some content", password: "some content", password_confirmation: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Merchant.changeset(%Merchant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Merchant.changeset(%Merchant{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "password must have at least 8 characters" do
    changeset = Merchant.changeset(%Merchant{}, Dict.put(@valid_attrs, :password, "1234567"))
    refute changeset.valid?
  end

  test "password must have at least 8 characters" do
    changeset = Merchant.changeset(%Merchant{}, Dict.put(@valid_attrs, :password, "123495678"))
    assert changeset.valid?
  end
end
