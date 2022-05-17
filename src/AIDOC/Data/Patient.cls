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
<ExtentSize>3</ExtentSize>
<IdLocation>^AIDOC.Data.PatientD</IdLocation>
<IndexLocation>^AIDOC.Data.PatientI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>4</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="FirstName">
<AverageFieldSize>6.33</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="Gender">
<AverageFieldSize>6.67</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="LastName">
<AverageFieldSize>6.33</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="PatientIdentifier">
<AverageFieldSize>9.67</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IdentifierIdx">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^AIDOC.Data.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
