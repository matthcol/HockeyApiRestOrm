/**
 * I am a new handler
 */
component extends="cborm.models.resources.BaseHandler" {

	// DI
	property name="ormService" inject="entityService:Team";

	// property utilisée pour le tri
	variables.sortOrder     = "name";

	// entity
	variables.entity         = "Team";

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use

	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

	/**
	*
	*/
	function index( event, rc, prc ){
		// Criterias and Filters
		param rc.sortOrder            = "firstYearOfPlay desc";
		param rc.page                 = 1;
		param rc.isActive             = true;

		// Build up a search criteria and let the base execute it
		arguments.criteria = newCriteria()
			.eq( "active",  autocast("active", rc.isActive)  );
		super.index( argumentCollection=arguments );
	}

	function searchByRangeYear(event, rc, prc) {
		param rc.sortOrder            = "firstYearOfPlay";
		param rc.page                 = 1;
		param rc.minYear = 1875;
		param rc.maxYear = 2021;

		arguments.criteria = newCriteria()
			.between( 
				"firstYearOfPlay",  
				autocast("firstYearOfPlay", rc.minYear),
				autocast("firstYearOfPlay", rc.maxYear));

		super.index( argumentCollection=arguments );
	}

}
