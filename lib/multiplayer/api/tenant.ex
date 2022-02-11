defmodule Multiplayer.Api.Tenant do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tenants" do
    field(:name, :string)
    field(:external_id, :string)
    field(:jwt_secret, :string)
    field(:db_host, :string)
    field(:db_port, :string)
    field(:db_name, :string)
    field(:db_user, :string)
    field(:db_password, :string)
    field(:active, :boolean)
    has_many(:scopes, Multiplayer.Api.Scope)

    timestamps()
  end

  @doc false
  def changeset(tenant, attrs) do
    tenant
    |> cast(attrs, [
      :name,
      :external_id,
      :jwt_secret,
      :db_host,
      :db_port,
      :db_name,
      :db_user,
      :db_password
    ])
    |> validate_required([:name])
  end
end
