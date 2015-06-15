module.factory 'Planet', ->

  Planet = (name = "", coordinates = [0,0,0], maxTemp = 0) ->
    @name = name
    @coordinates = coordinates
    @maxTemp = maxTemp
    @metalMine = 0
    @crystalMine = 0
    @deuteriumMine = 0
    @metalBonus = 0
    @crystalBonus = 0
    @deuteriumBonus = 0
    null

  Planet.prototype.getMetalProduction = (plasma = 0, geologist = false) ->
    bonusMultiplier = 1 + @metalBonus * 0.1
    geoMultiplier = if geologist then 1.1 else 1
    naturalGeneration = 30
    baseStat = 30 * @metalMine * Math.pow(1.1, @metalMine)
    production = (baseStat * bonusMultiplier) * geoMultiplier
    Math.ceil(production + baseStat * plasma * 0.01) + naturalGeneration

  Planet.prototype.getCrystalProduction = (plasma = 0, geologist = false) ->
    bonusMultiplier = 1 + @crystalBonus * 0.1
    geoMultiplier = if geologist then 1.1 else 1
    naturalGeneration = 15
    baseStat = 20 * @crystalMine * Math.pow(1.1, @crystalMine)
    production = (baseStat * bonusMultiplier) * geoMultiplier
    Math.ceil(production + baseStat * plasma * 0.0066 - 0.5) + naturalGeneration

  Planet.prototype.getDeuteriumProduction = (plasma, geologist = false) ->
    bonusMultiplier = 1 + @deuteriumBonus * 0.1
    geoMultiplier = if geologist then 1.1 else 1
    baseStat = 10 * @deuteriumMine * Math.pow(1.1, @deuteriumMine) * (1.44 - 0.004 * @maxTemp)
    production = (baseStat*bonusMultiplier)*geoMultiplier
    Math.ceil(production)

  ### STATIC METHOD ###
  Planet.getFromJSON = (jsonObject) ->
    if jsonObject?
      planet = new Planet(
        jsonObject.name,
        jsonObject.coordinates,
        jsonObject.maxTemp
      )
      planet.metalMine = jsonObject.metalMine
      planet.crystalMine = jsonObject.crystalMine
      planet.deuteriumMine = jsonObject.deuteriumMine
      planet.metalBonus = jsonObject.metalBonus
      planet.crystalBonus = jsonObject.crystalBonus
      planet.deuteriumBonus = jsonObject.deuteriumBonus
      planet
    else new Planet()

  return Planet