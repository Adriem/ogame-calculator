module.directive 'editDialog', ->
  templateUrl: 'components/edit-dialog/edit-dialog.html'
  link: (scope, element, attrs) ->
    scope.$watch "auxPlanet", -> scope.dialogTitle = scope.auxPlanet.name