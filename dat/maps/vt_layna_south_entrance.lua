-- Valyria Tear map editor begin. Do not edit this line or put anything before this line. --

-- Set the namespace according to the map name.
local ns = {};
setmetatable(ns, {__index = _G});
vt_layna_south_entrance = ns;
setfenv(1, ns);

-- A reference to the C++ MapMode object that was created with this file
map = {}

-- The map name and location image
map_name = "Mountain Village of Layna"
map_subname = "Village entrance"
map_image_filename = "img/menus/locations/mountain_village.png"

-- The number of rows, and columns that compose the map
num_tile_cols = 32
num_tile_rows = 24


-- The contexts names and inheritance definition
-- Tells the context id the current context inherit from
-- This means that the parent context will be used as a base, and the current
-- context will only have its own differences from it.
-- At least, the base context (id:0) can't a parent context, thus it should be equal to -1.
-- Note that a context cannot inherit from itself or a context with a higher id
-- since it would lead to nasty and useless loading use cases.
contexts = {}
contexts[0] = {}
contexts[0].name = "Base"
contexts[0].inherit_from = -1

-- The sound files used on this map.
sound_filenames = {}

-- The music files used as background music on this map.
music_filenames = {}
music_filenames[1] = "mus/Caketown_1-OGA-mat-pablo.ogg"

-- The names of the tilesets used, with the path and file extension omitted
tileset_filenames = {}
tileset_filenames[1] = "mountain_house_exterior"
tileset_filenames[2] = "mountain_house_exterior2"
tileset_filenames[3] = "mountain_landscape"
tileset_filenames[4] = "water_tileset"
tileset_filenames[5] = "harrvah_house_exterior"

