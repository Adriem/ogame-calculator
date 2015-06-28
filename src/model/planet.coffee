module.factory 'Planet', ->

  class Planet
    constructor: (name = "", coordinates = [0,0,0], maxTemp = 0) ->
      @name = name
      @coordinates = coordinates
      @maxTemp = maxTemp
      @metalMine = 0
      @crystalMine = 0
      @deuteriumMine = 0
      @metalAmplifier = 0
      @crystalAmplifier = 0
      @deuteriumAmplifier = 0

    getMetalProduction: (plasma = 0, geologist = false) ->
      bonusMultiplier = 1 + @metalAmplifier * 0.1
      geoMultiplier = if geologist then 1.1 else 1
      naturalGeneration = 30
      baseStat = Math.round(30 * @metalMine * Math.pow(1.1, @metalMine))
      production = (baseStat * bonusMultiplier) * geoMultiplier
      Math.round(production + baseStat * plasma * 0.01) + naturalGeneration

    getCrystalProduction: (plasma = 0, geologist = false) ->
      bonusMultiplier = 1 + @crystalAmplifier * 0.1
      geoMultiplier = if geologist then 1.1 else 1
      naturalGeneration = 15
      baseStat = Math.round(20 * @crystalMine * Math.pow(1.1, @crystalMine))
      production = (baseStat * bonusMultiplier) * geoMultiplier
      Math.round(production + baseStat * plasma * 0.0066 - 0.5) + naturalGeneration

    getDeuteriumProduction: (plasma, geologist = false) ->
      bonusMultiplier = 1 + @deuteriumAmplifier * 0.1
      geoMultiplier = if geologist then 1.1 else 1
      baseStat = Math.round(10 * @deuteriumMine * Math.pow(1.1, @deuteriumMine) * (1.44 - 0.004 * @maxTemp))
      production = (baseStat*bonusMultiplier)*geoMultiplier
      Math.round(production)

    ### STATIC ###
    @getFromTemplate = (templ) ->
      if templ?
        out.success "Planet '#{templ.name}' loaded successfully"
        planet = new Planet(
          templ.name,
          templ.coordinates,
          templ.maxTemp
        )
        planet.metalMine = templ.metalMine
        planet.crystalMine = templ.crystalMine
        planet.deuteriumMine = templ.deuteriumMine
        planet.metalAmplifier = templ.metalAmplifier
        planet.crystalAmplifier = templ.crystalAmplifier
        planet.deuteriumAmplifier = templ.deuteriumAmplifier
        planet
      else new Planet()

    @amplifierList = [
      {name: "None", value: 0},
      {name: "+10%", value: 1},
      {name: "+20%", value: 2},
      {name: "+30%", value: 3},
    ]