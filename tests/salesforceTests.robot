*** Settings ***
Resource                 ../resources/common.robot
Suite Setup              Setup Browser
Suite Teardown           End suite
Library                  FakerLibrary
Library                  QVision


*** Test Cases ***

Conquer PoC
    [Documentation]   Test Case created using the QEditor
    ${email_name} =   FakerLibrary.Sentence     nb_words=5
    ${mergefield} =   FakerLibrary.Text     max_nb_chars=10
    Cadence Management
    QVision.ClickText     Login with Salesforce
    ClickText         Email
    Sleep            1
    ClickText         New Template
    ClickText         New Merge Field
    Sleep            1
    TypeText          New Merge Field   ${mergefield}
    TypeText          Select Merge Field    First Name        anchor=2
    HotKey            Enter
    Sleep            1
    TypeText          Name              ${email_name}
    TypeText          Subject           This is the subject
    TypeText          Start typing to select profiles   System Administrator    sleep=2   
    HotKey            Enter                        sleep=2
    HotKey            Tab               sleep=3
    WriteText         Hello 
    QVision.ClickText     Merge             anchor=Font       timeout=5
    ClickText         ${mergefield}     anchor=Font       timeout=5
    WriteText         , 
    Hotkey            Enter
    Hotkey            Enter
    WriteText         This is the body of the email. 
    Sleep            1
    ClickText         Save
    ClickText         Cadences
    Sleep            2
    ClickText         Create Cadence
    Sleep            1
    ClickText         Cadence Options
    UseModal          status=on
    TypeText         Select an option                     Default    anchor=Business Hours*
    Sleep            2
    HotKey            Enter
    #ClickText         Default                        anchor="2"
    ClickText         Next                        sleep=1
    ClickText         Save
    UseModal          status=off
    ClickItem         fitview           timeout=5
    Sleep            1
    DragDrop          Email             Enroll Cadence Member     anchor=Steps      dragtime=5        below=300         loc_above=40
    ClickItem         fitview
    ClickText         Step information is incomplete
    Sleep            1
    TypeText          Step name*        Email Step
    TypeText          Instructions*     You need to send this ASAP
    TypeText          Email Template    ${email_name}
    HotKey            Enter
    ClickText         Save              anchor=Trace
    Sleep            1
    ClickText         Back to cadences
    ClickText         Yes
