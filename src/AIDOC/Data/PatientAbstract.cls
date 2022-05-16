/// An abstart class for info about a Patient
/// Used both by the persistent data element, and by the Interoperability request message
Class AIDOC.Data.PatientAbstract [ Abstract ]
{

/// Patient first name
Property FirstName As %String;

/// Patient last name
Property LastName As %String;

/// Patient date of birth
Property DOB As %Date;

/// Patient identifier (e.g. MRN or SSN)
Property PatientIdentifier As %String;

/// Patient Gender
Property Gender As %String;

}
