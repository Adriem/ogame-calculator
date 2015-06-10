module.factory 'Account', (Planet) ->

  Account = () ->
    @plasmaLevel = 0
    @geologist = false
    @planets = []
    null

  Account.prototype.addPlanet = (planet) ->
    @planets.push(planet)
    null

  Account.prototype.removePlanet = (index) ->
    @planets.splice(index, 1)
    null

  Account.prototype.getMetalProduction = ->
    production = 0
    for planet in @planets
      production += planet.getMetalProduction(@plasmaLevel, @geologist)
    production

  Account.prototype.getCrystalProduction = ->
    production = 0
    for planet in @planets
      production += planet.getCrystalProduction(@plasmaLevel, @geologist)
    production

  Account.prototype.getDeuteriumProduction = ->
    production = 0
    for planet in @planets
      production += planet.getDeuteriumProduction(@plasmaLevel, @geologist)
    production

  return Account