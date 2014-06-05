BookApp = angular.module("BookApp", [])

BookApp.controller("BooksCtrl", ["$scope", "$http", ($scope, $http)-> 
	$scope.books = []

	$http.get("/books.json").success (data)->
		$scope.books = data

	$scope.addBook = ->
		console.log $scope.newBook
		$http.post("/books.json", $scope.newBook).success (data)->
			console.log "SAVED"
			$scope.newBook = {}
			$scope.books.push(data)

	$scope.editBook = ->
		console.log @book
		$http.put("/books/#{@book.id}.json", @book).success (data)=>
			@editing =!@editing

	$scope.deleteBook = ->
		# $http.delete("/books/"+@book.id+".json") same as below
		$http.delete("/books/#{@book.id}.json").success (data)=>
			console.log "book deleted"
			$scope.books.splice(@$index,1)

])

# Define Config
BookApp.config(["$httpProvider", ($httpProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])

# inside ng repeat, have an edit form for every book, if they click the button,
 # hide the html and show the form