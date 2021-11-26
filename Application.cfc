﻿/**
 * Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	
	// Application properties
	this.name              = hash( getCurrentTemplatePath() );
	this.sessionManagement = true;
	this.sessionTimeout    = createTimespan( 0, 0, 30, 0 );
	this.setClientCookies  = true;

	// COLDBOX STATIC PROPERTY, DO NOT CHANGE UNLESS THIS IS NOT THE ROOT OF YOUR COLDBOX APP
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );
	// The web server mapping to this application. Used for remote purposes or static purposes
	COLDBOX_APP_MAPPING   = "";
	// COLDBOX PROPERTIES
	COLDBOX_CONFIG_FILE   = "";
	// COLDBOX APPLICATION KEY OVERRIDE
	COLDBOX_APP_KEY       = "";

	// In the pseudo constructor
	this.mappings[ "/cborm" ] = COLDBOX_APP_ROOT_PATH & "modules/cborm";

	// The default dsn name in the ColdBox scaffold
	this.datasource = "hockeydb2"; 
	// ORM Settings + Datasource
	this.ormEnabled = "true";
	this.ormSettings = {
		cfclocation = [ "models" ], // Where our entities exist
		logSQL = true, // Remove after development to false.
		dbcreate = "update", // Generate our DB : none, update, dbcreate
		automanageSession = false, // Let cborm manage it
		flushAtRequestEnd = false, // Never do this! Let cborm manage it
		eventhandling = true, // Enable events
		eventHandler = "cborm.models.EventHandler", // Who handles the events
		skipcfcWithError = true // Yes, because we must work in all CFML engines
	};

	// application start
	public boolean function onApplicationStart() {
		application.cbBootstrap = new coldbox.system.Bootstrap(
			COLDBOX_CONFIG_FILE,
			COLDBOX_APP_ROOT_PATH,
			COLDBOX_APP_KEY,
			COLDBOX_APP_MAPPING
		);
		application.cbBootstrap.loadColdbox();
		this.ormEnabled = "true";
		return true;
	}

	// application end
	public boolean function onApplicationEnd( struct appScope ) {
		arguments.appScope.cbBootstrap.onApplicationEnd( arguments.appScope );
	}

	// request start
	public boolean function onRequestStart( string targetPage ){
		// If we reinit our app, reinit the ORM too
		//if( application.cbBootstrap.isFWReinit() )
		//	ormReload();
		
		// Process ColdBox Request
		application.cbBootstrap.onRequestStart( arguments.targetPage );
		return true;
	}


	public void function onSessionStart() {
		application.cbBootStrap.onSessionStart();
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ) {
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection = arguments );
	}

	public boolean function onMissingTemplate( template ) {
		return application.cbBootstrap.onMissingTemplate( argumentCollection = arguments );
	}

}
