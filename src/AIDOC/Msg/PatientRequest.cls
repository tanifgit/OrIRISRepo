/// A request for creating a new Patient data element
Class AIDOC.Msg.PatientRequest Extends (%Persistent, AIDOC.Data.PatientAbstract, Ens.Request)
{

Storage Default
{
<Data name="PatientRequestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>DOB</Value>
</Value>
<Value name="5">
<Value>PatientIdentifier</Value>
</Value>
<Value name="6">
<Value>Gender</Value>
</Value>
</Data>
<DataLocation>^AIDOC.Msg.PatientRequestD</DataLocation>
<DefaultData>PatientRequestDefaultData</DefaultData>
<IdLocation>^AIDOC.Msg.PatientRequestD</IdLocation>
<IndexLocation>^AIDOC.Msg.PatientRequestI</IndexLocation>
<StreamLocation>^AIDOC.Msg.PatientRequestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
