angular.module('app',[])
  .factory('Post', function($http) {
    var domain = 'http://localhost:4567/';
    var rest = {
      query: function() {
          return $http.get(domain + 'posts')
      },
      get: function(id) {
        return $http.get(domain + 'posts/'+ id)
      },
      save: function(item) {
        if(item.id) {
          return $http.put(domain + 'posts/'+item.id, item)
        }
        else {
          return $http.post(domain + 'posts/new', item)
        }
      },
      delete: function(item) {
        return $http.delete(domain+'posts/' + item.id)
      }
    };
    return rest
  })

  .controller('PostCtr', function($scope, Post) {

    var load = function() {
      Post.query({}).success(function (response) {
        $scope.data = response;
      })
    }

    $scope.detail = function(item) {
      Post.get(item.id).success(function (response) {
        $scope.item = response;
      });
    }

    $scope.form = function(item) {
      Post.save(item).success(function (response) {
        $scope.item = null;
        alert('item cadastrado com sucesso');
        load();
      });
    }

    $scope.delete = function(item) {
      Post.delete(item).success(function (response) {
        alert('item excluido com sucesso');
        load();
      });
    }

    load();
  });
