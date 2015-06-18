module.directive "section", ->

  scope =
    id: '@sectionId' # One way binding, expression expected
    title: '@sectionTitle' # One way binding, expression expected

  template = """
    <fieldset ng-attr-id="{{id}}">
      <legend>{{title}}</legend>
        <div class="row" ng-transclude></div>
    </fieldset>
    """

  ### DIRECTIVE RETURN ###
  transclude: true
  replace: true
  restrict: 'E'
  template: template
  scope: scope