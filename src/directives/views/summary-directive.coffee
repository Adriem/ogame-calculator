module.directive "summary", ->
  template: """
    <fieldset id="summary">
      <legend class="hidden-xs">Summary</legend>
      <div class="row">
        <global-card class="col-md-offset-3 col-md-6 col-xs-12"></global-card>
      </div>
    </fieldset>
    """