-- The map grid to indicate walkability. The size of the grid is 4x the size of the tile layer tables
-- Walkability status of tiles for 32 contexts. Zero indicates walkable for all contexts. Valid range: [0:2^32-1]
-- Example: 1 (BIN 001) = wall for first context only, 2 (BIN 010) means wall for second context only, 5 (BIN 101) means Wall for first and third context.
map_grid = {}
map_grid[0] = { 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[1] = { 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0 }
map_grid[2] = { 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[3] = { 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }
map_grid[4] = { 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[5] = { 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[6] = { 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[7] = { 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }
map_grid[8] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }
map_grid[9] = { 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }
map_grid[10] = { 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }
map_grid[11] = { 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[12] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[13] = { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }
map_grid[14] = { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[15] = { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[16] = { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[17] = { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1 }
map_grid[18] = { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[19] = { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[20] = { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[21] = { 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1 }
map_grid[22] = { 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[23] = { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[24] = { 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[25] = { 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1 }
map_grid[26] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[27] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0 }
map_grid[28] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[29] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[30] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[31] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[32] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[33] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }
map_grid[34] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }
map_grid[35] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }
map_grid[36] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }
map_grid[37] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[38] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[39] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }
map_grid[40] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 }
map_grid[41] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0 }
map_grid[42] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[43] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[44] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[45] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 }
map_grid[46] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 }
map_grid[47] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }

-- The tile layers. The numbers are indeces to the tile_mappings table.
layers = {}
layers[0] = {}
layers[0].type = "ground"
layers[0].name = "Background"
layers[0][0] = { 591, 590, 591, 606, 590, 607, 591, 606, 606, 591, 607, 590, 606, 606, 607, 591, 607, 606, 591, 591, 607, 591, 607, 591, 607, 606, 590, 607, 606, 606, 607, 607 }
layers[0][1] = { 607, 607, 591, 607, 591, 606, 591, 590, 607, 590, 591, 606, 606, 607, 591, 606, 591, 607, 591, 607, 607, 590, 590, 590, 607, 591, 590, 591, 606, 590, 606, 607 }
layers[0][2] = { 591, 591, 607, 606, 591, 607, 590, 590, 590, 606, 606, 591, 591, 606, 606, 607, 591, 591, 590, 590, 607, 590, 606, 607, 607, 606, 607, 590, 590, 591, 591, 607 }
layers[0][3] = { 590, 606, 591, 591, 607, 607, 590, 606, 591, 590, 606, 591, 591, 591, 590, 606, 607, 606, 591, 607, 590, 607, 590, 590, 606, 590, 607, 590, 591, 590, 607, 590 }
layers[0][4] = { 591, 590, 591, 591, 590, 590, 607, 606, 590, 606, 607, 606, 607, 607, 591, 591, 590, 606, 591, 607, 591, 590, 590, 590, 591, 607, 590, 606, 591, 607, 591, 606 }
layers[0][5] = { 606, 606, 591, 591, 607, 591, 607, 591, 606, 607, 590, 590, 607, 607, 590, 606, 607, 607, 607, 590, 590, 591, 606, 590, 607, 607, 590, 606, 590, 591, 607, 590 }
layers[0][6] = { 607, 591, 590, 590, 607, 606, 606, 591, 606, 607, 590, 607, 606, 607, 590, 607, 607, 607, 607, 591, 606, 607, 590, 607, 590, 606, 606, 606, 606, 606, 590, 591 }
layers[0][7] = { 590, 591, 591, 591, 591, 607, 606, 591, 606, 590, 590, 607, 606, 607, 607, 606, 606, 607, 606, 591, 607, 606, 591, 590, 590, 590, 591, 607, 591, 590, 590, 607 }
layers[0][8] = { 607, 591, 607, 591, 606, 590, 607, 607, 591, 606, 606, 607, 591, 606, 607, 590, 591, 607, 590, 590, 606, 590, 606, 607, 607, 590, 590, 0, 590, 590, 591, 606 }
layers[0][9] = { 590, 591, 591, 591, 591, 607, 590, 607, 591, 591, 607, 591, 607, 591, 607, 607, 607, 606, 607, 590, 607, 606, 591, 607, 590, 591, 606, 607, 606, 607, 607, 591 }
layers[0][10] = { 590, 591, 607, 591, 606, 590, 607, 607, 591, 606, 590, 591, 607, 591, 590, 591, 591, 591, 590, 590, 591, 606, 607, 591, 606, 606, 606, 590, 606, 607, 607, 590 }
layers[0][11] = { 591, 607, 590, 590, 607, 606, 607, 591, 590, 590, 590, 590, 591, 606, 590, 607, 606, 606, 607, 607, 607, 591, 590, 607, 606, 606, 607, 606, 591, 590, 607, 590 }
layers[0][12] = { 607, 590, 591, 606, 606, 590, 607, 607, 590, 591, 606, 591, 606, 607, 606, 606, 590, 590, 607, 590, 607, 591, 607, 607, 591, 590, 607, 591, 606, 606, 590, 606 }
layers[0][13] = { 591, 606, 591, 590, 606, 606, 591, 591, 591, 606, 590, 590, 606, 606, 607, 607, 590, 606, 591, 607, 607, 606, 606, 607, 606, 606, 591, 591, 590, 591, 590, 607 }
layers[0][14] = { 591, 591, 607, 591, 606, 591, 607, 606, 590, 591, 607, 591, 607, 606, 606, 590, 590, 590, 590, 590, 590, 606, 606, 607, 606, 606, 591, 591, 607, 590, 590, 607 }
layers[0][15] = { 606, 607, 591, 590, 591, 607, 590, 606, 591, 606, 591, 607, 606, 607, 607, 590, 607, 591, 606, 607, 606, 606, 607, 606, 606, 607, 607, 606, 591, 590, 607, 590 }
layers[0][16] = { 606, 590, 606, 590, 606, 590, 606, 591, 606, 607, 607, 591, 607, 606, 606, 591, 607, 606, 590, 607, 606, 590, 606, 590, 607, 590, 606, 591, 606, 606, 591, 590 }
layers[0][17] = { 591, 606, 591, 591, 591, 590, 607, 606, 607, 607, 590, 607, 606, 606, 591, 606, 591, 606, 591, 607, 591, 607, 607, 590, 590, 607, 591, 606, 606, 607, 607, 607 }
layers[0][18] = { 606, 606, 590, 590, 606, 590, 606, 591, 591, 607, 606, 606, 606, 590, 591, 606, 591, 590, 591, 607, 591, 607, 591, 607, 590, 606, 607, 606, 606, 591, 590, 606 }
layers[0][19] = { 590, 606, 590, 607, 606, 591, 591, 590, 606, 606, 607, 606, 590, 591, 607, 590, 607, 591, 607, 590, 607, 606, 607, 590, 591, 590, 590, 606, 590, 590, 590, 606 }
layers[0][20] = { 591, 591, 606, 591, 606, 590, 606, 590, 590, 591, 606, 606, 606, 607, 590, 591, 606, 606, 606, 607, 591, 606, 606, 606, 590, 606, 607, 607, 591, 591, 590, 607 }
layers[0][21] = { 606, 590, 606, 590, 606, 606, 590, 607, 607, 607, 591, 606, 607, 607, 606, 590, 590, 590, 606, 607, 590, 606, 607, 590, 606, 607, 606, 590, 590, 590, 607, 606 }
layers[0][22] = { 590, 607, 606, 606, 591, 606, 606, 590, 606, 591, 590, 590, 607, 590, 590, 607, 607, 606, 591, 606, 591, 590, 606, 606, 606, 590, 607, 591, 607, 607, 590, 606 }
layers[0][23] = { 591, 591, 606, 591, 607, 607, 590, 607, 606, 606, 591, 590, 590, 607, 590, 607, 590, 591, 590, 590, 606, 590, 607, 606, 590, 590, 591, 591, 591, 591, 607, 606 }

layers[1] = {}
layers[1].type = "ground"
layers[1].name = "Background 2"
layers[1][0] = { 529, 530, 531, 532, 533, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 528, 529 }
layers[1][1] = { 545, 546, 547, 548, 549, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 576, 577 }
layers[1][2] = { 561, 562, 563, 564, 565, -1, -1, -1, -1, -1, -1, -1, -1, -1, 523, 524, 525, -1, -1, -1, -1, -1, -1, -1, -1, 523, 524, 525, -1, -1, 560, 561 }
layers[1][3] = { 577, 578, 579, 580, 581, -1, -1, -1, -1, -1, -1, -1, -1, -1, 539, 540, 541, -1, -1, -1, -1, -1, -1, -1, -1, 539, 540, 541, -1, -1, 576, 577 }
layers[1][4] = { 593, 594, 595, 596, 597, -1, -1, -1, -1, -1, -1, -1, -1, -1, 555, 556, 557, -1, -1, -1, -1, -1, -1, -1, -1, 555, 556, 557, -1, -1, 592, 593 }
layers[1][5] = { 609, 610, 611, 612, 613, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 608, 609 }
layers[1][6] = { 515, 516, 517, -1, -1, -1, 33, 34, 35, 36, 37, 38, 39, 40, -1, -1, 523, 524, 525, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 756 }
layers[1][7] = { 531, 532, 533, -1, -1, -1, 49, 50, 51, 52, 53, 54, 55, 56, -1, -1, 539, 540, 541, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 740 }
layers[1][8] = { 547, 548, 549, -1, -1, -1, 33, 34, 35, 36, 37, 38, 39, 40, -1, -1, 555, 556, 557, -1, 33, 34, 35, 36, 37, 38, 39, 40, -1, -1, -1, 756 }
layers[1][9] = { 563, 564, 565, -1, -1, -1, 49, 50, 51, 52, 53, 54, 55, 56, -1, -1, -1, -1, -1, -1, 49, 50, 51, 52, 53, 54, 55, 56, -1, -1, -1, 740 }
layers[1][10] = { 584, 585, 581, -1, -1, -1, 65, 66, 67, 68, 69, 70, 71, 72, -1, -1, -1, -1, -1, -1, 65, 66, 67, 68, 69, 70, 71, 72, -1, -1, -1, 756 }
layers[1][11] = { 600, 601, 597, -1, -1, -1, 161, 162, 163, 14, 15, 166, 167, 168, -1, -1, -1, -1, -1, -1, 161, 162, 163, 164, 165, 166, 167, 168, -1, -1, -1, 740 }
layers[1][12] = { 616, 617, -1, -1, -1, -1, 177, 178, 179, 180, 181, 182, 183, 184, -1, -1, -1, -1, -1, -1, 177, 178, 179, 180, 181, 182, 183, 184, -1, -1, 512, 756 }
layers[1][13] = { -1, -1, -1, -1, -1, -1, 193, 194, 195, 46, 47, 198, 199, 200, -1, -1, -1, -1, -1, -1, 193, 194, 195, 46, 47, 198, 199, 200, -1, -1, 528, 529 }
layers[1][14] = { -1, -1, -1, -1, -1, -1, 209, 210, 211, 62, 63, 214, 215, 216, -1, -1, -1, -1, -1, -1, 209, 210, 211, 62, 63, 214, 215, 216, -1, -1, 544, 545 }
layers[1][15] = { -1, 523, 524, 524, 525, -1, 225, 226, 227, 78, 79, 230, 231, 232, -1, -1, -1, -1, -1, -1, 225, 226, 227, 78, 79, 230, 231, 232, -1, -1, 560, 561 }
layers[1][16] = { 523, 622, 540, 540, 541, -1, 241, 242, 243, 94, 95, 246, 247, 248, -1, -1, -1, -1, -1, -1, 241, 242, 243, 94, 95, 246, 247, 248, -1, -1, 576, 577 }
layers[1][17] = { 539, 540, 540, 639, 557, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 592, 593 }
layers[1][18] = { 555, 638, 540, 541, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 608, 609 }
layers[1][19] = { -1, 555, 556, 557, -1, -1, -1, -1, -1, -1, -1, 317, -1, -1, -1, -1, 480, -1, -1, -1, -1, 485, -1, -1, -1, -1, 286, -1, -1, -1, 512, 513 }
layers[1][20] = { -1, -1, -1, 316, -1, 316, -1, 315, -1, -1, -1, 333, 398, 347, 398, 302, 496, 523, 524, 524, 525, 501, 302, 398, 347, 398, 302, -1, -1, -1, 528, 529 }
layers[1][21] = { -1, -1, 364, 332, 364, 332, 364, 331, 364, 382, -1, 380, -1, -1, -1, -1, 523, 622, 554, 522, 623, 525, -1, -1, -1, -1, -1, -1, -1, -1, 544, 545 }
layers[1][22] = { 379, 442, 380, 348, 380, 348, 380, 347, 380, 398, 443, -1, -1, -1, -1, 523, 622, 571, 572, 572, 573, 623, 525, -1, -1, -1, 380, -1, -1, -1, 427, 561 }
layers[1][23] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 539, 571, 558, 527, 526, 559, 573, 541, -1, -1, -1, 302, 380, 398, 380, 398, 577 }

layers[2] = {}
layers[2].type = "ground"
layers[2].name = "Background 3"
layers[2][0] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][1] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 544, 545 }
layers[2][2] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][3] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][4] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 708 }
layers[2][5] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 724 }
layers[2][6] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 724 }
layers[2][7] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 708 }
layers[2][8] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 724 }
layers[2][9] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 708 }
layers[2][10] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 724 }
layers[2][11] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][12] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][13] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][14] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, 110, 111, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 110, 111, -1, -1, -1, -1, -1, -1, -1 }
layers[2][15] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, 126, 127, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 126, 127, -1, -1, -1, -1, -1, -1, -1 }
layers[2][16] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, 142, 143, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 142, 143, -1, -1, -1, -1, -1, -1, -1 }
layers[2][17] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][18] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][19] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][20] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 763, 763, 763, 763, -1, -1, -1, -1, -1, 429, -1, -1, -1, -1, -1 }
layers[2][21] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 287, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 428, -1, -1, -1, -1, -1 }
layers[2][22] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 303, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 560, -1 }
layers[2][23] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 576, -1 }

