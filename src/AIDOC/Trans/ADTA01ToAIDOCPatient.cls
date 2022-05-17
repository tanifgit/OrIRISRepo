Class AIDOC.Trans.ADTA01ToAIDOCPatient Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, AIDOC.Msg.PatientRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='AIDOC.Msg.PatientRequest' sourceDocType='2.3:ADT_A01' create='new' language='objectscript' >
<assign value='source.{PID:PatientName.familyname}' property='target.LastName' action='set' />
<assign value='source.{PID:PatientName.givenname}' property='target.FirstName' action='set' />
<assign value='..Piece(..ConvertDateTime(source.{PID:DateofBirth},"%Y%m%d","%q(3)"),",",1,1)' property='target.DOB' action='set' />
<assign value='source.{PID:PatientIDInternalID(1).ID}' property='target.PatientIdentifier' action='set' />
<assign value='..Lookup("Gender",source.{PID:Sex})' property='target.Gender' action='set' />
</transform>
}

}
