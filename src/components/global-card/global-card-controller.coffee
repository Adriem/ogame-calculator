module.directive 'globalCard', ->
  templateUrl: 'components/global-card/global-card.html'

module.controller "globalCardController", ($scope, Account) ->

  ### PARAMS ###
  $scope.shortenResults = true
  $scope.K_THRESHOLD = 10000
  $scope.M_THRESHOLD = 1000000

  ### VALUES ###
  $scope.metalProduction = 0
  $scope.crystalProduction = 0
  $scope.deuteriumProduction = 0

  ### FUNCTIONS ###
  $scope.getValue = (production) ->
    if production > $scope.M_THRESHOLD && $scope.shortenResults
      production // 1000000
    else if production > $scope.K_THRESHOLD && $scope.shortenResults
      production // 1000
    else production

  $scope.getMultiplier = (production) ->
    if production > $scope.M_THRESHOLD && $scope.shortenResults then "M"
    else if production > $scope.K_THRESHOLD && $scope.shortenResults then "k"
    else undefined

  ### PLAYER OBSERVER ###
  $scope.$watch("player", ->
    $scope.metalProduction = $scope.player.getMetalProduction()
    $scope.crystalProduction = $scope.player.getCrystalProduction()
    $scope.deuteriumProduction = $scope.player.getDeuteriumProduction()
  , true)

  return null