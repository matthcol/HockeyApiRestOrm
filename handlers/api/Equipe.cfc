/**
 * I am a new handler
 */
component {
// component secured{

	// DI
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
	 */
	function index( event, rc, prc ){
		param rc.partname = "----";
		param rc.year = 1875;
		return teamService
			// .newCriteria()
			// .ilike("name", "%" & rc.partname & "%")
			// // .like("division.name", "tlan") // marche pas
			// .joinTo("division","d")
			// .like("d.name", "%tlan%") 
			// .list()
			//.findAllByName(rc.partname)
			//.findAllByNameLike("%" & rc.partname & "%")
			.findAllByNameLikeAndFirstYearOfPlayGreaterThan(
					"%" & rc.partname & "%", 
					rc.year)
			// Map the entities to mementos
			.map( function( item ){
				return item.getMemento( includes=["id", "division"] );
			} );
	}

	/**
	 * create
	 */
	function create( event, rc, prc ) secured {
		prc.team = teamService
			.new( {
				name : rc.name,
				city : rc.city,
				firstYearOfPlay : rc.firstYearOfPlay
			} )
			.save();
		return prc.team.getMemento( includes="id" );
	}

	/**
	 * show
	 */
	function show( event, rc, prc ){
		// return getInstance( "Team" )
		return teamService
			.get( rc.id ?: 0 )
			.getMemento( includes=["id", "division"] );
	}

	/**
	 * update
	 */
	function update( event, rc, prc ){
		event.setView( "api/Equipe/update" );
	}

	/**
	 * delete
	 */
	function delete( event, rc, prc ){
		event.setView( "api/Equipe/delete" );
	}



}
