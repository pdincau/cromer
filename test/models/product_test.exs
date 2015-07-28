defmodule Cromer.ProductTest do
  use Cromer.ModelCase

  alias Cromer.Product

  @valid_attrs %{body: "some content", title: "some content", price: 0}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with not valid price" do
    attributes = %{@valid_attrs | price: -1}
    changeset = Product.changeset(%Product{}, attributes)
    refute changeset.valid?
  end
end
