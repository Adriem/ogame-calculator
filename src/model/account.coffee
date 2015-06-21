module.factory 'Account', (Planet) ->

  Account = (plasmaLevel = 0, geologist = false, planets = []) ->
    @plasmaLevel = plasmaLevel
    @geologist = geologist
    @planets = planets # This is not safe!
    null

  Account.prototype.addPlanet = (planet) ->
    @planets.push(planet)
    null

  Account.prototype.removePlanet = (index) ->
    @planets.splice(index, 1)
    null

  Account.prototype.movePlanet = (startPos, finalPos) ->
    auxPlanet = @planets[startPos]
    @removePlanet(startPos)
    @planets.splice(finalPos, 0, auxPlanet)

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

  ### STATIC METHOD ###
  Account.getFromTemplate = (templ) ->
    if templ?
      account = new Account(
        templ.plasmaLevel,
        templ.geologist,
        if templ.planets?
          (Planet.getFromTemplate(planet) for planet in templ.planets)
        else undefined
      )
      out.success "Data loaded successfully"
    else
      account = new Account()
      out.error "Incorrect data input"
    account

  return Account