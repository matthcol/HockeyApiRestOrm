component {

	function configure() {
		// Set Full Rewrites
		setFullRewrites( true );

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 *
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 *
		 */

		route("/teams/search", "teams.search");
		resources("teams");
		resources(resource="api/teams2", handler="api.Teams2");
		
		resources("divisions");
		resources("players");

		// A nice healthcheck route example
	// 	route( "/healthcheck", function( event, rc, prc ) {
	// 		return "Ok!";
	// 	} );

	// 	// API Echo
	// 	get( "/api/echo", "Echo.index" );

	// 	// API Authentication Routes
		post( "/api/login", "Auth.login" );
		post( "/api/logout", "Auth.logout" );
		post( "/api/register", "Auth.register" );

	// 	// API Secured Routes
		get( "/api/whoami", "Echo.whoami" );

	// 	// Conventions based routing
	// 	route( ":handler/:action?" ).end();
	}

}
