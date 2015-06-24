module = angular.module("ogameCalculator", []) # Module definition
out =
  verbose: (string) -> console.log "%c#{string}", "color: #BBB;"
  log: (string) -> console.log string
  debug: (string) -> console.log "%c#{string}", "color: #08D;"
  success: (string) -> console.log "%c#{string}", "color: #0A0;"
  warning: (string) -> console.log "%c#{string}", "color: #D70;"
  error: (string) -> console.log "%c#{string}", "color: #D00;"

module.config ['$compileProvider', ( $compileProvider ) ->
  # This line marks blob: URLs as safe, otherwise exportation doesn't work
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|blob):/);
]

module.controller "mainController", ($scope, Planet, Account, AccountLoader) ->

  ### CONSTANTS ###
  $scope.AMPLIFIER_LIST = Planet.amplifierList
  PLAYER_KEY = "playerInfo" # Key to store player info in local storage

  ### AUX VARIABLES FOR EDITING PLANETS' INFO ###
  $scope.auxPlanet = new Planet()
  $scope.showModalDialog = false
  editIndex = -1

  ### DATA ###
  $scope.player = AccountLoader.loadAccount(PLAYER_KEY)
  $scope.exchangeData =
    exportUrl: "#"
    importFile: null
  # Due to some changes in planets' properties, amplifiers may load incorrectly.
  # This is a temporary fix that will prevent the page from crashing
  for planet in $scope.player.planets
    planet.metalAmplifier ?= 0
    planet.crystalAmplifier ?= 0
    planet.deuteriumAmplifier ?= 0

  ### WATCHERS ###
  $scope.$watch("player", ->
    AccountLoader.storeAccount(PLAYER_KEY, $scope.player)
    $scope.exchangeData.exportUrl = URL.createObjectURL(new Blob(
      [JSON.stringify($scope.player)],
      {type: "application/json"}
    ))
  , true)
  $scope.$watch("exchangeData.importFile", ->
    if $scope.exchangeData.importFile
      out.debug "Import file changed: '#{$scope.exchangeData.importFile.name}'"
      reader = new FileReader()
      reader.onload = (evt) ->
        $scope.$apply ->
          json = evt.target.result
          $scope.player = Account.getFromTemplate(JSON.parse(json))
      reader.readAsText($scope.exchangeData.importFile)
    else out.warning "Empty import file!"
  )

  ### FUNCTIONS ###
  $scope.createPlanet = ->
    $scope.auxPlanet = new Planet("New Planet", [1,1,1], 50)
    $scope.showModalDialog = true
    editIndex = -1

  $scope.editPlanet = (index) ->
    planet = $scope.player.planets[index]
    $scope.auxPlanet = new Planet(
      planet.name,
      [planet.coordinates[0],planet.coordinates[1],planet.coordinates[2]],
      planet.maxTemp
    )
    $scope.showModalDialog = true
    editIndex = index

  $scope.savePlanet = () ->
    if editIndex >= 0
      planet = $scope.player.planets[editIndex]
      planet.name = $scope.auxPlanet.name
      planet.coordinates = $scope.auxPlanet.coordinates
      planet.maxTemp = $scope.auxPlanet.maxTemp
    else $scope.player.addPlanet($scope.auxPlanet)

  $scope.movePlanet = (startPos, finalPos) ->
    out.success "Moving planet #{startPos} to #{finalPos}"
    $scope.player.movePlanet(startPos, finalPos)

  $scope.removePlanet = (position) ->
    $scope.player.removePlanet(position, 1)

  $scope.clearLocalData = ->
    localStorage.clear()
    $scope.player = AccountLoader.loadAccount()

  return null