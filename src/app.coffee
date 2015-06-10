module = angular.module("ogameCalculator", [])

.controller "mainController", ($scope, Planet, Account) ->

  numPlanets = 0

  ### SETTINGS ###
  $scope.K_THRESHOLD = 10000
  $scope.M_THRESHOLD = 1000000
  $scope.shortenResults = true

  ### AUX ###
  $scope.editPlanet = undefined

  ### DATA ###
  $scope.player = new Account()

  ### FUNCTIONS ###
  $scope.createPlanet = ->
    $scope.player.addPlanet(new Planet("Planet #{++numPlanets}", [1,1,1], 50))
    null;

  $scope.removePlanet = (position) ->
    $scope.player.removePlanet(position, 1)
    null

  $scope.getHourlyMetalProduction = ->
    production = $scope.player.getMetalProduction()
    if production > $scope.M_THRESHOLD && $scope.shortenResults
      {value: production//1000000, multiplier: "M"}
    else if production > $scope.K_THRESHOLD && $scope.shortenResults
      {value: production//1000, multiplier: "k"}
    else {value: production, multiplier: ""}

  $scope.getHourlyCrystalProduction = ->
    production = $scope.player.getCrystalProduction()
    if production > $scope.M_THRESHOLD && $scope.shortenResults
      {value: production//1000000, multiplier: "M"}
    else if production > $scope.K_THRESHOLD && $scope.shortenResults
      {value: production//1000, multiplier: "k"}
    else {value: production, multiplier: ""}

  $scope.getHourlyDeuteriumProduction = ->
    production = $scope.player.getDeuteriumProduction()
    if production > $scope.M_THRESHOLD && $scope.shortenResults
      {value: production//1000000, multiplier: "M"}
    else if production > $scope.K_THRESHOLD && $scope.shortenResults
      {value: production//1000, multiplier: "k"}
    else {value: production, multiplier: ""}

  $scope.getDailyMetalProduction = ->
    production = $scope.player.getMetalProduction() * 24
    if production > $scope.M_THRESHOLD && $scope.shortenResults
      {value: production//1000000, multiplier: "M"}
    else if production > $scope.K_THRESHOLD && $scope.shortenResults
      {value: production//1000, multiplier: "k"}
    else {value: production, multiplier: ""}

  $scope.getDailyCrystalProduction = ->
    production = $scope.player.getCrystalProduction() * 24
    if production > $scope.M_THRESHOLD && $scope.shortenResults
      {value: production//1000000, multiplier: "M"}
    else if production > $scope.K_THRESHOLD && $scope.shortenResults
      {value: production//1000, multiplier: "k"}
    else {value: production, multiplier: ""}

  $scope.getDailyDeuteriumProduction = ->
    production = $scope.player.getDeuteriumProduction() * 24
    if production > $scope.M_THRESHOLD && $scope.shortenResults
      {value: production//1000000, multiplier: "M"}
    else if production > $scope.K_THRESHOLD && $scope.shortenResults
      {value: production//1000, multiplier: "k"}
    else {value: production, multiplier: ""}

  $scope.getWeeklyMetalProduction = ->
    production = $scope.player.getMetalProduction() * 24 * 7
    if production > $scope.M_THRESHOLD && $scope.shortenResults
      {value: production//1000000, multiplier: "M"}
    else if production > $scope.K_THRESHOLD && $scope.shortenResults
      {value: production//1000, multiplier: "k"}
    else {value: production, multiplier: ""}

  $scope.getWeeklyCrystalProduction = ->
    production = $scope.player.getCrystalProduction() * 24 * 7
    if production > $scope.M_THRESHOLD && $scope.shortenResults
      {value: production//1000000, multiplier: "M"}
    else if production > $scope.K_THRESHOLD && $scope.shortenResults
      {value: production//1000, multiplier: "k"}
    else {value: production, multiplier: ""}

  $scope.getWeeklyDeuteriumProduction = ->
    production = $scope.player.getDeuteriumProduction() * 24 * 7
    if production > $scope.M_THRESHOLD && $scope.shortenResults
      {value: production//1000000, multiplier: "M"}
    else if production > $scope.K_THRESHOLD && $scope.shortenResults
      {value: production//1000, multiplier: "k"}
    else {value: production, multiplier: ""}

  return null

