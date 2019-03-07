/**
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com
* ---
*/
component accessors="true" singleton{

	/**
	* The passwords array we scan
	*/
	property name="passwords" type="array";

	/**
	* Constructor
	*/
	function init(){
		var filePath = getDirectoryFromPath( getMetadata( this ).path ) & "passwords.txt";

		// Load up our passwords list and cache them
		variables.passwords = listToArray( fileRead( filePath ), chr( 13 ) & chr( 10 ) );

		return this;
	}

	/**
	* Verify if the passed password target is dumb or not.
	*/
	boolean function isDumb( required target ){
		return arrayContainsNoCase( variables.passwords, arguments.target );
	}

}
