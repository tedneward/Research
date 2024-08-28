title=BridgeScript
tags=language
summary=A statically typed, platform independent programming language. 
~~~~~~

[Website](http://bridgescript.com/)

It's syntactically similar to C language. Bridge script does not have any built-in APIs in the interpreter. It provides mechanism to invoke external functions by defining a bridge (Library type) to invoke.

### Examples

#### Hello World
```
// Hello world! Example
 
include "include/console.bridge"

if (Console_Init()) {
 
    Console_Write("Hello World!\n");
    Console_Term();
}
```

#### Threads
threads.bridge:
```
include "include\\console.bridge";
 
function ui32 MyCallback(array<ui8>@ arg) {
    Console_Write("    MyCallback(" + arr2str(arg) + ")\n");
    return sizeof(arg);
}
 
struct MyData {
    i32 val1;
    i32 val2;
    function<MyCallback> fnCallback;
}; 
 
function ui32 DivBy0(ui32 arg) {
    ui32 i = 9;
    i = i / arg; 
//    error(e){
//        Console_Write("THREAD (" + kernel32.GetCurrentThreadId() + ") - ERROR: " + e.name + "\n"); 
//    } 
}
function bool Wrapper(ui32 arg) {
    DivBy0(0);
}
function ui32 MyThread0(MyData@ arg) {
    unlock(arg);
    Wrapper(1);
    error(e){
        Console_Write("THREAD (" + kernel32.GetCurrentThreadId() + ") - ERROR: " + e.name + "\n");
        Console_Write("---------------------------------------------------------------------------------------\n");
        Console_Write(e.trace + "\n");
        Console_Write("---------------------------------------------------------------------------------------\n");
    } 
 
    Console_Write("THREAD (" + kernel32.GetCurrentThreadId() + "): val1: " + arg.val1 + ", val2: " + arg.val2 + "\n");
    return arg.fnCallback(str2arr("in MyThread0()"));
}
function ui32 MyThread1(MyData@ arg) {
    unlock(arg); 
    Console_Write("THREAD (" + kernel32.GetCurrentThreadId() + "): val1: " + arg.val1 + ", val2: " + arg.val2 + "\n");
    return arg.fnCallback(str2arr("in MyThread1()"));
}
function ui32 MyThread2(MyData@ arg) {
    unlock(arg); 
    Console_Write("THREAD (" + kernel32.GetCurrentThreadId() + "): val1: " + arg.val1 + ", val2: " + arg.val2 + "\n");
    return arg.fnCallback(str2arr("in MyThread2()"));
}
 
array<MyData,3> data;
array<ui32,3>   htreadIds, handles;
array<function<MyThread0>,3> threadFoo;
 
Console_Init();
 
threadFoo[0] = MyThread0;
threadFoo[1] = MyThread1;
threadFoo[2] = MyThread2;
 
function ui32 CloseHandles(ui32 idx) {
    ui32 i = 0;
    for(; i <= idx; ++i) {
        kernel32.CloseHandle(handles[i]);
    }
    return 0;
}
 
ui32 i = 0;
for (; i < 3; ++i) {
    SECURITY_ATTRIBUTES sa;
    
    data[i].val1 = i;
    data[i].val2 = i + 100;
    data[i].fnCallback = MyCallback;
    lock(data[i]);
    handles[i] = kernel32.CreateThread(sa, 0, cast<function<ThreadDecl>>(threadFoo[i]), cast<ui32>(data[i]), 0, htreadIds[i]);
 
    if (handles[i] == 0) {
        CloseHandles(i);
        break;
    }
}
 
kernel32.WaitForMultipleObjects(3, handles, true, -1);
 
// Close all thread handles.
CloseHandles(2);
 
error(e){}
 
Console_Term();
```

include/console.bridge:
```
// Console API
 
include "kernel.bridge"
 
ui32 g_hConsoleStd;
 
function bool Console_Init() {
    if (kernel32.AllocConsole()) {
        g_hConsoleStd = kernel32.GetStdHandle(STD_OUTPUT_HANDLE);
 
        return g_hConsoleStd != -1 && g_hConsoleStd != 0;
    }
    return false;
}
 
function bool Console_Term() {
    return kernel32.FreeConsole();
}
 
function ui32 Console_Write(string@ txt) {
    array<ui8> pData @= str2arr(txt);
    ui32       lpNumberOfBytesWritten;
    OVERLAPPED overlapped;
 
    ui32 res = kernel32.WriteFile(g_hConsoleStd, pData, sizeof(pData), lpNumberOfBytesWritten, overlapped);
 
    return res;
}
```

include/kernel.bridge:
``` 
struct SECURITY_ATTRIBUTES {
    ui32   nLength;
    ui32   lpSecurityDescriptor;
    bool   bInheritHandle;
};
 
function ui32 ThreadDecl(ui32@ arg) { 
    return 0;
}
 
struct OVERLAPPED {
  /*ULONG_PTR*/ui32 Internal; // this is not real a pointer, 
                              // when the request is issued, the system sets this member to STATUS_PENDING 
                              // and status code for the completed request.
  /*ULONG_PTR*/ui32 InternalHigh; // this is not a pointer, 
                                  // the number of bytes transferred for the I/O request, its behavior may change! 
  struct DUMMY{
      /*DWORD*/ui32 Offset;
      /*DWORD*/ui32 OffsetHigh;
  } DUMMYSTRUCTNAME;
  /*HANDLE*/ui32 hEvent;
};
i32 STD_INPUT_HANDLE = -10;
i32 STD_OUTPUT_HANDLE = -11;
i32 STD_ERROR_HANDLE = -12;
 
lib("kernel32.dll") {
  ui32 GetLastError();
  ui32 GetCurrentProcess();
  ui32 GetModuleHandleA(array<ui8>@);//LPCSTR lpModuleName
  ui32 GetCurrentThreadId();
  ui32 CloseHandle(ui32);
  ui32 CreateThread(SECURITY_ATTRIBUTES@,
                    ui32,
                    function<ThreadDecl>,
                    ui32@,
                    ui32,
                    ui32@);
  ui32 WaitForMultipleObjects(ui32 /*nCount*/,
                              array<ui32>@/*lpHandles*/,
                              ui32/*bWaitAll*/,
                              ui32/*dwMilliseconds*/);
  
  ui32 AllocConsole(); // returns BOOL
  ui32 FreeConsole();  // returns BOOL
  ui32 GetStdHandle(ui32/*DWORD nStdHandle*/); // returns HANDLE, 
  /*
    STD_INPUT_HANDLE  (DWORD)-10
    STD_OUTPUT_HANDLE (DWORD)-11
    STD_ERROR_HANDLE  (DWORD)-12
  */
 
  /*BOOL*/ui32 WriteFile(/*HANDLE hFile*/ui32, 
                         /*LPCVOID lpBuffer*/ array<ui8>@,
                         /*DWORD nNumberOfBytesToWrite*/ ui32,
                         /*LPDWORD lpNumberOfBytesWritten*/ ui32@,
                         /*LPOVERLAPPED lpOverlapped*/OVERLAPPED@);
} kernel32;
```

#### Window
window.bridge:
```
include "include\\user32.bridge";
include "include/kernel.bridge";
 
function ui32 WindowProc(ui32 hwnd, ui32 uMsg, ui16 wParam, ui32 lParam) {
    switch (uMsg)
    {
    case 0x0002:
        user32.PostQuitMessage(0);
        return 0;
 
    case 0x000F:
        {
            PAINTSTRUCT ps;
            ui32 hdc = user32.BeginPaint(hwnd, ps);
            user32.FillRect(hdc, ps.rcPaint, COLOR_WINDOW+10);
            user32.EndPaint(hwnd, ps);
        }
        return 0;
 
    }
    return user32.DefWindowProcA(hwnd, uMsg, wParam, lParam);
}
 
function i32 wWinMain() {
    // Register the window class.
    array<ui8> CLASS_NAME @= str2arr("Sample Window Class");
    array<ui8> name @= str2arr("BridgeDebugger.exe");
    
    ui32 hInstance = kernel32.GetModuleHandleA(name);
    ui32 err = kernel32.GetLastError();
    WNDCLASS wc;
 
    wc.lpfnWndProc   = WindowProc;
    wc.hInstance     = hInstance;
    wc.lpszClassName = CLASS_NAME;
 
    user32.RegisterClassA(wc);
    err = kernel32.GetLastError();
    // Create the window.
 
    ui32 hwnd = user32.CreateWindowExA(
        0,                              // Optional window styles.
        CLASS_NAME,                     // Window class
        str2arr("Learn to Program Windows"),    // Window text
        WS_OVERLAPPEDWINDOW,            // Window style
 
        // Size and position
        CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
 
        NULL,       // Parent window    
        NULL,       // Menu
        hInstance,  // Instance handle
        NULL        // Additional application data
        );
    err = kernel32.GetLastError();
    if (hwnd == NULL)
    {
        user32.UnregisterClassA(CLASS_NAME,hInstance);
        return 0;
    }
    
    ui32 nCmdShow = SW_SHOW;
    user32.ShowWindow(hwnd, nCmdShow);
 
    // Run the message loop.
 
    MSG msg;
    while (user32.GetMessageA(msg, NULL, 0, 0))
    {
        user32.TranslateMessage(msg);
        user32.DispatchMessageA(msg);
    }
    error(e) {
    }
    user32.UnregisterClassA(CLASS_NAME,hInstance);
    return 0;
}
 
wWinMain();
```

include/uesr32.bridge:
```
function ui32 WNDPROC(ui32   hwnd, ui32   uMsg, ui16   wParam, ui32   lParam) { // default
    return 0;
}
 
struct POINT {
  i32 x;
  i32 y;
};
 
struct MSG {
  ui32   hwnd;
  i32    message;
  ui16   wParam;
  ui32   lParam;
  ui32   time;
  POINT  pt;
  ui32   lPrivate;
};
 
struct WNDCLASS {
  ui32      style;
  function<WNDPROC>   lpfnWndProc;
  i32       cbClsExtra;
  i32       cbWndExtra;
  ui32      hInstance;
  ui32      hIcon;
  ui32      hCursor;
  ui32      hbrBackground;
  array<ui8,100>@    lpszMenuName;
  array<ui8,100>@    lpszClassName;
};
 
struct RECT {
    ui32    left;
    ui32    top;
    ui32    right;
    ui32    bottom;
};
 
struct PAINTSTRUCT {
    ui32         hdc;
    ui32        fErase;
    RECT        rcPaint;
    ui32        fRestore;
    ui32        fIncUpdate;
    array<ui32,32> rgbReserved;
};
 
ui32 SW_SHOW = 5;
 
ui32 WS_OVERLAPPED  = 0x00000000,
     WS_CAPTION     = 0x00C00000,
     WS_SYSMENU     = 0x00080000,
     WS_THICKFRAME  = 0x00040000,
     WS_MINIMIZEBOX = 0x00020000,
     WS_MAXIMIZEBOX = 0x00010000;
 
ui32 WS_OVERLAPPEDWINDOW = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX;
ui32 CW_USEDEFAULT       = 0x80000000;
ui32 NULL = 0x00000000;
 
ui32 WM_DESTROY = 0x0002;
ui32 WM_PAINT   = 0x000F;
ui32 COLOR_WINDOW = 5;
 
lib("user32.dll") {
    ui32 RegisterClassA(WNDCLASS@);
    ui32 UnregisterClassA(array<ui8>@,//  LPCSTR    lpClassName,
                          ui32);//HINSTANCE hInstance
    ui32 PostQuitMessage(i32);// nExitCode
    ui32 CreateWindowExA(ui32, //dwExStyle,
                         array<ui8>@, //lpClassName,
                         array<ui8>@, //lpWindowName,
                         ui32, // dwStyle,
                         i32, //int       X,
                         i32, //int       Y,
                         i32, //int       nWidth,
                         i32, //int       nHeight,
                         ui32, //HWND      hWndParent,
                         ui32, //HMENU     hMenu,
                         ui32, //HINSTANCE hInstance,
                         ui32);//LPVOID    lpParam
    ui32 ShowWindow(ui32,//hWnd,
                    i32);//int  nCmdShow
    ui32 DefWindowProcA(ui32,//  HWND   hWnd,
                        i32,//UINT   Msg,
                        ui16,//WPARAM wParam,
                        ui32);//LPARAM lParam
    ui32 GetMessageA(MSG@,//lpMsg,
                    ui32,//  hWnd,
                    i32,//UINT  wMsgFilterMin,
                    i32);//UINT  wMsgFilterMax
    ui32 TranslateMessage(MSG@,);// *lpMsg
 
    ui32 DispatchMessageA(MSG@);// *lpMsg
    ui32 BeginPaint(ui32,//HWND          hWnd,
                    PAINTSTRUCT@);// lpPaint
    ui32 EndPaint(ui32,//HWND              hWnd,
                  PAINTSTRUCT@);// *lpPaint
    i32 FillRect(ui32,//HDC        hDC,
                 RECT@,// *lprc,
                 ui32);//HBRUSH     hbr
 
} user32;
```

include/kernel.bridge:
```
 
struct SECURITY_ATTRIBUTES {
    ui32   nLength;
    ui32   lpSecurityDescriptor;
    bool   bInheritHandle;
};
 
function ui32 ThreadDecl(ui32@ arg) { 
    return 0;
}
 
struct OVERLAPPED {
  /*ULONG_PTR*/ui32 Internal; // this is not real a pointer, 
                              // when the request is issued, the system sets this member to STATUS_PENDING 
                              // and status code for the completed request.
  /*ULONG_PTR*/ui32 InternalHigh; // this is not a pointer, 
                                  // the number of bytes transferred for the I/O request, its behavior may change! 
  struct DUMMY{
      /*DWORD*/ui32 Offset;
      /*DWORD*/ui32 OffsetHigh;
  } DUMMYSTRUCTNAME;
  /*HANDLE*/ui32 hEvent;
};
i32 STD_INPUT_HANDLE = -10;
i32 STD_OUTPUT_HANDLE = -11;
i32 STD_ERROR_HANDLE = -12;
 
lib("kernel32.dll") {
  ui32 GetLastError();
  ui32 GetCurrentProcess();
  ui32 GetModuleHandleA(array<ui8>@);//LPCSTR lpModuleName
  ui32 GetCurrentThreadId();
  ui32 CloseHandle(ui32);
  ui32 CreateThread(SECURITY_ATTRIBUTES@,
                    ui32,
                    function<ThreadDecl>,
                    ui32@,
                    ui32,
                    ui32@);
  ui32 WaitForMultipleObjects(ui32 /*nCount*/,
                              array<ui32>@/*lpHandles*/,
                              ui32/*bWaitAll*/,
                              ui32/*dwMilliseconds*/);
  
  ui32 AllocConsole(); // returns BOOL
  ui32 FreeConsole();  // returns BOOL
  ui32 GetStdHandle(ui32/*DWORD nStdHandle*/); // returns HANDLE, 
  /*
    STD_INPUT_HANDLE  (DWORD)-10
    STD_OUTPUT_HANDLE (DWORD)-11
    STD_ERROR_HANDLE  (DWORD)-12
  */
 
  /*BOOL*/ui32 WriteFile(/*HANDLE hFile*/ui32, 
                         /*LPCVOID lpBuffer*/ array<ui8>@,
                         /*DWORD nNumberOfBytesToWrite*/ ui32,
                         /*LPDWORD lpNumberOfBytesWritten*/ ui32@,
                         /*LPOVERLAPPED lpOverlapped*/OVERLAPPED@);
} kernel32;
```

include/console.bridge:
```
// Console API
 
include "kernel.bridge"
 
ui32 g_hConsoleStd;
 
function bool Console_Init() {
    if (kernel32.AllocConsole()) {
        g_hConsoleStd = kernel32.GetStdHandle(STD_OUTPUT_HANDLE);
 
        return g_hConsoleStd != -1 && g_hConsoleStd != 0;
    }
    return false;
}
 
function bool Console_Term() {
    return kernel32.FreeConsole();
}
 
function ui32 Console_Write(string@ txt) {
    array<ui8> pData @= str2arr(txt);
    ui32       lpNumberOfBytesWritten;
    OVERLAPPED overlapped;
 
    ui32 res = kernel32.WriteFile(g_hConsoleStd, pData, sizeof(pData), lpNumberOfBytesWritten, overlapped);
 
    return res;
}
```
