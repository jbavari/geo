defmodule Geo.Feature do

  @moduledoc """
  Defines the Feature struct.
  """

  # {
  #   "type": "Feature",
  #   "geometry": {
  #     "type": "Point",
  #     "coordinates": [125.6, 10.1]
  #   },
  #   "properties": {
  #     "name": "Dinagat Islands"
  #   }
  # }

  # @type t :: %Geo.Feature{ type: type, properties: properties, geometry: geometry }
  # coordinates: {number, number}, srid: integer }
  # defstruct coordinates: {0, 0}, srid: nil
  defstruct type: "Feature", geometry: %{}, properties: %{}

  # if Code.ensure_loaded?(Ecto.Type) do
  #   @behaviour Ecto.Type

  #   def type, do: :geometry

  #   def blank?(_), do: false

  #   def load(%Geo.Point{} = point), do: {:ok, point}
  #   def load(_), do: :error

  #   def dump(%Geo.Point{} = point), do: {:ok, point}
  #   def dump(_), do: :error

  #   def cast(%Geo.Point{} = point), do: {:ok, point}
  #   def cast(point) when is_map(point), do: { :ok, Geo.JSON.decode(point) }

  #   if Code.ensure_loaded?(Poison) do
  #     def cast(point) when is_binary(point), do: { :ok, Poison.decode!(point) |> Geo.JSON.decode }
  #   end

  #   def cast(_), do: :error

  # end

end
