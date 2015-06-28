# This file contains all the directives for the views in this app. `ng-include`
# cannot be used because it breaks bootstrap's scrollspy, so in order to use
# multiple html templates, directives must be used.

module.directive 'fleetDefense', ->
  templateUrl: 'views/fleet-defense.html'
  scope: false # Use parent's scope

module.directive 'planetList', ->
  templateUrl: 'views/planet-list.html'
  scope: false # Use parent's scope

module.directive 'summary', ->
  templateUrl: 'views/summary.html'
  scope: false # Use parent's scope