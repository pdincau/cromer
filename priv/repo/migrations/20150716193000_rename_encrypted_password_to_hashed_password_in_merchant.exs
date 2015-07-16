defmodule Cromer.Repo.Migrations.RenameEncryptedPasswordToHashedPasswordInMerchant do
  use Ecto.Migration

  def change do
    alter table(:merchants) do
      remove :encrypted_password

      add :hashed_password, :string
    end
  end
end
