defmodule Cromer.MerchantController do
  use Cromer.Web, :controller

  alias Cromer.Merchant

  plug :scrub_params, "merchant" when action in [:create, :update]

  def index(conn, _params) do
    merchants = Repo.all(Merchant)
    render(conn, "index.html", merchants: merchants)
  end

  def new(conn, _params) do
    changeset = Merchant.changeset(%Merchant{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"merchant" => merchant_params}) do
    changeset = Merchant.changeset(%Merchant{}, merchant_params)

    if changeset.valid? do
      Repo.insert!(changeset)

      conn
      |> put_flash(:info, "Merchant created successfully.")
      |> redirect(to: merchant_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    merchant = Repo.get!(Merchant, id)
    render(conn, "show.html", merchant: merchant)
  end

  def edit(conn, %{"id" => id}) do
    merchant = Repo.get!(Merchant, id)
    changeset = Merchant.changeset(merchant)
    render(conn, "edit.html", merchant: merchant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "merchant" => merchant_params}) do
    merchant = Repo.get!(Merchant, id)
    changeset = Merchant.changeset(merchant, merchant_params)

    if changeset.valid? do
      Repo.update!(changeset)

      conn
      |> put_flash(:info, "Merchant updated successfully.")
      |> redirect(to: merchant_path(conn, :index))
    else
      render(conn, "edit.html", merchant: merchant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    merchant = Repo.get!(Merchant, id)
    Repo.delete!(merchant)

    conn
    |> put_flash(:info, "Merchant deleted successfully.")
    |> redirect(to: merchant_path(conn, :index))
  end
end
