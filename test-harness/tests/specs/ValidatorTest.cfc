component extends="coldbox.system.testing.BaseTestCase"{

/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
		super.beforeAll();
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
		super.afterAll();
	}

/*********************************** BDD SUITES ***********************************/

	function run( testResults, testBox ){
		// all your suites go here.
		describe( "Dumb Password Validator", function(){
			beforeEach(function( currentSpec ){
				setup();
				model = getWireBox().getInstance( "Validator@dumbpassword" );
			});

			it( "can validate nullness", function(){
				var result = createMock( "cbvalidation.models.result.ValidationResult" ).init();

				// null
				var r = model.validate(
					result,
					this,
					'password',
					javacast( "null", "" ),
					{}
				);
				expect(	r ).toBeFalse();
				expect(	result.hasErrors() ).toBeTrue();
			});

			it( "can validate empty passwords", function(){
				var result = createMock( "cbvalidation.models.result.ValidationResult" ).init();

				// null
				var r = model.validate(
					result,
					this,
					'password',
					"",
					{}
				);
				expect(	r ).toBeTrue();
				expect(	result.hasErrors() ).toBeFalse();
			});

			it( "can validate dumb passwords", function(){
				var result = createMock( "cbvalidation.models.result.ValidationResult" ).init();

				// null
				var r = model.validate(
					result,
					this,
					'password',
					"shadow",
					{}
				);
				expect(	r ).toBeFalse();
				expect(	result.hasErrors() ).toBeTrue();
			});

		});
	}

}