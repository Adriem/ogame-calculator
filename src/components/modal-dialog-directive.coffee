### CLOSE BUTTON DIRECTIVE ###
module.directive "closeDialogButton", ->
  replace: true
  template: """
    <button type='button' class='close'
            data-dismiss='modal'
            aria-label='Close'>
        <span aria-hidden='true'>&times;</span>
    </button>
    """

### DIALOG WRAPPER DIRECTIVE ###
module.directive "ngModalDialog", ->

  scope =
    modalId: '@modalId'   # One way binding, expression expected
    show: '=modalVisible' # Two way binding, variable name expected

  template = """
    <div class="modal fade" ng-attr-id="{{modalId}}">
      <div class="modal-dialog">
        <div class="modal-content" ng-transclude></div>
      </div>
    </div>
    """

  link = (scope, element, attrs) ->
    attrs.modalVisible ?= "#{attrs.modalId}Visible"
    scope.$watch 'show', (showValue) ->
      if showValue then element.modal('show') else element.modal('hide')
      out.success "Visibility changed to #{showValue}"
    element.bind 'shown.bs.modal', ->
      # Update modalVisible value when the
      # modal is opened via data attributes
      out.log "Event 'shown.bs.modal' triggered"
      scope.$apply -> scope.$parent[attrs.modalVisible] = true
    element.bind 'hidden.bs.modal', ->
      # Update modalVisible value when the
      # modal is closed via data attributes
      out.log "Event 'hidden.bs.modal' triggered"
      scope.$apply -> scope.$parent[attrs.modalVisible] = false

  ### DIRECTIVE RETURN ###
  transclude: true
  replace: true
  restrict: 'EC'
  template: template
  link: link
  scope: scope