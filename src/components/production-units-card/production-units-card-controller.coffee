module.directive "productionUnitsCard", (Unit) ->

  link = (scope, element, attr) ->
    scope.period =
      list: [
        {key: 'Hourly', value: 1}
        {key: 'Daily', value: 24}
        {key: 'Weekly', value: 168} # 7days * 24 hours
        {key: 'Monthly', value: 720} # 30 days * 24 hours
      ]
      selected: 1 # Default value (Hourly)

    scope.fleet = Unit.fleet
    scope.defenses = Unit.defenses
    scope.missile = Unit.missile

    scope.productionCapacity = (unit) ->
      player = scope.player
      period = scope.period.selected
      # We must avoid production/cost when both are
      # equal to 0, otherwise NaN will be returned
      mProductionCapacity =
        if unit.metalCost is 0 then Infinity # Regardless production
        else player.getMetalProduction() * period // unit.metalCost
      cProductionCapacity =
        if unit.crystalCost is 0 then Infinity # Regardless production
        else player.getCrystalProduction() * period // unit.crystalCost
      dProductionCapacity =
        if unit.deuteriumCost is 0 then Infinity # Regardless production
        else player.getDeuteriumProduction() * period // unit.deuteriumCost
      Math.min(mProductionCapacity, cProductionCapacity, dProductionCapacity)

  ### DIRECTIVE RETURN ###
  templateUrl: "components/production-units-card/production-units-card.html"
  scope: true
  link: link