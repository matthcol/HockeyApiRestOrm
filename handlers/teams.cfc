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

}