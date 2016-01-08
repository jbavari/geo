defmodule Geo.JSON.Test do
  use ExUnit.Case, async: true

  test "Point to GeoJson Map" do
    geom = %Geo.Point{ coordinates: {100.0, 0.0} }
    json = Geo.JSON.encode(geom)

    assert json == %{ "type" => "Point", "coordinates" => [100.0, 0.0] }
  end

  test "Point to GeoJson" do
    geom = %Geo.Point{ coordinates: {100.0, 0.0} }
    json = Geo.JSON.encode(geom) |> Poison.encode!

    assert(json == "{\"type\":\"Point\",\"coordinates\":[100.0,0.0]}")
  end

  test "LineString to GeoJson" do
    geom = %Geo.LineString{ coordinates: [ {100.0, 0.0}, {101.0, 1.0} ] }
    json = Geo.JSON.encode(geom)|> Poison.encode!

    assert(json == "{\"type\":\"LineString\",\"coordinates\":[[100.0,0.0],[101.0,1.0]]}")
  end

  test "GeoJson to Point and back" do
    json = "{ \"type\": \"Point\", \"coordinates\": [100.0, 0.0] }"
    exjson = Poison.decode!(json)
    geom = Poison.decode!(json) |> Geo.JSON.decode

    assert(geom.coordinates == {100.0, 0.0})

    new_exjson = Geo.JSON.encode(geom)
    assert(exjson == new_exjson)
  end

  test "GeoJson to LineString and back" do
    json = "{ \"type\": \"LineString\", \"coordinates\": [ [100.0, 0.0], [101.0, 1.0] ]}"
    exjson = Poison.decode!(json)
    geom = Poison.decode!(json) |> Geo.JSON.decode

    assert(geom.coordinates == [ {100.0, 0.0}, {101.0, 1.0} ])
    new_exjson = Geo.JSON.encode(geom)
    assert(exjson == new_exjson)
  end

  test "GeoJson to Polygon and back" do
    json = "{ \"type\": \"Polygon\", \"coordinates\": [[ [100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0] ]]}"
    exjson = Poison.decode!(json)
    geom = Poison.decode!(json) |> Geo.JSON.decode

    assert(geom.coordinates == [[ {100.0, 0.0}, {101.0, 0.0}, {101.0, 1.0}, {100.0, 1.0}, {100.0, 0.0} ]])
    new_exjson = Geo.JSON.encode(geom)
    assert(exjson == new_exjson)
  end

  test "GeoJson to Feature(Polygon) and Back" do
    json = ~s({"type":"Feature","properties":{},"geometry":{"type":"Polygon","coordinates":[[[129.75,-87.1875],[129.5625,-100.8125],[139.625,-100.9375],[140.3125,-87.0625],[139.875,-82.1875],[131.0625,-82.5625],[129.75,-87.1875]]]}})
    exjson = Poison.decode!(json)
    geom = Poison.decode!(json) |> Geo.JSON.decode

    assert(geom.geometry.coordinates == [[ {129.75,-87.1875}, {129.5625,-100.8125},{139.625,-100.9375},{140.3125,-87.0625},{139.875,-82.1875},{131.0625,-82.5625},{129.75,-87.1875}]])
    new_exjson = Geo.JSON.encode(geom)
    assert(exjson == new_exjson)
  end

  test "GeoJson to Feature(Point) and Back" do
    json = ~s({"type":"Feature","properties":{},"geometry":{"type":"Point","coordinates":[129.75,-87.1875]}})
    exjson = Poison.decode!(json)
    geom = Poison.decode!(json) |> Geo.JSON.decode

    assert(geom.geometry.coordinates == {129.75,-87.1875})
    new_exjson = Geo.JSON.encode(geom)
    assert(exjson == new_exjson)
  end

  test "GeoJson to Feature(LineString) and Back" do
    json = ~s({"type":"Feature","properties":{},"geometry":{"type":"LineString","coordinates":[[129.75,-87.1875], [129.75,-87.1875]]}})
    exjson = Poison.decode!(json)
    geom = Poison.decode!(json) |> Geo.JSON.decode

    assert(geom.geometry.coordinates == [{129.75,-87.1875}, {129.75,-87.1875}])
    new_exjson = Geo.JSON.encode(geom)
    assert(exjson == new_exjson)
  end

  test "GeoJson to MultiPoint and back" do
    json = "{ \"type\": \"MultiPoint\", \"coordinates\": [ [100.0, 0.0], [101.0, 1.0] ]}"
    exjson = Poison.decode!(json)
    geom = Poison.decode!(json) |> Geo.JSON.decode

    assert(geom.coordinates == [ {100.0, 0.0}, {101.0, 1.0} ])
    new_exjson = Geo.JSON.encode(geom)
    assert(exjson == new_exjson)
  end

  test "GeoJson to MultiLineString and back" do
    json = "{ \"type\": \"MultiLineString\", \"coordinates\": [[ [100.0, 0.0], [101.0, 1.0] ],[ [102.0, 2.0], [103.0, 3.0] ]]}"
    exjson = Poison.decode!(json)
    geom = Poison.decode!(json) |> Geo.JSON.decode

    assert(geom.coordinates == [[ {100.0, 0.0}, {101.0, 1.0} ],[ {102.0, 2.0}, {103.0, 3.0} ]])
    new_exjson = Geo.JSON.encode(geom)
    assert(exjson == new_exjson)
  end

  test "GeoJson to MultiPolygon and back" do
    json = "{ \"type\": \"MultiPolygon\", \"coordinates\": [[[[102.0, 2.0], [103.0, 2.0], [103.0, 3.0], [102.0, 3.0], [102.0, 2.0]]],[[[100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0]],[[100.2, 0.2], [100.8, 0.2], [100.8, 0.8], [100.2, 0.8], [100.2, 0.2]]]]}"
    exjson = Poison.decode!(json)
    geom = Poison.decode!(json) |> Geo.JSON.decode

    assert(geom.coordinates == [[[{102.0, 2.0}, {103.0, 2.0}, {103.0, 3.0}, {102.0, 3.0}, {102.0, 2.0}]], [[{100.0, 0.0}, {101.0, 0.0}, {101.0, 1.0}, {100.0, 1.0}, {100.0, 0.0}],[{100.2, 0.2}, {100.8, 0.2}, {100.8, 0.8}, {100.2, 0.8}, {100.2, 0.2}]]])
    new_exjson = Geo.JSON.encode(geom)
    assert(exjson == new_exjson)
  end

  test "GeoJson to GeometryCollection and back" do
    json = "{ \"type\": \"GeometryCollection\",\"geometries\": [{ \"type\": \"Point\", \"coordinates\": [100.0, 0.0]},{ \"type\": \"LineString\",\"coordinates\": [ [101.0, 0.0], [102.0, 1.0] ]}]}"
    exjson = Poison.decode!(json)
    geom = Poison.decode!(json) |> Geo.JSON.decode

    assert(Enum.count(geom.geometries) == 2)

    new_exjson = Geo.JSON.encode(geom)
    assert(exjson == new_exjson)
  end

end
