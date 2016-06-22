defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbl

  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "Jason", username: "shorttompkins", password: "pass123"},
    %Rumbl.User{id: "2", name: "Dustin", username: "boudge", password: "pass456"},
    %Rumbl.User{id: "3", name: "Andrea", username: "polartennis", password: "pass678"}]
  end
  
  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
