dlload /home/jhlee/private_gitsrc/opcUaClientSDK/lib/libuaclient.so

require opcUa, 0.0.1

epicsEnvSet ("IOC", "OPCUAIOC")
# local Softing test server
drvOpcuaSetup("opc.tcp://localhost:48010","","",0)
dbLoadRecords("OPCUA_RECORD.db")

opcuaDebug(3)
setIocLogDisable 1
iocInit
opcuaStat(0)

dbl > "${IOC}_PVs.list"



