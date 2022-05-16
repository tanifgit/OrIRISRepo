/// A request for creating a new Imaging Test data element
Class AIDOC.Msg.ImagingTestRequest Extends (%Persistent, AIDOC.Data.ImagingTestAbstract, Ens.Request)
{

/// The identifier (e.g. MRN, SSN) of the patient. 
/// Used by Business Operation to relate the Test to the appropriate Patient
Property PatientIdentifier As %String;

Storage Default
{
<Data name="ImagingTestRequestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AccessionNumber</Value>
</Value>
<Value name="3">
<Value>PatientIdentifier</Value>
</Value>
</Data>
<DataLocation>^AIDOC.Msg.ImagingTestRequestD</DataLocation>
<DefaultData>ImagingTestRequestDefaultData</DefaultData>
<IdLocation>^AIDOC.Msg.ImagingTestRequestD</IdLocation>
<IndexLocation>^AIDOC.Msg.ImagingTestRequestI</IndexLocation>
<StreamLocation>^AIDOC.Msg.ImagingTestRequestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
