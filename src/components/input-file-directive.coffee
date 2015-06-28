module.directive "fileInput", ->

  template = "<input type='file' accept='.json'>"

  link = (scope, element, attrs, ngModel) ->
    element.bind "change", ->
      out.log "file-input change event triggered"
      scope.$apply ->
        if attrs.multiple then ngModel.$setViewValue(element[0].files)
        else ngModel.$setViewValue(element[0].files[0]);
      element.val("")

  ### DIRECTIVE RETURN ###
  replace: true
  scope: false
  require: "ngModel"
  restrict: 'E'
  template: template
  link: link