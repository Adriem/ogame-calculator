module.directive "productionUnitsCard", (Unit) ->

  ### DIRECTIVE RETURN ###
  templateUrl: "components/production-units-card/production-units-card.html"
  scope: true
  link: (scope, element, attr) ->
    scope.period = 'hourly'
    scope.fleet = Unit.fleet
    scope.defenses = Unit.defenses
    scope.missile = Unit.missile
    out.debug "Unit constants"
    console.log scope.fleet
    console.log scope.defenses
    console.log scope.missile