layers[3] = {}
layers[3].type = "sky"
layers[3].name = "Sky"
layers[3][0] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][1] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][2] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][3] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][4] = { -1, -1, -1, -1, -1, -1, 1, 2, 3, 4, 5, 6, 7, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][5] = { -1, -1, -1, -1, -1, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][6] = { -1, -1, -1, -1, -1, 32, -1, -1, -1, -1, -1, -1, -1, -1, 41, -1, -1, -1, -1, -1, 1, 2, 3, 4, 5, 6, 7, 8, -1, -1, -1, -1 }
layers[3][7] = { -1, -1, -1, -1, -1, 48, -1, -1, -1, -1, -1, -1, -1, -1, 57, -1, -1, -1, -1, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1 }
layers[3][8] = { -1, -1, -1, -1, -1, 64, -1, -1, -1, -1, -1, -1, -1, -1, 73, -1, -1, -1, -1, 32, -1, -1, -1, -1, -1, -1, -1, -1, 41, -1, -1, -1 }
layers[3][9] = { -1, -1, -1, -1, -1, 80, -1, -1, -1, -1, -1, -1, -1, -1, 89, -1, -1, -1, -1, 48, -1, -1, -1, -1, -1, -1, -1, -1, 57, -1, -1, -1 }
layers[3][10] = { -1, -1, -1, -1, -1, 96, -1, -1, -1, -1, -1, -1, -1, -1, 89, -1, -1, -1, -1, 64, -1, -1, -1, -1, -1, -1, -1, -1, 73, -1, -1, -1 }
layers[3][11] = { -1, -1, -1, -1, -1, 160, -1, -1, -1, -1, -1, -1, -1, -1, 169, -1, -1, -1, -1, 80, -1, -1, -1, -1, -1, -1, -1, -1, 89, -1, -1, -1 }
layers[3][12] = { -1, -1, -1, -1, -1, 176, -1, -1, -1, -1, -1, -1, -1, -1, 185, -1, -1, -1, -1, 96, -1, -1, -1, -1, -1, -1, -1, -1, 185, -1, -1, -1 }
layers[3][13] = { -1, -1, -1, -1, -1, 192, -1, -1, -1, -1, -1, -1, -1, -1, 201, -1, -1, -1, -1, 192, -1, -1, -1, -1, -1, -1, -1, -1, 201, -1, -1, -1 }
layers[3][14] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 217, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 217, -1, -1, -1 }
layers[3][15] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][16] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 432, -1, -1, -1, -1, 437, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][17] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 448, 449, 450, 451, 452, 453, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][18] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 366, 315, 366, -1, 464, -1, -1, -1, -1, 469, -1, 366, 316, 366, -1, -1, -1, -1, -1, -1 }
layers[3][19] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 317, 382, 331, 382, 286, -1, 747, 747, 747, 747, -1, 286, 382, 332, 382, 286, -1, -1, -1, -1, -1 }
layers[3][20] = { -1, 458, -1, 316, -1, 316, -1, 315, -1, 366, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 412, -1, -1, -1, -1, -1 }
layers[3][21] = { 363, 426, 364, 332, 364, 332, 364, 331, 364, 382, 427, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 366, -1, -1, -1 }
layers[3][22] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 286, 364, 382, 364, -1, -1 }
layers[3][23] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }

