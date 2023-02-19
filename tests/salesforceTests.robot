*** Settings ***
Resource                 ../resources/common.robot
Suite Setup              Setup Browser
Suite Teardown           End suite
Library                  FakerLibrary
Library                  QVision


*** Test Cases ***

Conquer PoC
    [Documentation]      Test Case created using the QEditor
    ${email_name}=       FakerLibrary.Sentence       nb_words=5
    ${mergefield}=       FakerLibrary.Text           max_nb_chars=10
    Login
    QVision.ClickText    Login with Salesforce
    ClickText            Email
    ClickText            New Template
    ClickText            New Merge Field
    TypeText             New Merge Field             ${mergefield}
    TypeText             Select Merge Field          First Name                  anchor=2
    HotKey               Enter
    TypeText             Name                        ${email_name}
    TypeText             Subject                     This is a test
    TypeText             Start typing to select profiles                         System Administrator
    HotKey               Enter
    HotKey               Tab                         sleep=3
    WriteText            This is the subject line
    QVision.ClickText    Merge                       anchor=Font                 timeout=5
    ClickText            ${mergefield}               anchor=Font                 timeout=5
    ClickText            Save
    ClickText            Cadences
    ClickText            Create Cadence
    ClickText            Cadence Options
    TypeText             Select an option            Default
    HotKey               Enter
    TypeText             Select an option            HVS Public Group            anchor=Public Group Assignments
    HotKey               Enter
    ClickText            Next
    ClickText            Save
    ClickItem            fitview                     timeout=5
    DragDrop             Email                       Enroll Cadence Member       below=250                   loc_above=40    dragtime=5    anchor=Steps
    #DragDrop            Phone Call                  Enroll Cadence Member       below=250                   loc_above=70    dragtime=5    anchor=Steps
    #DragDrop            Custom                      Enroll Cadence Member       below=250                   loc_above=80    dragtime=5    anchor=Wait
    #DragDrop            Wait                        Enroll Cadence Member       below=250                   loc_above=80    dragtime=5
    ClickItem            fitview
    ClickText            Step information is incomplete
    TypeText             Step name*                  Email Step
    TypeText             Instructions*               You need to send this ASAP
    TypeText             Email Template              ${email_name}
    HotKey               Enter
    ClickText            Save                        anchor=Trace
    ClickText            Back to cadences
    ClickText            Yes