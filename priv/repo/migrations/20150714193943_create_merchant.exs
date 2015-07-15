defmodule Cromer.Repo.Migrations.CreateMerchant do
  use Ecto.Migration

  def change do
    create table(:merchants) do
      add :username, :string
      add :encrypted_password, :string

      timestamps
    end

  end
end
