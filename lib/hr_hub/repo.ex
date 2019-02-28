defmodule HrHub.Repo do
  use Ecto.Repo, 
    otp_app: :hr_hub,
    adapter: Ecto.Adapters.Postgres
end
