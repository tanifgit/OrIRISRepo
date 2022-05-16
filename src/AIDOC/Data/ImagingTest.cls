Class AIDOC.Data.ImagingTest Extends (%Persistent, AIDOC.Data.ImagingTestAbstract, %JSON.Adaptor, %XML.Adaptor)
{

/// Referring to the Patient
Relationship Patient As AIDOC.Data.Patient [ Cardinality = one, Inverse = Tests ];

/// A Unique index on the Accession Number
Index AccessionIdx On AccessionNumber [ Unique ];

/// An index on the Patient
Index PatientIdx On Patient;

Storage Default
{
<Data name="ImagingTestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AccessionNumber</Value>
</Value>
<Value name="3">
<Value>Patient</Value>
</Value>
</Data>
<DataLocation>^AIDOC.Data.ImagingTestD</DataLocation>
<DefaultData>ImagingTestDefaultData</DefaultData>
<IdLocation>^AIDOC.Data.ImagingTestD</IdLocation>
<IndexLocation>^AIDOC.Data.ImagingTestI</IndexLocation>
<StreamLocation>^AIDOC.Data.ImagingTestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
