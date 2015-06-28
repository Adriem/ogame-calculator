module.service 'AccountLoader', (Account) ->

  loadAccount: (fileName) ->
    out.verbose "Loading account from previous session"
    Account.getFromTemplate(JSON.parse(localStorage.getItem(fileName)))

  storeAccount: (fileName, account) ->
    out.verbose "Saving account"
    localStorage.setItem(fileName, JSON.stringify(account))


module.factory 'Account', (Planet) ->

  class Account
    constructor: (plasmaLevel = 0, geologist = false, planets = []) ->
      @plasmaLevel = plasmaLevel
      @geologist = geologist
      @planets = planets # This is not safe!

    addPlanet: (planet) ->
      @planets.push(planet)

    removePlanet: (index) ->
      @planets.splice(index, 1)

    movePlanet: (startPos, finalPos) ->
      auxPlanet = @planets[startPos]
      @removePlanet(startPos)
      @planets.splice(finalPos, 0, auxPlanet)

    getMetalProduction: ->
      production = 0
      for planet in @planets
        production += planet.getMetalProduction(@plasmaLevel, @geologist)
      production

    getCrystalProduction: ->
      production = 0
      for planet in @planets
        production += planet.getCrystalProduction(@plasmaLevel, @geologist)
      production

    getDeuteriumProduction: ->
      production = 0
      for planet in @planets
        production += planet.getDeuteriumProduction(@plasmaLevel, @geologist)
      production

    ### STATIC ###
    @getFromTemplate = (templ) ->
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