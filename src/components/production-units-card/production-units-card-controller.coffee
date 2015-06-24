module.directive "productionUnitsCard", ->

  link = (scope, element, attrs) ->
    return null # Avoid autoreturn

  ### DIRECTIVE RETURN ###
  templateUrl: "components/production-units-card/production-units-card.html"
  link: link