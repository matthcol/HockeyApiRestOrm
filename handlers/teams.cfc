/**
 * Manage settings
 */
component extends="cborm.models.resources.BaseHandler"{

    // DI
    property name="ormService" inject="entityService:Team";

    // The default sorting order string: permission, name, data desc, etc.
    variables.sortOrder     = "name";
    // The name of the entity this resource handler controls. Singular name please.
    variables.entity         = "Team";
    // The name of the method to use for save persistence on the ORM service
  	variables.saveMethod   = "save";
	  // The name of the method to use for deleting entites on the ORM service
	  variables.deleteMethod = "delete";

    /**
 * Display all clientNotes by creating my own criteria object
 * GET /api/v1/clientNotes
 *
 * @override
 */
function index( event, rc, prc ){
    // Criterias and Filters
    param rc.sortOrder             = "firstYearOfPlay desc";
    param rc.page                 = 1;
    param rc.firstYearOfPlay = 1910;
  
    // Build up a search criteria and let the base execute it
    arguments.criteria = newCriteria()
        .gt( "firstYearOfPlay", autoCast( "firstYearOfPlay", rc.firstYearOfPlay ));
    super.index( argumentCollection=arguments );
}

function search( event, rc, prc ){
  param rc.sortOrder             = "firstYearOfPlay desc";
    param rc.page                 = 1;
    param rc.firstYearOfPlay = 1910;
       arguments.criteria = newCriteria()
        .gt( "firstYearOfPlay", autoCast( "firstYearOfPlay", rc.firstYearOfPlay ));
    super.index( argumentCollection=arguments );
}


}