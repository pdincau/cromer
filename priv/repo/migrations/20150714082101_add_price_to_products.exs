defmodule Cromer.Repo.Migrations.AddPriceToProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :price, :integer
    end
  end
end
