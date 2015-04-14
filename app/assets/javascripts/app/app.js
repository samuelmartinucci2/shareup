angular.module('shareupApp', ['ngRoute','shareupApp.controllers','shareupApp.services','shareupApp.directives','shareupApp.filters'])
    .config(function($routeProvider) {
        $routeProvider.when('/', {
            templateUrl: '/templates/dashboard.html',
            controller: 'HomeController',
            resolve: {
                session: function(SessionService) {
                    return SessionService.getCurrentUser();
                }
            }
        }).otherwise({redirectTo: '/'});
    });