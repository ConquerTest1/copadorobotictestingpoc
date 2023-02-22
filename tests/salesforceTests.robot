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
    ClickText         New Template
    ClickText         New Merge Field
    TypeText          New Merge Field   ${mergefield}
    TypeText          Select Merge Field    First Name        anchor=2
    HotKey            Enter
    TypeText          Name              ${email_name}
    TypeText          Subject           This is a test
    TypeText          Start typing to select profiles   System Administrator
    HotKey            Enter
    HotKey            Tab               sleep=3
    WriteText         Hello
    QVision.ClickText     Merge             anchor=Font       timeout=5
    ClickText         ${mergefield}     anchor=Font       timeout=5
    WriteText         , (end of body insert)
    ClickText         Save
    ClickText         Cadences
    ClickText         Create Cadence
    ClickText         Cadence Options
    UseModal          status=on
    TypeText         Select an option Def
    HotKey            Enter
    ClickText         Default
    ClickText         Next
    ClickText         Save
    UseModal          status=off
    ClickItem         fitview           timeout=5
    DragDrop          Email             Enroll Cadence Member     anchor=Steps      dragtime=5        below=300         loc_above=40
    ClickItem         fitview
    ClickText         Step information is incomplete
    TypeText          Step name*        Email Step
    TypeText          Instructions*     You need to send this ASAP
    TypeText          Email Template    ${email_name}
    HotKey            Enter
    ClickText         Save              anchor=Trace
    ClickText         Back to cadences
    ClickText         Yes
