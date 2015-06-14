module = angular.module("ogameCalculator", [])

.controller "mainController", ($scope, Planet, Account) ->

  numPlanets = 0

  ### AUX ###
  $scope.editPlanet = undefined

  ### DATA ###
  $scope.player = new Account()

  ### WATCHERS ###
  $scope.$watch("player", ->
    console.log "Player changed!"
  , true)

  ### FUNCTIONS ###
  $scope.createPlanet = ->
    $scope.player.addPlanet(new Planet("Planet #{++numPlanets}", [1,1,1], 50))
    null;

  $scope.removePlanet = (position) ->
    $scope.player.removePlanet(position, 1)
    null

  return null

