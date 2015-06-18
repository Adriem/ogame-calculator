module.directive "settings", ->
  template: """
    <fieldset id="settings">
      <legend>Settings</legend>
      <div class="class="row">

        <p>Coming soon...</p>

        <div class="col-sm-offset-2 col-sm-4 col-xs-12">
          <button class="btn btn-default btn-block" ng-click="createPlanet()" disabled>
            Import data
          </button>
        </div>

        <div class="col-sm-4 col-xs-12">
          <button class="btn btn-default btn-block" ng-click="createPlanet()" disabled>
            Export data
          </button>
        </div>

      </div>
    </fieldset>
    """