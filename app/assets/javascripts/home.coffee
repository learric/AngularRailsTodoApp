todoList = angular.module('todoList', [
	'templates',
	'ngRoute'
])

todoList.config(['$routeProvider', ($routeProvider)->

	$routeProvider
		.when('/',
			templateUrl: 'index.html'
			controller: 'TodoListController'
		)
])

todoList.controller('TodoListController', ['$scope', ($scope)->

])