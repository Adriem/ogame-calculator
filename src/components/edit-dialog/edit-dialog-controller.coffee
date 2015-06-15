module.directive 'editDialog', ->
  templateUrl: 'components/edit-dialog/edit-dialog.html'

module.controller "editDialogController", ($scope) ->

  $scope.dialogTitle = "Edit planet"

  $scope.$watch "auxPlanet", ->
    $scope.dialogTitle = $scope.auxPlanet.name