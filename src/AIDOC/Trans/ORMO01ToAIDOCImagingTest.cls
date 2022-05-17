Class AIDOC.Trans.ORMO01ToAIDOCImagingTest Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, AIDOC.Msg.ImagingTestRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='AIDOC.Msg.ImagingTestRequest' sourceDocType='2.3:ORM_O01' create='new' language='objectscript' >
<assign value='source.{PIDgrp.PID:PatientIDInternalID().ID}' property='target.PatientIdentifier' action='set' />
<assign value='source.{ORCgrp(1).ORC:PlacerOrderNumber(1)}' property='target.AccessionNumber' action='set' />
</transform>
}

}
