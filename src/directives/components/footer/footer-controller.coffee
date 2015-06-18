module.directive 'footer', ->
  scope: {}
  templateUrl: 'directives/components/footer/footer.html'
  link: (scope, element, attr) ->
    scope.aboutModalVisible = false
    scope.coontactModalVisible = false