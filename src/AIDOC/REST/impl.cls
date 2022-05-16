/// An API for Aidoc data<br/>
/// Business logic class defined by OpenAPI in AIDOC.REST.spec<br/>
/// Updated May 16, 2022 14:52:14
Class AIDOC.REST.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
/// For testing purposes setting to 1, later in prod. env. can change to 0
Parameter ExposeServerExceptions = 1;

/// Search patients<br/>
/// The method arguments hold values for:<br/>
///     identifier<br/>
ClassMethod SearchPatients(identifier As %String) As %DynamicObject
{
    // set identifier to empty string if NULL
    set identifier = $GET(identifier,"")

    // create an SQL query, returning a JSON object from the returned records fields
    set sql = "SELECT JSON_OBJECT("_
                "'id':ID,'first_name':FirstName,'last_name':LastName,'dob':DOB,'gender':Gender,'patient_identifier':PatientIdentifier) "_
                "FROM AIDOC_Data.Patient "
    
    // if we got an identifier add a WHERE clause with the appropriate condition
    if (identifier'="") {
        set sql = sql _ " WHERE PatientIdentifier = ?"
    }

    // call the helper method to run the query and create the desired result
    set json = ..QueryRunnerHelper(sql,identifier)
    
    // return the 'json' result
    return json
}

/// Search imaging tests<br/>
/// The method arguments hold values for:<br/>
///     accessionNumber<br/>
///     patientIdentifier<br/>
/// WARNING: This method's signature has changed.
ClassMethod SearchTests(accessionNumber As %String, patientIdentifier As %String) As %DynamicObject
{
    // set accession number to empty string if NULL
    set accessionNumber = $GET(accessionNumber,"")

    // set patient identifier to empty string if NULL
    set patientIdentifier = $GET(patientIdentifier,"")

    // initialize the 'parameter' variable to an empry string, as default to send later to the helper method
    set parameter = ""

    // create an SQL query, returning a JSON object from the returned records fields
    set sql = "SELECT JSON_OBJECT("_
                "'id':ID,'accession_number':AccessionNumber,'patient_identifier':Patient->PatientIdentifier) "_
                "FROM AIDOC_Data.ImagingTest "
    
    // if we got an accession number add a WHERE clause with the appropriate condition
    if (accessionNumber'="") {
        set sql = sql _ " WHERE AccessionNumber = ?"

        // set the 'parameter' variable to the accession number to send to the helper method
        set parameter = accessionNumber

    // if we got a patient identifier add a WHERE clause with the appropriate condition
    } elseif (patientIdentifier'="") {
        set sql = sql _ " WHERE Patient->PatientIdentifier = ?"

        // set the 'parameter' variable to the patient identifier to send to the helper method
        set parameter = patientIdentifier
    }


    // call the helper method to run the query and create the desired result
    set json = ..QueryRunnerHelper(sql,parameter)

    // return the 'json' result
    return json
}

/// Description
ClassMethod QueryRunnerHelper(sql As %String, parameter1 As %String) As %DynamicObject
{
    // instantiaite an SQL Statement object to run the SQL query
    #dim statement As %SQL.Statement
    set statement = ##class(%SQL.Statement).%New()

    // prepare the query
    set status = statement.%Prepare(sql)

    // Execute the query, with or without the parameter
    #dim result As %SQL.StatementResult
    if (parameter1'="") {
        set result = statement.%Execute(parameter1)
    } else {
        set result = statement.%Execute()
    }

    // create a default 'json' variable for the rerurned results, as a Dynamic Array
    #dim json As %DynamicArray
    set json = []

    // if the SQLCODE is negative we got an error running the query
    if (result.%SQLCODE<0) {
        // return the error message as the returned JSON, and a 500 HTTP status
        
        set json = {"message":(result.%Message)}
        Do ..%SetStatusCode(500)

    } else {
        // if the SQLCODE is not negative, the query ran successfully, 
        //      and we might have found or not found matching results

        // initializing a 'found' variable to false (0)
        set found = 0

        // looping while we have more returned records
        while (result.%Next()) {

            // if we have at least one record, set the 'found' variable to true (1)
            set found = 1

            // set the 'patient' variable to the returned value (a JSON string)
            set patient = result.%GetData(1)

            // push the JSON (converting it to a Dynamic Object) into the 'json' array
            do json.%Push({}.%FromJSON(patient))
            
        }
        if (found) {
            // if we got results return a 200 (success) HTTP status
            Do ..%SetStatusCode(200)
        } else {
            // if we didn't find any matching results, return a 404 (object not found) HTTP status
            Do ..%SetStatusCode(404)
        } 
    }

    // return the 'json' result
    return json
}

/// Return a specific Patient by internal id<br/>
/// The method arguments hold values for:<br/>
///     id<br/>
/// Not implemented for now
ClassMethod GetPatientById(id As %String) As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

}
