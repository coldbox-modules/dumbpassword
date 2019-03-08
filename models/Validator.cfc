/**
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com
* ---
*/
component accessors="true" implements="cbvalidation.models.validators.IValidator" singleton{

	// Injection
	property name="passwordService" inject="passwordService@dumbpassword";

	// Validator Name
	property name="name";

	Validator function init(){
		name = "DumbPassword";
		return this;
	}

	/**
	* Will check if an incoming value validates
	* @validationResult.hint The result object of the validation
	* @target.hint The target object to validate on
	* @field.hint The field on the target object to validate on
	* @targetValue.hint The target value to validate
	* @validationData.hint The validation data the validator was created with
	*/
	boolean function validate(
		required cbvalidation.models.result.IValidationResult validationResult,
		required any target,
		required string field,
		any targetValue,
		any validationData
	){
		// null checks
		if( isNull( arguments.targetValue ) ){
			var args = {
				message 		= "The '#arguments.field#' value is null",
				field 			= arguments.field,
				validationType 	= getName(),
				validationData	= arguments.validationData
			};
			validationResult.addError( validationResult.newError( argumentCollection=args ) );
			return false;
		}

		// Only validate simple values and if they have length, else ignore.
		if( isSimpleValue( arguments.targetValue ) AND len( trim( arguments.targetValue ) ) ){
			// validate dumb passwords
			if( passwordService.isDumb( arguments.targetValue ) ){
				var args = {
					message			= "The '#arguments.field#' is just too common. Please try another.",
					field 			= arguments.field,
					validationType	= getName(),
					validationData	= arguments.validationData, 
					rejectedValue	= arguments.targetValue
				};
				validationResult.addError( validationResult.newError( argumentCollection=args ) );
				return false;
			}
		}

		return true;
	}

	/**
	* Get the name of the validator
	*/
	string function getName(){
		return name;
	}

}