layers[4] = {}
layers[4].type = "sky"
layers[4].name = "sky2"
layers[4][0] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][1] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][2] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][3] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][4] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][5] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][6] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][7] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][8] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][9] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][10] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][11] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][12] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][13] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][14] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][15] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 236, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][16] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 236, 237, 238, 239, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][17] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 252, 253, 254, 255, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][18] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][19] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 413, -1, -1, -1, -1, -1 }
layers[4][20] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][21] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][22] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[4][23] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }


-- Valyria Tear map editor end. Do not edit this line. Place your scripts after this line. --

local bronann = {};

-- the main map loading code
function Load(m)

	Map = m;
	ObjectManager = Map.object_supervisor;
	DialogueManager = Map.dialogue_supervisor;
	EventManager = Map.event_supervisor;
	TreasureManager = Map.treasure_supervisor;
	GlobalEvents = Map.map_event_group;

	Map.unlimited_stamina = true;

	CreateCharacters();
	-- Set the camera focus on Bronann
	Map:SetCamera(bronann);

	CreateNPCs();
	CreateObjects();


	CreateEvents();
	CreateZones();
end

function Update()
	-- Check whether the character is in one of the zones
	CheckZones();
end


-- Character creation
function CreateCharacters()
	bronann = _CreateSprite(Map, "Bronann", 32, 4);
	bronann:SetDirection(hoa_map.MapMode.SOUTH);
	bronann:SetMovementSpeed(hoa_map.MapMode.NORMAL_SPEED);
	bronann:SetNoCollision(false);

	-- set up the position according to the previous map
	if (GlobalManager:GetPreviousLocation() == "from_riverbank") then
		bronann:SetPosition(3, 34);
		bronann:SetDirection(hoa_map.MapMode.EAST);
	end

	Map:AddGroundObject(bronann);
