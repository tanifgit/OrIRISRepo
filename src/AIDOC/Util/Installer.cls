Class AIDOC.Util.Installer Extends %Projection.AbstractProjection
{

Projection Reference As AIDOC.Util.Installer;

/// This method is called by the Class Compiler whenever an associated 
/// class has finished compiling. <var>classname</var> contains the name of 
/// the associated class while <var>parameters</var> contains an array of the 
/// projection parameters subscripted by parameter name. Also the special parameter value
/// parameters("%qstruct") contains a merge of the qstruct array this projection is being
/// compiled with. The <var>modified</var> is always blank.<br>
/// Any errors reported by this method are reported by the Class Compiler but
/// do not effect class compilation in any way.
ClassMethod CreateProjection(classname As %String, ByRef parameters As %String, modified As %String, qstruct) As %Status
{
    // initialize an OK status variable
	set status = $$$OK

    // set the current namespace name
	set ns = $Namespace
    
    // Output
    write !, "Creating AIDOC REST API in namespace " _ ns
    
    // trying to switch to %SYS namespace (needed to create Web Application)
    try {
        set $Namespace = "%SYS"
    } catch (e) {
        // If there was a problem return error
        set mes = "<PROTECT> The user " _ $Username _ " has no privileges"
            _ " to enter the %SYS namespace. Please, log in as a privileged user"
            _ " to set up the WebTerminal application."
        set status = $$$ERROR($$$GeneralError, mes)
        
        return status
    }
    
    // setup Web Application settings for creating web app
    set cspProperties("AutheEnabled") = $$$AutheCache
    set cspProperties("NameSpace") = ns
    set cspProperties("Description") = "A Web Application for AIDOC REST API"
    set cspProperties("IsNameSpaceDefault") = $$$NO
    set cspProperties("DispatchClass") = "AIDOC.REST.disp"

    set appName = "/rest/aidocapi"

    if ('##class(Security.Applications).Exists(appName)) {
        write !,"Creating Web Application """_appName_"""..."
        set status = ##class(Security.Applications).Create(appName, .cspProperties)
        write !, "Web application """_appName_""" was created with status: ",status,!
    } 
    
    return status
}

}
