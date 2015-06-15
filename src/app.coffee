module = angular.module("ogameCalculator", [])

.controller "mainController", ($scope, Planet, AccountLoader) ->

  ### CONSTANTS ###
  $scope.AMPLIFIER_LIST = Planet.amplifierList
  PLAYER_KEY = "playerInfo" # Key to store player info in local storage


  ### AUX VARIABLES FOR EDITING PLANETS' INFO ###
  $scope.auxPlanet = new Planet()
  editIndex = -1

  ### DATA ###
  $scope.player = AccountLoader.loadAccount(PLAYER_KEY)
  console.log $scope.player

  ### WATCHERS ###
  $scope.$watch("player", ->
    AccountLoader.storeAccount(PLAYER_KEY, $scope.player)
  , true)

  ### FUNCTIONS ###
  $scope.createPlanet = ->
    editIndex = -1
    $scope.auxPlanet = new Planet("New Planet", [1,1,1], 50)
    null;

  $scope.editPlanet = (index) ->
    editIndex = index
    planet = $scope.player.planets[index]
    $scope.auxPlanet = new Planet(
      planet.name,
      [planet.coordinates[0],planet.coordinates[1],planet.coordinates[2]],
      planet.maxTemp
    )
    null

  $scope.savePlanet = () ->
    if editIndex >= 0
      planet = $scope.player.planets[editIndex]
      planet.name = $scope.auxPlanet.name
      planet.coordinates = $scope.auxPlanet.coordinates
      planet.maxTemp = $scope.auxPlanet.maxTemp
    else $scope.player.addPlanet($scope.auxPlanet)
    null

  $scope.removePlanet = (position) ->
    $scope.player.removePlanet(position, 1)
    null

  return null