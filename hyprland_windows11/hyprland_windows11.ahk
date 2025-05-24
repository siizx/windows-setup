#Requires AutoHotkey v2.0
#Include VD.ahk

; === CHIUDI FINESTRA ATTIVA ===
#q::
{
    hwnd := WinExist("A")
    if hwnd {
        WinClose(hwnd)
    } else {
        TrayTip("Errore", "Nessuna finestra attiva da chiudere", 1)
    }
}


; === TERMINALE PRIVILEGIATO ===
#Enter::Run("*RunAs wt.exe")

; === SWITCH TRA WORKSPACE ===
#1::VD.SwitchToDesktop(1)
#2::VD.SwitchToDesktop(2)
#3::VD.SwitchToDesktop(3)
#4::VD.SwitchToDesktop(4)
#5::VD.SwitchToDesktop(5)
#6::VD.SwitchToDesktop(6)
#7::VD.SwitchToDesktop(7)
#8::VD.SwitchToDesktop(8)
#9::VD.SwitchToDesktop(9)
#0::VD.SwitchToDesktop(10)

; === SPOSTA LA FINESTRA ATTIVA TRA WORKSPACE ===
#+1::VD.MoveWindowToDesktop(WinExist("A"), 1)
#+2::VD.MoveWindowToDesktop(WinExist("A"), 2)
#+3::VD.MoveWindowToDesktop(WinExist("A"), 3)
#+4::VD.MoveWindowToDesktop(WinExist("A"), 4)
#+5::VD.MoveWindowToDesktop(WinExist("A"), 5)
#+6::VD.MoveWindowToDesktop(WinExist("A"), 6)
#+7::VD.MoveWindowToDesktop(WinExist("A"), 7)
#+8::VD.MoveWindowToDesktop(WinExist("A"), 8)
#+9::VD.MoveWindowToDesktop(WinExist("A"), 9)
#+0::VD.MoveWindowToDesktop(WinExist("A"), 10)
