todoList = angular.module('todoList', [
	'templates',
	'ngRoute',
	'ngResource'
])

todoList.config(['$routeProvider', '$httpProvider', ($routeProvider, $httpProvider)->

	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

	$routeProvider
		.when('/',
			templateUrl: 'index.html'
			controller: 'TodoListController'
		)
])

todoList.factory('TodoListFactory', ['$resource', ($resource)->
	$resource('/todos/:id', { id: '@id' }, {
		'index': { method: 'GET', isArray: true },
		'create': { method: 'POST' },
		'destroy': { method: 'DELETE', isArray: true }
	})
])

todoList.controller('TodoListController', ['$scope', 'TodoListFactory', ($scope, TodoListFactory)->

	$scope.getTodos = TodoListFactory.index()

	$scope.newTodo = ''

	$scope.itemAdd = (newItem)-> if $scope.newTodo != ''
		TodoListFactory.create({ item: $scope.newTodo })
		totalItems = $scope.getTodos.length
		$scope.getTodos.push({ id: totalItems += 1, item: $scope.newTodo })
		$scope.newTodo = ''
	else
		return false

	$scope.itemComplete = (itemId, itemIndex)->
		TodoListFactory.destroy({ id: itemId })
		$scope.getTodos[itemIndex].id = 0

])