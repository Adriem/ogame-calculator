module.factory 'Unit', () ->

  class Unit
    constructor: (metalCost = 0, crystalCost = 0, deuteriumCost = 0) ->
      @metalCost = metalCost
      @crystalCost = crystalCost
      @deuteriumCost = deuteriumCost

    @fleet =
      LIGHT_FIGHTER: new Unit(3000, 1000, 0)
      HEAVY_FIGHTER: new Unit(6000, 4000, 0)
      CRUISER: new Unit(20000, 7000, 2000)
      BATTLESHIP: new Unit(45000, 15000, 0)
      BATTLECRUISER: new Unit(30000, 40000, 15000)
      BOMBER: new Unit(50000, 25000, 15000)
      DESTROYER: new Unit(60000, 50000, 15000)
      DEATHSTAR: new Unit(5000000, 4000000, 1000000)
      SMALL_CARGO: new Unit(2000, 2000, 0)
      BIG_CARGO: new Unit(6000, 6000, 0)
      RECYCLER: new Unit(10000, 6000, 2000)
      COLONY_SHIP: new Unit(6000, 6000, 0)
      ESPIONAGE_PROBE: new Unit(0, 1000, 0)
      SOLAR_SATELLITE: new Unit(0, 2000, 500)

    @defenses =
      ROCKET_LAUNCHER: new Unit(2000, 0, 0)
      LIGHT_LASER: new Unit(1500, 500, 0)
      HEAVY_LASER: new Unit(6000, 2000, 0)
      GAUSS_CANNON: new Unit(20000, 15000, 2000)
      ION_CANNON: new Unit(2000, 6000, 0)
      PLASMA_TURRET: new Unit(50000, 50000, 30000)

    @missile =
      ANTI_BALLISTIC: new Unit(2000, 0, 0)
      INTERPLANETARY: new Unit(1500, 500, 0)