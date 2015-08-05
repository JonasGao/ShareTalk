/**
 * Created by jonas on 8/4/2015.
 */

require.config({
    baseUrl: "app",

    '*': {
        'css': '/dep/javascripts/require/css'
    },

    packages: [
        {
            name: 'cs',
            location: '/dep/javascripts/require',
            main: 'cs'
        },
        {
            name: 'coffee-script',
            location: '/dep/javascripts/require',
            main: 'coffee-script'
        }
    ],

    paths: {
        "jquery": "/dep/javascripts/jquery/jquery",
        "angular": "/dep/javascripts/angular/angular",
        "angular-route": "/dep/javascripts/angular/angular-route"
    },

    shim: {
        "jquery": {exports: "$"},
        "angular": {exports: "angular", deps: ["jquery"]},
        "angular-route": {exports: "angular-route", deps: ["angular"]}
    }
});

require(["cs!app"], function () {
    angular.bootstrap(document, ["ShareTalk"]);
});