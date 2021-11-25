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

		// route en extra sur le handler declaré en tant que resources
		get('/teams/searchByRangeYear', "api.Teams.searchByRangeYear");
		// route('/teams/searchByRangeYear')
		// 	.withAction({
		// 		GET = 'searchByRangeYear'
		// 	})
		// 	.toHandler("api.Teams");

		// https://coldbox.ortusbooks.com/the-basics/routing/routing-dsl/resourceful-routes
		// generate all CRUD routes for handler with same name : teams
		// resources("teams");
		resources(resource="teams", handler="api.Teams");

		// A nice healthcheck route example
		route( "/healthcheck", function( event, rc, prc ) {
			return "Ok!";
		} );

		// API Echo
		get( "/api/echo", "Echo.index" );

		// API Authentication Routes
		post( "/api/login", "Auth.login" );
		post( "/api/logout", "Auth.logout" );
		post( "/api/register", "Auth.register" );

		// API Secured Routes
		get( "/api/whoami", "Echo.whoami" );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
