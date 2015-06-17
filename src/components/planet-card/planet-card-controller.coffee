module.directive "planetCard", ->

  ###
  Because webkit doesn't allow dataTransfer.getData() on 'dragover' event,
  some data must be stored in a global variable. Since this code's purpose
  is to learn, I'm trying to do things as correct as possible, so I'm using
  mainly dataTransfer object for passing information, only adding workarounds
  when necessary. All these workarounds are commented, so they can be easily
  identified. If these lines of code are removed, it should still work on FF.
  ###

  movedPlanet = 0 # Webkit workaround

  link = (scope, element, attr) ->
    # Fix jQuery issue as described in
    # http://bocoup.com/weblog/using-datatransfer-with-jquery-events/
    angular.element.event.props.push("dataTransfer")

    ### VARIABLES ###
    scope.planetIndex = scope.$index

    ### SETUP DRAG N' DROP ###
    element.attr("draggable", "true")
    #On 'dragstart'
    element.bind "dragstart", (event) ->
      @classList.add("dragging")
      event.dataTransfer.effectAllowed = "move"
      event.dataTransfer.setData("text/plain", scope.planetIndex)
      movedPlanet = scope.planetIndex # Webkit workaround
    #On 'dragend'
    element.bind "dragend", -> @classList.remove("dragging")
    #On 'dragleave'
    element.bind "dragleave", ->
      @classList.remove("drag-over-lower")
      @classList.remove("drag-over-greater")
    #On 'dragover'
    element.bind "dragover", (event) ->
      event.stopPropagation() if event.stopPropagation
      draggedPlanetIndex = Number(event.dataTransfer.getData('text/plain'))
      draggedPlanetIndex = movedPlanet if draggedPlanetIndex is 0 # Webkit workaround
      @classList.add("drag-over-lower") if draggedPlanetIndex > scope.planetIndex
      @classList.add("drag-over-greater") if draggedPlanetIndex < scope.planetIndex
      event.dataTransfer.dropEffect = "move"
      false
    #On 'drop'
    element.bind "drop", (event) ->
      @classList.remove("drag-over-lower")
      @classList.remove("drag-over-greater")
      event.stopPropagation() if event.stopPropagation
      startPosition = Number(event.dataTransfer.getData('text/plain'))
      endPosition = scope.planetIndex
      out.verbose "Dropped #{startPosition} over #{endPosition}"
      scope.movePlanet(startPosition, endPosition) if startPosition isnt endPosition
      scope.$apply()
      false

  ### DIRECTIVE RETURN ###
  templateUrl: "components/planet-card/planet-card.html"
  link: link