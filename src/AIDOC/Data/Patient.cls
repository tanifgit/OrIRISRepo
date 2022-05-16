Class AIDOC.Data.Patient Extends (%Persistent, AIDOC.Data.PatientAbstract, %JSON.Adaptor, %XML.Adaptor)
{

/// A Unique index on the Patient Identifier
Index IdentifierIdx On PatientIdentifier [ Unique ];

/// a refernce to the tests the patient is associated with
Relationship Tests As AIDOC.Data.ImagingTest [ Cardinality = many, Inverse = Patient ];

Storage Default
{
<Data name="PatientDefaultData">
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
<DataLocation>^AIDOC.Data.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<IdLocation>^AIDOC.Data.PatientD</IdLocation>
<IndexLocation>^AIDOC.Data.PatientI</IndexLocation>
<StreamLocation>^AIDOC.Data.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
