
var backlogModule = angular.module('backlog', []);

var backlog = {};
backlog.stories = [];
backlog.totalPoints = 0;

backlogModule.controller('BacklogCtrl', function BacklogCtrl($scope, $http) {
		
 $scope.backlog = backlog;
  
 $scope.updateTotalPoints = function(){
	  
	  //Should be a better way to do this vs update all over
	  $scope.backlog.totalPoints = 0;
	  
	  backlog.stories.forEach(function(entry){
		  $scope.backlog.totalPoints += entry.points;
	  });
  };
  
  $scope.getBacklog = function(projectId){
	  $http.get('/Collaborate/rest/project/' + projectId + '/backlog').then(function(result) {
		    $scope.backlog.stories = result.data;
	  });
	  
	  $scope.updateTotalPoints();
  };
  
  $scope.init = function(projectId){
	  $scope.getBacklog(projectId);
  }
  
  $scope.$watch('backlog.stories', $scope.updateTotalPoints);
 
  $scope.users = [];
  
  $http.get('/Collaborate/rest/user/list').then(function(result) {
    $scope.users = result.data;
  });
  
  $scope.labels = [];
  
  $http.get('/Collaborate/rest/label/list').then(function(result) {
	    $scope.labels = result.data;
   });
 
  $scope.addStoryToBacklog = function(projectId) {

    $http.post('/Collaborate/rest/project/' + projectId +'/story/create', {title:$scope.storyTitle}).success(function(data, status, headers, config){
    	//alert("Got data: " + JSON.stringify(data));
    	$scope.backlog.stories.push(data);
	  });
    
    $scope.storyTitle = '';
    
    //$scope.updateTotalPoints();
  };
  
  $scope.updateStory = function(projectId, index) {
	  //send this story to controller for update
	  //$scope.backlog.stories[index].id
	  
	  //alert(JSON.stringify($scope.backlog.stories[index]));
	  
	  $http.post('/Collaborate/rest/project/' + projectId +'/story/update', $scope.backlog.stories[index]);
	  
	  $scope.updateTotalPoints();
  };
  
  
//  $scope.addStoryToBacklogWithDetails = function() {
//	    $scope.backlog.stories.push({title:$scope.title, points:$scope.points});
//  };
  
});