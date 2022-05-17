# OrIRISRepo

![image](https://user-images.githubusercontent.com/10142689/168611193-e7bf0be7-af19-4a15-8f12-ebb3c474c1b7.png)

## Basic Flow Description
- Service to accept HL7v2 messages (ADT_A01 & ORM_O01)
- Router Process to transform and send the data
- Operation to insert the data into tables

> ![image](https://user-images.githubusercontent.com/10142689/168612333-2540913e-cc8c-45f5-bcf4-4eb0068e2e97.png)

## Usage

### Installation / Import
Simply import the classes into your local Namespace.

(One of the classes will create a Web Application during the compilation process - /rest/aidocapi)

### Configuration
The Business Service `From EMR` by default looks for files in ```C:\Temp\HL7\In``` you can change this to a different suitable location by changing the `File Path` setting.

> ![image](https://user-images.githubusercontent.com/10142689/168745334-e9dc3004-4a11-41ae-9485-20e82f41fadc.png)


### Sample Flow

#### HL7 Input
* Place files into the `File Path` inout folder location. 

  There are some sample files in the `sample_data` folder.
E.g.:

  > ![image](https://user-images.githubusercontent.com/10142689/168631866-9793ac79-d15f-45aa-b215-c45834d2cce6.png)

There are 3 files in totoal
- ADT_A01.hl7: a patient named JAMES MASSIE (no related ORM for him)
- ADT_A01_Jane.hl7: a patient named Jane Doe - there is an ORM message related to her
- ORM_O01_Jane.hl7: an Order message for Jane Doe

#### Routing 

The messages will be routed according to their type - transformed accordingly and sent to the business operation:

> ![image](https://user-images.githubusercontent.com/10142689/168745543-f784cdc9-9f6f-4ccc-80b1-a968f557ae60.png)

#### Transformation

Each HL7v2 message will be transformed to the corresponding relevant Interoperability Request Message.

1. The ADT_A01 to an `AIDOC.Msg.PatientRequest` -

> ![image](https://user-images.githubusercontent.com/10142689/168746103-d94d05be-648c-439f-9e41-ccb1c2d523b4.png)

Using the `AIDOC.Trans.ADTA01ToAIDOCPatient` Transformation -

> ![image](https://user-images.githubusercontent.com/10142689/168746620-39144f2c-36c8-4b41-8d5f-847d68d24f13.png)

The transformation uses the ConvertDateTime() method to convert the HL7v2 Date of Birth format to the internal database format. E.g. `19560129` to `42031` (which is the internal representation of `1956-01-29`)

And the Lookup() method to convert the HL7v2 Gender value to a different relevant value. E.g. `M` to `Male`.

This is the Lookup table -

> ![image](https://user-images.githubusercontent.com/10142689/168845688-dcc933d8-18ee-428d-8b6e-273718163507.png)

This [is a reference](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=EBUS_UTILITY_FUNCTIONS) to the built-in utility functions.

2. And the ORM_O01 to an `AIDOC.Msg.ImagingTestRequest` -

> ![image](https://user-images.githubusercontent.com/10142689/168746269-d22823a3-5f6f-405a-aae0-eea31035cdd8.png)

Using the `AIDOC.Trans.ORMO01ToAIDOCImagingTest` Transformation -

> ![image](https://user-images.githubusercontent.com/10142689/168747256-7f1fe206-2b5f-4ede-896b-baa7b8eb132a.png)

This is a sample Visual Trace of the process:

> ![image](https://user-images.githubusercontent.com/10142689/168846446-06f60e35-5c76-474d-b3d5-b3f76fd3b901.png)

You can see the HL7v2 ADT_A01 message before the transformation, and after -

> ![image](https://user-images.githubusercontent.com/10142689/168846623-09e67b82-ed79-4cc8-b380-784a3347e94a.png)

#### Data Creation

The Business Operation takes care of accepting the relevant requests (Patient or ImagingTest) and creating a new record in the relevant table.
