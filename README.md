# e3-opcUaUnifiedAutomation


* boost_reg and libxml2 should be installaed.

* Unified Automation SDK (Evaluation) should have the following structure :

```
 tree -L 1 /opt/ess/opcUa/
/opt/ess/opcUa/
├── [root     4.0K]  bin
├── [root     4.0K]  buildExamples.sh
├── [root     4.0K]  cmake
├── [root      810]  CMakeLists.txt
├── [root     4.0K]  doc
├── [root     4.0K]  examples
├── [root     4.0K]  include
├── [root     4.0K]  lib
├── [root     4.0K]  lic
└── [root      23K]  README.linux
```

It has the mixed libararies (static and shared) in lib, so one can meet many undefined symbols.
In that case, please tune UASDK_LIBS orders. The defined symbol should be in the last option
in linker option (Thank you, Ralph!)

