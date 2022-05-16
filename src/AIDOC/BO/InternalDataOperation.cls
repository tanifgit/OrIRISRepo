Class AIDOC.BO.InternalDataOperation Extends Ens.BusinessOperation
{

/// No need for an Adapter as using internal code/data
Parameter ADAPTER;

Parameter INVOCATION = "Queue";

Method CreatePatient(pRequest As AIDOC.Msg.PatientRequest, Output pResponse As Ens.Response) As %Status
{
    // instantiate a new Patient object
    set patient = ##class(AIDOC.Data.Patient).%New()
    // Not handling a case of an existing/update a Patient

    // populate the relevant properties, copying from the Request object
    set patient.FirstName = pRequest.FirstName
    set patient.LastName = pRequest.LastName
    set patient.DOB = pRequest.DOB
    set patient.PatientIdentifier = pRequest.PatientIdentifier
    set patient.Gender = pRequest.Gender

    // Save (persist) the object
    set status = patient.%Save()

    // return the Save status
    return status
}

Method CreateImagingTest(pRequest As AIDOC.Msg.ImagingTestRequest, Output pResponse As Ens.Response) As %Status
{
    // instantiate a new Imaging Test object
    set test = ##class(AIDOC.Data.ImagingTest).%New()
    // Not handling a case of an existing/update a Test

    // populate the relevant properties, copying from the Request object
    set test.AccessionNumber = pRequest.AccessionNumber
    
    // Open an existing Patient object based on the (Unique) Index defined on the Patient Identifier
    set patient = ##class(AIDOC.Data.Patient).IdentifierIdxOpen(pRequest.PatientIdentifier)

    if $ISOBJECT(patient) {
        // assuming we successfully opened the Patient object, point the property to that object reference
        set test.Patient = patient
    } else {
        // handle patient not found
    }

    // Save (persist) the object
    set status = test.%Save()

    // return the Save status
    return status
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="AIDOC.Msg.PatientRequest">
        <Method>CreatePatient</Method>
    </MapItem>
    <MapItem MessageType="AIDOC.Msg.ImagingTestRequest">
        <Method>CreateImagingTest</Method>
    </MapItem>
</MapItems>
}

}
