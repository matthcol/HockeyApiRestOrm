/**
 * I am a new handler
 */
component{

	property name="teamService" inject="entityService:Team";

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
	 * index
	 * List all Persons
	 */
	function index( event, rc, prc ){
		return teamService
			// List all as array of objects
			.list( asQuery=false )
			// Map the entities to mementos
			.map( function( item ){
				return item.getMemento( includes="id" );
			} );
	}

	/**
	 * create
	 */
	/**
 * create a person
 */
function create( event, rc, prc ){
    prc.team = teamService
        .new( {
            name     : rc.name,
            city     : rc.city,
            firstYearOfPlay : rc.firstYearOfPlay
        } );
    ;
    return teamService
        .save( prc.team )
        .getMemento( includes="id" );
}

	/**
	 * show
	 */
	/**
 * show a person
 */
function show( event, rc, prc ){
    // return teamService
	/**
 * show a person
 */
function show( event, rc, prc ){
	return getInstance( "Team" )
       	.get( rc.id ?: 0 )
    	.getMemento( includes="id" );
}

	/**
	 * update
	 */
	/**
 * Update a person
 */
function update( event, rc, prc ){
    prc.team = teamService
        .getOrFail( rc.id ?: -1 )
        .setName(rc.name)
		.setCity(rc.city)
		.setFirstYearOfPlay(rc.firstYearOfPlay)
    return teamService
        .save( prc.team )
        .getMemento( includes="id" );
}

		/**
	* Delete a Person
	*/
	function delete( event, rc, prc ){
		try{
			teamService
				.getOrFail( rc.id ?: '' )
				.delete();
			// Or use the shorthnd notation which is faster
			// getIntance( "Team" ).deleteById( rc.id ?: '' )
		} catch( any e ){
			return "Error deleting entity: #e.message# #e.detail#";
		}

		return "Entity Deleted!";
	}

}
