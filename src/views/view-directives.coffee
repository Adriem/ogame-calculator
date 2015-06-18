
# This file contains all the directives for the views in this app. `ng-include`
# cannot be used because it breaks bootstrap's scrollspy, so in order to use
# multiple html templates, directives must be used.

module.directive 'fleetDefense', ->
  restrict: 'A'
  templateUrl: 'views/fleet-defense.html'

module.directive 'planetList', ->
  restrict: 'A'
  templateUrl: 'views/planet-list.html'

module.directive 'settings', ->
  restrict: 'A'
  templateUrl: 'views/settings.html'

module.directive 'summary', ->
  restrict: 'A'
  templateUrl: 'views/summary.html'