# OrIRISRepo

![image](https://user-images.githubusercontent.com/10142689/168611193-e7bf0be7-af19-4a15-8f12-ebb3c474c1b7.png)

## Basic Flow Description
- Service to accept HL7v2 messages (ADT_A01 & ORM_O01)
- Router Process to transform and send the data
- Operation to insert the data into tables

![image](https://user-images.githubusercontent.com/10142689/168612333-2540913e-cc8c-45f5-bcf4-4eb0068e2e97.png)

## Usage

### Installation / Import
Simply import the classes into your local Namespace.

(One of the classes will create a Web Application during the compilation process - /rest/aidocapi)

### Configuration
The Business Service `From EMR` by default looks for files in ```C:\Temp\HL7\In``` you can change this to a different suitable location by changing the `File Path` setting.

### Sample Flow

#### HL7 Input
* Place files into the `File Path` inout folder location. 

  There are some sample files in the `sample_data` folder.
E.g.:

  ![image](https://user-images.githubusercontent.com/10142689/168631866-9793ac79-d15f-45aa-b215-c45834d2cce6.png)
