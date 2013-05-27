// Place third party dependencies in the lib folder
//
// Configure loading modules from the lib directory,
// except 'app' ones,
requirejs.config({
    "baseUrl": "assets/js/lib",
    "paths": {
      "app": "../app",
      "jquery": "https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min",
      "angularjs": "https://ajax.googleapis.com/ajax/libs/angularjs/1.0.6/angular.min"
    },
});
