module.directive "planetList", ->
  template: """

    <edit-dialog></edit-dialog>

    <fieldset id="planets">
      <legend>Your planets</legend>
      <div class="class="row">

        <!-- PLANET CARDS -->
        <planet-card data-ng-repeat="planet in player.planets track by $index"
                     class="col-md-4 col-sm-6 col-xs-12"></planet-card>

        <!-- ADD PLANET BUTTON -->
        <div class="col-md-4 col-sm-6 col-xs-12">
          <button class="btn btn-default btn-block" ng-click="createPlanet()">
            Add a planet
          </button>
        </div>

      </div>
    </fieldset>
    """