end

function CreateNPCs()
	local npc = {}
	local text = {}
	local dialogue = {}
	local event = {}

end

function CreateObjects()
	local object = {}
--[[
	object = _CreateObject(Map, "Tree Big2", 22, 78);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Tree Small1", 22, 16);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Tree Big1", 9, 16);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Tree Big1", 65, 18);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Tree Big2", 74, 20);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Tree Big1", 67, 32);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Tree Big2", 80, 36);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Tree Small1", 92, 22);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Tree Big2", 98, 24);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Tree Small2", 79, 16);
	if (object ~= nil) then Map:AddGroundObject(object) end;

	object = _CreateObject(Map, "Rock1", 3, 64);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Rock1", 33, 12);
	if (object ~= nil) then Map:AddGroundObject(object) end;

	object = _CreateObject(Map, "Rock2", 29, 16);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Rock2", 109, 34);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Rock2", 113, 34);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Rock2", 117, 34);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Rock2", 109, 42);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Rock2", 117, 42);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = _CreateObject(Map, "Rock2", 113, 42);
	if (object ~= nil) then Map:AddGroundObject(object) end;
]]--
end

-- Creates all events and sets up the entire event sequence chain
function CreateEvents()
	local event = {};

	-- Triggered Events
	event = hoa_map.MapTransitionEvent("to Village center", "dat/maps/vt_layna_center.lua", "from_village_south");
	EventManager:RegisterEvent(event);

	event = hoa_map.MapTransitionEvent("to Village riverbank", "dat/maps/vt_layna_riverbank.lua", "from_village_south");
	EventManager:RegisterEvent(event);
end

function CreateZones()
	-- N.B.: left, right, top, bottom
	village_center_zone = hoa_map.CameraZone(8, 62, 0, 2, hoa_map.MapMode.CONTEXT_01);
	Map:AddZone(village_center_zone);

	to_village_riverbank_zone = hoa_map.CameraZone(0, 1, 26, 43, hoa_map.MapMode.CONTEXT_01);
	Map:AddZone(to_village_riverbank_zone);
end

function CheckZones()
	if (village_center_zone:IsCameraEntering() == true) then
		-- Stop the character as it may walk in diagonal, which is looking strange
		-- when entering
		bronann:SetMoving(false);
		EventManager:StartEvent("to Village center");
	end

	if (to_village_riverbank_zone:IsCameraEntering() == true) then
		-- Stop the character as it may walk in diagonal, which is looking strange
		-- when entering
		bronann:SetMoving(false);
		EventManager:StartEvent("to Village riverbank");
	end
end


-- Map Custom functions
if (map_functions == nil) then
	map_functions = {}
end

