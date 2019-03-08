/**
* ForgeBox API Test
*/
component extends="testbox.system.BaseSpec"{
	
/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
	}

/*********************************** BDD SUITES ***********************************/

	function run( testResults, testBox ){
		// all your suites go here.
		describe( "Dumb Password", function(){
			
			beforeEach(function( currentSpec ){
				service = new dumbpassword.models.PasswordService();
			});

			it( "can build the password array", function(){
				expect(	service ).toBeComponent();
				expect(	service.getPasswords() ).toBeArray()
					.notToBeEmpty();
			});

			it( "can test for dumb passwords", function(){
				expect(	service.isDumb( "shadow") ).toBeTrue();
				expect(	service.isDumb( createUUID() ) ).toBeFalse();
			});

		});
	}
	
}