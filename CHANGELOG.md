# v1.0.0

# v0.18.0
* Enhancements
  * Made Postgrex, Ecto, and Poison optional dependencies

# v0.17.0
* Breaking
  * Geo.JSON.encode and Geo.JSON.decode now do not do any JSON parsing at all and
    instead work on a map representation of GeoJSON. All JSON encoding and decoding
    must be done before or after calling those functions.

# v0.16.1
* Enhancements
  * Made Postgrex a required dependency

# v0.16.0
* Enhancements
  * Updated to Ecto 1.0

# v0.15.2
* Enhancements
  * Added an `opts` parameter to `Geo.JSON.encode` to allow for skipping JSON encoding

# v0.15.1
* Enhancements
  * Fixed st_dwithin macro

# v0.15.0
* Enhancements
  * Updated cast function on structs to handle maps and strings
  * Now reading the srid from geo json

# v0.14.0
* Enhancements
  * Basic Support for Geography datatype

# v0.13.0

* Enhancements
  * Added PostGIS function macros for use in Ecto Queries. Currently only the OpenGIS ones

* Breaking
  * `Geo.PostGIS` is now `Geo.PostGIS.Extension`
  * Changed from Jazz to Poison for JSON encoding and decoding

# v0.12.0

* Enhancements
  * Geo.PostGIS is now a Postgrex Extension
  * Updated to work with latest version of Ecto

# v0.11.2

* Bug fixes
  * Correctly decoding WKB strings that caused invalid geometries to be produced when there is one element in a multi geometry

# v0.11.1

* Bug fixes
  * Fixed bug when decoding multi geometry wkb with one geometry inside would cause a crash

# v0.11.0

* Enhancements
  * Created structs for the supported geospatial types (Point, LineString, Polygon, MultiPoint, MultiLineString, MultiPolygon, GeometryCollection)
  * GeoJson module will encode the srid as a crs property if an srid exists

* Backwards incompatible changes
  * Removed the Geometry struct. Use one of the geometry type structs instead
  * The base coordinate pairs are now tuples ({0,0} instead of [0,0])
