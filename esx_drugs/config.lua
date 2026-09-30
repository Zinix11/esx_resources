Config              = {}
Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 5.0, y = 5.0, z = 3.0}
Config.MarkerColor  = {r = 100, g = 204, b = 100}
Config.RequiredCopsEcstasy = 0
Config.Locale = 'en'

Config.RequiredCopsCoke  = 2
Config.RequiredCopsMeth  = 2
Config.RequiredCopsOpium = 3
Config.RequiredCopsWeed  = 0

-- Zones
Config.Zones = {
    -- Cocaine Zones
    CokeField =			{x = 2448.92,	y = -1836.80,	z = 51.95,	},
    CokeField2 =		{x = 2448.92,	y = -1836.80,	z = 51.95,	},
    CokeBrick =	        {x = -458.13,	y = -2278.61,	z = 7.51,	},
    CokePowder =	    {x = -458.13,	y = -2278.61,	z = 7.51,	},
    CokeCrack =	        {x = -458.13,	y = -2278.61,	z = 7.51,	},
    CokeDealer =		{x = -1756.19,	y = 427.31,		z =126.68,	},
    CokeStreetDealer =  {x = -1756.19,	y = 427.31,		z =126.68,	},
    -- Meth Zones
    MethField =			{x = 1525.29,	y = 1710.02,	z = 109.00,	},
    MethField2 =		{x = 1525.29,	y = 1710.02,	z = 109.00,	},
    MethBrick =	        {x = -1001.41,	y = 4848.00,	z = 274.00,	},
    MethSpeed =	        {x = -1001.41,	y = 4848.00,	z = 274.00,	},
    MethIce =	        {x = -1001.41,	y = 4848.00,	z = 274.00,	},
    MethDealer =		{x = -63.59,	y = -1224.07,	z = 27.76,	},
    MethStreetDealer =	{x = -63.59,	y = -1224.07,	z = 27.76,	},
    -- Opium Zones
    OpiumField =		{x = 1972.78,	y = 3819.39,	z = 32.50,	},
    OpiumField2 =		{x = 1972.78,	y = 3819.39,	z = 32.50,	},
    OpiumBrick =	    {x = 971.86,	y = -2157.00,	z = 28.47,	},
    OpiumPowder =	    {x = 971.86,	y = -2157.00,	z = 28.47,	},
    OpiumHeroin =	    {x = 971.86,	y = -2157.00,	z = 28.47,	},
    OpiumDealer =		{x = 2331.08,	y = 2570.22,	z = 46.68,	},
    OpiumStreetDealer =	{x = 2331.08,	y = 2570.22,	z = 46.68,	},
    -- Cannabis Zones
    WeedField =			{x = 2221.85,	y = 5577.04,	z = 51.84,	},
    WeedField2 =		{x = 2221.85,	y = 5577.04,	z = 51.84,	},
    WeedBrick =	        {x = 91.06,		y = 3750.03,	z = 39.77,	},
    WeedHash =	        {x = 91.06,		y = 3750.03,	z = 39.77,	},
    WeedJoint =	        {x = 91.06,		y = 3750.03,	z = 39.77,	},
    WeedDealer =		{x = -54.24,	y = -1443.36,	z = 31.06,	},
    WeedStreetDealer =	{x = -54.24,	y = -1443.36,	z = 31.06,	}
}

Config.Map = {
    -- Cocaine Blips
    {name="Cocaine Field",                  color=47, scale=0.8, id=497, x=-1616.82, y=2559.83, z=0.57},
    {name="Cocaine Field",                  color=47, scale=0.8, id=497, x=1240.26,  y=-2950.6, z=8.32},
    {name="Cocaine Bulk Packing Site",      color=17, scale=0.8, id=497, x=-1616.82, y=2559.83, z=0.57},
    {name="Cocaine Cutting Floor",          color=17, scale=0.8, id=497, x=1240.26,  y=-2950.6, z=8.32},
    {name="Crack Manufacturing Site",       color=17, scale=0.8, id=497, x=-1616.82, y=2559.83, z=0.57},
    {name="Cocaine Dealer",                 color=51, scale=0.8, id=497, x=1240.26,  y=-2950.6, z=8.32},
    {name="Crack Dealer",                   color=51, scale=0.8, id=497, x=1240.26,  y=-2950.6, z=8.32},
    -- Meth Blips
    {name="Meth Production Lab",            color=30, scale=0.8, id=499, x=-1616.82, y=2559.83, z=0.57},
    {name="Meth Production Lab",            color=30, scale=0.8, id=499, x=1240.26,  y=-2950.6, z=8.32},
    {name="Meth Bulk Lab",                  color=42, scale=0.8, id=499, x=-1616.82, y=2559.83, z=0.57},
    {name="Speed Production Site",          color=42, scale=0.8, id=499, x=1240.26,  y=-2950.6, z=8.32},
    {name="ICE Production Hut",             color=42, scale=0.8, id=499, x=-1616.82, y=2559.83, z=0.57},
    {name="Meth Dealer",                    color=3, scale=0.8, id=499, x=1240.26,  y=-2950.6, z=8.32},
    {name="Meth Den",                       color=3, scale=0.8, id=499, x=1240.26,  y=-2950.6, z=8.32},
    -- Opium Blips
    {name="Opium Field",                    color=83, scale=0.8, id=514, x=-1616.82, y=2559.83, z=0.57},
    {name="Opium Field",                    color=83, scale=0.8, id=514, x=1240.26,  y=-2950.6, z=8.32},
    {name="Opium Bulk Proccessing Site",    color=50, scale=0.8, id=514, x=-1616.82, y=2559.83, z=0.57},
    {name="Opium Bagging Site",             color=50, scale=0.8, id=514, x=1240.26,  y=-2950.6, z=8.32},
    {name="Herion Refining Site",           color=50, scale=0.8, id=514, x=-1616.82, y=2559.83, z=0.57},
    {name="Opium Dealer",                   color=7, scale=0.8, id=514, x=1240.26,  y=-2950.6, z=8.32},
    {name="Opium Street Dealer",            color=7, scale=0.8, id=514, x=1240.26,  y=-2950.6, z=8.32},
    -- Cannabis Blips
    {name="Cannabis Field",                 color=25, scale=0.8, id=496, x=-1616.82, y=2559.83, z=0.57},
    {name="Cannabis Field",                 color=25, scale=0.8, id=496, x=1240.26,  y=-2950.6, z=8.32},
    {name="Cannabis Bulk Production Site ", color=52, scale=0.8, id=496, x=-1616.82, y=2559.83, z=0.57},
    {name="Hash Extraction Site",           color=52, scale=0.8, id=496, x=1240.26,  y=-2950.6, z=8.32},
    {name="Weed Packaging Area",            color=52, scale=0.8, id=496, x=-1616.82, y=2559.83, z=0.57},
    {name="Cannabis Dealer",                color=69, scale=0.8, id=496, x=1240.26,  y=-2950.6, z=8.32},
    {name="Girl Scouts Hall",               color=69, scale=0.8, id=496, x=1240.26,  y=-2950.6, z=8.32}
  }