# ogame-calculator
A calculator for OGame resources with AngularJS. You can try it here: http://adriem.github.io/ogame-calculator/

#### Set up this project
In order to clone this repo and run it or modify it, you must follow these steps:
- Clone this repo
- `npm install -g http-server`
- `cd path/to/project/ogame-calculator`
- `npm install`

#### Build this project
In case you made some modifications to the sources, you'll have to rebuild the project for the changes to take effect. You can use two different commands to build the project:
- **`gulp build`** will build the project under the dist folder, minifying and uglifying all the files. This command is meant for production use.
- **`gulp build:dev`** will build the project under the dist folder too, but respecting comments and leaving readable files. This command is meant for debugging.

#### Run this project
In order to run this project, you must follow this steps
- Set up the project (in case you didn't before)
- Build the project (in case you have modified the project)
- `http-server dist` (this step must only be done if http-server is not running)
- Open your browser and go to *localhost:8080*

Optionally, once the http-server is running, you may compile and run directly with `gulp launch` or `gulp launch:dev`

#### About this project...
This site is not affiliated with OGame nor Gameforge. It is a little project I started to experiment with AngularJS. If you have any suggestions or you notice any error, feel free to email me and I will response as soon as I can. 

Hope you enjoy it!
                
