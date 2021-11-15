/**
 * A cool Team entity
 */
component persistent="true" table="Team" extends="cborm.models.ActiveEntity"{

	// Primary Key
	property name="id" fieldtype="id" column="id" generator="native" setter="false";

	// Properties
	property name="name" ormtype="string";
	property name="city" ormtype="string";
	property name="firstYearOfPlay" ormtype="integer";
	

	// Validation
	this.constraints = {
		// Example: age = { required=true, min="18", type="numeric" }
		firstYearOfPlay = { required=false, min="1875", type="numeric" }
	};

	// Mementifier
	this.memento = {
		// An array of the properties/relationships to include by default
		defaultIncludes = [ "*" ],
		// An array of properties/relationships to exclude by default
		defaultExcludes = [],
		// An array of properties/relationships to NEVER include
		neverInclude = [],
		// A struct of defaults for properties/relationships if they are null
		defaults = {},
		// A struct of mapping functions for properties/relationships that can transform them
		mappers = {}
	};

	/**
	 * Constructor
	 */
	function init(){
		super.init( useQueryCaching="false" );
		return this;
	}
}

