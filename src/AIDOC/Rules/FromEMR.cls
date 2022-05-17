/// 
Class AIDOC.Rules.FromEMR Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="AIDOC.Rules.From EMR" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="AIDOCPOCPKG.FoundationProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="ADT A01 Messages" disabled="false">
<constraint name="docCategory" value="2.3"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="1">
<send transform="AIDOC.Trans.ADTA01ToAIDOCPatient" target="Internal Data"></send>
<return></return>
</when>
</rule>
<rule name="ORM O01 Messages" disabled="false">
<constraint name="docCategory" value="2.3"></constraint>
<constraint name="docName" value="ORM_O01"></constraint>
<when condition="1">
<send transform="AIDOC.Trans.ORMO01ToAIDOCImagingTest" target="Internal Data"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
