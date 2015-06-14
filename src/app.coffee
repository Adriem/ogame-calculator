module = angular.module("ogameCalculator", [])

.controller "mainController", ($scope, Planet, AccountLoader) ->

  PLAYER_KEY = "playerInfo"

  numPlanets = 0

  ### AUX ###
  $scope.editPlanet = undefined

  ### DATA ###
  $scope.player = AccountLoader.loadAccount(PLAYER_KEY)

  ### WATCHERS ###
  $scope.$watch("player", ->
    AccountLoader.storeAccount(PLAYER_KEY, $scope.player)
  , true)

  ### FUNCTIONS ###
  $scope.createPlanet = ->
    $scope.player.addPlanet(new Planet("Planet #{++numPlanets}", [1,1,1], 50))
    null;

  $scope.removePlanet = (position) ->
    $scope.player.removePlanet(position, 1)
    null

  return null

