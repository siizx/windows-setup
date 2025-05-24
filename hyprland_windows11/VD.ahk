class VD {
    static DllPath := A_ScriptDir "\VirtualDesktopAccessor.dll"

    static SwitchToDesktop(n) {
        VD.EnsureDesktop(n)
        return DllCall(VD.DllPath "\GoToDesktopNumber", "int", n - 1)
    }

    static MoveWindowToDesktop(hWnd, n) {
        VD.EnsureDesktop(n)
        return DllCall(VD.DllPath "\MoveWindowToDesktopNumber", "ptr", hWnd, "int", n - 1)
    }

    static GetDesktopCount() {
        return DllCall(VD.DllPath "\GetDesktopCount")
    }

    static EnsureDesktop(n) {
        while (VD.GetDesktopCount() < n) {
            Send("^#d") ; Simula Win+Ctrl+D per creare un nuovo desktop
            Sleep(300)
        }
    }
}
