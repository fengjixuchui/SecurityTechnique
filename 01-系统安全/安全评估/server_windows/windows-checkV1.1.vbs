'Author: autocreated 
Dim argu_count, args_dic, uuid, template_version
uuid = split(WScript.ScriptName, ".")(0)
template_time = "2016-7-11 18:50:12"
set args_dic = CreateObject("Scripting.Dictionary")
uservars = Array()
For Each var In uservars
inputvalue = Cstr(inputbox("" & var(0),var(0)))
args_dic.Add var(1), inputvalue
Next
dim obj_shell
set obj_shell = createobject("wscript.shell")
 dim init_cmd(125)

init_cmd(0) = obj_shell.run("cmd /c secedit /export /cfg %temp%\seclog.txt", 0, True) 
init_cmd(1) = obj_shell.run("cmd /c wmic computersystem get domainrole | find /i /v ""domainrole"" > %temp%\domainrole.txt", 0, True) 
Dim pre_cmd_dic
set pre_cmd_dic = CreateObject("Scripting.Dictionary")
pre_cmd_dic.Add "1", "cmd /c type %temp%\seclog.txt | find /i ""MinimumPasswordLength"" || echo MinimumPasswordLength = not config"
pre_cmd_dic.Add "2", "cmd /c type %temp%\seclog.txt | find /i ""PasswordComplexity"" || echo PasswordComplexity = not config"
pre_cmd_dic.Add "3", "cmd /c type %temp%\seclog.txt | find /i ""MinimumPasswordAge"" || echo MinimumPasswordAge = not config"
pre_cmd_dic.Add "4", "cmd /c type %temp%\seclog.txt | find /i ""NewAdministratorName"" || echo NewAdministratorName = not config"
pre_cmd_dic.Add "5", "cmd /c type %temp%\seclog.txt | find /i ""ResetLockoutCount"" || echo ResetLockoutCount = not config"
pre_cmd_dic.Add "6", "cmd /c type %temp%\seclog.txt | find /i ""LockoutBadCount"" || echo LockoutBadCount = not config"
pre_cmd_dic.Add "7", "cmd /c type %temp%\seclog.txt | find /i ""LockoutDuration"" || echo LockoutDuration = not config"
pre_cmd_dic.Add "8", "cmd /c type %temp%\seclog.txt | find /i ""PasswordHistorySize"" || echo PasswordHistorySize = not config"
pre_cmd_dic.Add "9", "cmd /c type %temp%\seclog.txt | find /i ""MaximumPasswordAge"" || echo MaximumPasswordAge = not config"
pre_cmd_dic.Add "10", "cmd /c type %temp%\seclog.txt | find /i ""EnableGuestAccount"" || echo EnableGuestAccount = not config"
pre_cmd_dic.Add "11", "cmd /c (type %temp%\domainrole.txt | findstr ""4 5"") || (reg query HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters /v NullSessionPipes)"
pre_cmd_dic.Add "12", "cmd /c (type %temp%\domainrole.txt | findstr ""4 5"") || (reg query HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters /v NullSessionShares)"
pre_cmd_dic.Add "13", "cmd /c type %temp%\seclog.txt | find /i ""SeTakeOwnershipPrivilege"" || echo SeTakeOwnershipPrivilege = not config"
pre_cmd_dic.Add "14", "cmd /c type %temp%\seclog.txt | find /i ""SeRemoteShutdownPrivilege"" || echo SeRemoteShutdownPrivilege = not config"
pre_cmd_dic.Add "15", "cmd /c type %temp%\seclog.txt | find /i ""SeShutdownPrivilege"" || echo SeShutdownPrivilege = not config"
pre_cmd_dic.Add "16", "cmd /c type %temp%\seclog.txt | find /i ""restrictanonymoussam"" || echo restrictanonymoussam = not config"
pre_cmd_dic.Add "17", "cmd /c type %temp%\seclog.txt | find /i ""RestrictAnonymous"" || echo RestrictAnonymous = not config"
pre_cmd_dic.Add "18", "cmd /c reg query ""HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\System"" /v MaxSize || echo MaxSize notfound not config"
pre_cmd_dic.Add "19", "cmd /c type %temp%\seclog.txt | find /i ""AuditLogonEvents"" || echo AuditLogonEvents = not config"
pre_cmd_dic.Add "20", "cmd /c type %temp%\seclog.txt | find /i ""AuditSystemEvents"" || echo AuditSystemEvents = not config"
pre_cmd_dic.Add "21", "cmd /c type %temp%\seclog.txt | find /i ""AuditAccountManage"" || echo AuditAccountManage = not config"
pre_cmd_dic.Add "22", "cmd /c type %temp%\seclog.txt | find /i ""AuditProcessTracking"" || echo AuditProcessTracking = not config"
pre_cmd_dic.Add "23", "cmd /c type %temp%\seclog.txt | find /i ""AuditPolicyChange"" || echo AuditPolicyChange = not config"
pre_cmd_dic.Add "24", "cmd /c type %temp%\seclog.txt | find /i ""AuditAccountLogon"" || echo AuditAccountLogon = not config"
pre_cmd_dic.Add "25", "cmd /c type %temp%\seclog.txt | find /i ""AuditDSAccess"" || echo AuditDSAccess = not config"
pre_cmd_dic.Add "26", "cmd /c type %temp%\seclog.txt | find /i ""AuditObjectAccess"" || echo AuditObjectAccess = not config"
pre_cmd_dic.Add "27", "cmd /c type %temp%\seclog.txt | find /i ""AuditPrivilegeUse"" || echo AAuditPrivilegeUse = not config"
pre_cmd_dic.Add "28", "cmd /c (net start | find /i ""SNMP Service"" && (reg query ""HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities"" /f ""public"" || echo NoPublic)) || echo NoSNMP"
pre_cmd_dic.Add "29", "cmd /c wmic service where name=""SimpTcp"" get state | find /i /v ""state"""
pre_cmd_dic.Add "30", "cmd /c wmic service where name=""DHCPServer"" get state | find /i /v ""state"""
pre_cmd_dic.Add "31", "cmd /c wmic service where name=""RasMan"" get state | find /i /v ""state"""
pre_cmd_dic.Add "32", "cmd /c reg query ""HKEY_LOCAL_MACHINE\software\microsoft\windows\currentversion\policies\system"" /v DisableCAD || echo DisableCAD notfound not config"
pre_cmd_dic.Add "33", "cmd /c reg query ""HKEY_LOCAL_MACHINE\software\microsoft\windows\currentversion\policies\system"" /v DontDisplayLastUserName || echo DontDisplayLastUserName notfound not config"
pre_cmd_dic.Add "34", "cmd /c reg query ""HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp"" /v fResetBroken || echo fResetBroken notfound not config"
pre_cmd_dic.Add "35", "cmd /c reg query ""HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer"" /v NoDriveTypeAutoRun || echo NoDriveTypeAutoRun notfound not config"
pre_cmd_dic.Add "36", "cmd /c (wmic os get DataExecutionPrevention_SupportPolicy || echo NoDEPWindows) | find /i /v ""DataExecutionPrevention_SupportPolicy"""
pre_cmd_dic.Add "37", "cmd /c net start | find /c ""Sophos"""
pre_cmd_dic.Add "38", "cmd /c wmic PROCESS list brief|find /c ""hfs"""
pre_keys = pre_cmd_dic.Keys
pre_values = pre_cmd_dic.Items
Dim appendix_cmd_dic
set appendix_cmd_dic = CreateObject("Scripting.Dictionary")
appendix_cmd_dic.Add "7", "cmd /c wmic process list brief"
appendix_keys = appendix_cmd_dic.Keys
appendix_values = appendix_cmd_dic.Items
 dim NIC1, Nic, StrIP, localIp
 dim appendix_keys,appendix_values,pre_keys,pre_values,i
 Set NIC1 = getObject("winmgmts:").InstancesOf("Win32_NetworkAdapterConfiguration")
 For Each Nic in NIC1
 if Nic.IPEnabled then
 StrIP = Nic.IPAddress(i)
 if Nic.ServiceName <> "VMnetAdapter" then
 localIp = StrIP
 end if
 end if
 next
 Dim curtime
 curtime=Year(Date)&"-"&Month(Date)&"-"&Day(Date)
 dim os
 Function OsVersion()
 Dim Edition, sp
 strComputer = "."
 Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
 Set colOperatingSystems = objWMIService.ExecQuery  ("Select * from Win32_OperatingSystem") 
 For Each objOperatingSystem in colOperatingSystems
 If Left (objOperatingSystem.Version, 3 ) = "5.0" Then
  os = "Windows 2000 "
 ElseIf Left(objOperatingSystem.Version, 3 ) = "5.1" Then
 os = "Windows XP "
 ElseIf Left(objOperatingSystem.Version, 3 ) = "5.2" Then
 os = "Windows 2003 "
 ElseIf Left(objOperatingSystem.Version, 3 ) = "6.0" Then
 os = "Windows Vista " 
 ElseIf Left(objOperatingSystem.Version, 3 ) = "6.1" Then
 os = "Windows 7 " 
 Else
 os = "Windows " 
 End If
 sp = objOperatingSystem.CSDVersion 
 Next
 OsVersion = os & sp 
 End Function 
Function GetHostName()
    Dim objNTInfo
    Set objNTInfo = CreateObject("WinNTSystemInfo")
    ComputerName = objNTInfo.ComputerName
    GetHostName = ComputerName
End Function
Dim sec_description
set sec_description = CreateObject("Scripting.Dictionary")
sec_description.Add "1","����Ƿ�����ȷ�������볤����Сֵ"
sec_description.Add "2", "����Ƿ����������븴����Ҫ��"
sec_description.Add "3", "����������ʹ������"
sec_description.Add "4", "����Ƿ�����������Ա�ʻ�����"
sec_description.Add "5", "��顰��λ�ʻ�������������ʱ��"
sec_description.Add "6", "����ʻ�������ֵ"
sec_description.Add "7", "����ʻ�����ʱ��"
sec_description.Add "8", "��顰ǿ��������ʷ������"
sec_description.Add "9", "����Ƿ�����ȷ���������ʹ������"
sec_description.Add "10", "����Ƿ��ѽ�������(Guest)�ʻ�"
sec_description.Add "11", "�����������ʵ������ܵ�"
sec_description.Add "12", "�����������ʵĹ���"
sec_description.Add "13", "��顰ȡ���ļ����������������Ȩ�����ʻ�����"
sec_description.Add "14", "���ɴ�Զ�˹ر�ϵͳ���ʻ�����"
sec_description.Add "15", "���ɹر�ϵͳ���ʻ�����"
sec_description.Add "16", "����Ƿ��ѽ�ֹSAM�ʻ�������ö��"
sec_description.Add "17", "����Ƿ��ѽ�ֹSAM�ʻ��͹��������ö��"
sec_description.Add "18", "����Ƿ�����ȷ���ð�ȫ��־"
sec_description.Add "19", "��顰��˵�¼�¼�������"
sec_description.Add "20", "��顰���ϵͳ�¼�������"
sec_description.Add "21", "��顰����ʻ���������"
sec_description.Add "22", "��顰��˽��̸��١�����"
sec_description.Add "23", "��顰��˲��Ը��ġ�����"
sec_description.Add "24", "��顰����ʻ���¼�¼�������"
sec_description.Add "25", "��顰���Ŀ¼������ʡ�����"
sec_description.Add "26", "��顰��˶�����ʡ�����"
sec_description.Add "27", "��顰�����Ȩʹ�á�����"
sec_description.Add "28", "����Ƿ���ɾ��SNMP�����Ĭ��public����"
sec_description.Add "29", "���Simple Mail Transport Protocol (SMTP)����״̬"
sec_description.Add "30", "���DHCP Server����״̬"
sec_description.Add "31", "���Remote Access Connection Manager����״̬"
sec_description.Add "32", "����Ƿ��ѽ��á���¼ʱ���밴 Ctrl+Alt+Del������"
sec_description.Add "33", "����Ƿ������á�����ʾ�����û���������"
sec_description.Add "34", "������������ͣ�Ựǰ����Ŀ���ʱ��"
sec_description.Add "35", "����Ƿ��Ѷ������������ر�Windows�Զ�����"
sec_description.Add "36", "��鵱ǰWindows����ִ�б���(DEP)�ȼ�"
sec_description.Add "37", "����Ƿ�װsophos���������"
sec_description.Add "38", "����Ƿ�װΥ���HFS"
sec_keys = sec_description.Keys
sec_values = sec_description.Items
Dim ip_uuid_xml
ip_uuid_xml = localIp & "_" & uuid & "_chk.xml"
Dim oADO 
Dim str_result
Set oADO = CreateObject("ADODB.Stream")
oADO.Charset = "utf-8"
oADO.Open
oADO.WriteText "<?xml version=""1.0"" encoding=""UTF-8""?>" &VbCrLf
oADO.WriteText "<result ip="""&localIp&""" uuid="""&uuid&""" template_time = """&template_time&""">" &VbCrLf
oADO.WriteText "    <security type=""���߼����"">" &VbCrLf
for i=0 to pre_cmd_dic.count -1
    oADO.WriteText "    <item flag="""&pre_keys(i)&""">" &VbCrLf
    oADO.WriteText "        <cmd info="""&curtime&""">" &VbCrLf
	oADO.WriteText "        <description="""&sec_values(i)&""">" &VbCrLf
    oADO.WriteText "            <command><![CDATA["
    oADO.WriteText """"&pre_values(i)&"""]]> "&VbCrLf
    oADO.WriteText "            </command>" &VbCrLf
    oADO.WriteText "            <value><![CDATA["
    set str_result = obj_shell.exec(pre_values(i)) 
    str_result.stdin.close 
    if str_result.exitcode = 0 then
            oADO.WriteText replace(str_result.stdout.readall, ">", "&gt;") &VbCrLf
    else
            oADO.WriteText "                 failed" &VbCrLf
    end if
    oADO.WriteText "            ]]></value>" &VbCrLf
    oADO.WriteText "        </cmd>" &VbCrLf
    oADO.WriteText "    </item>" &VbCrLf
next
oADO.Writetext "    </security>" &VbCrLf
oADO.Writetext "    <security type=""������Ϣ"">" &VbCrLf
Dim fso, Myfile, f2
Set fso = CreateObject("Scripting.FileSystemObject")
for i=0 to appendix_cmd_dic.count-1
    oADO.WriteText "    <item flag="""&appendix_keys(i)&""">" &VbCrLf
    oADO.WriteText "        <cmd info="""&curtime&""">" &VbCrLf
    oADO.WriteText "            <command><![CDATA["
    oADO.WriteText """"&appendix_values(i)&"""""]]>"&VbCrLf
    oADO.WriteText "            </command>" &VbCrLf
    oADO.WriteText "            <value><![CDATA["
    if len(appendix_values(i)) > 1000 then
      Set Myfile = fso.CreateTextFile("c:\appendix.bat", True)
      MyArray = Split(appendix_values(i), "[RRPP]", -1, 1)
      Myfile.writeline("@echo off")
      for Each line in MyArray
          Myfile.writeline(line)
      next
      Myfile.close()
      set str_result = obj_shell.exec("c:\appendix.bat")
    else
      set str_result = obj_shell.exec(appendix_values(i)) 
    end if
    str_result.stdin.close 
    if str_result.exitcode = 0 then
            oADO.WriteText replace(str_result.stdout.readall, ">", "&gt;") &VbCrLf
    else
            oADO.WriteText "                 failed" &VbCrLf
    end if
    oADO.WriteText "            ]]></value>" &VbCrLf
    oADO.WriteText "        </cmd>" &VbCrLf
    oADO.WriteText "        </item>" &VbCrLf
next
if fso.fileexists("c:\apendix.bat") then
    set f2 = fso.getfile("c:\appendix.bat")
    f2.delete
end if
if fso.fileexists("TempWmicBatchFile.bat") then
    set f2 = fso.getfile("TempWmicBatchFile.bat")
    f2.delete
end if

oADO.Writetext "    </security>" &VbCrLf
oADO.WriteText "</result>"
oADO.SaveToFile "c:\"&ip_uuid_xml, 2
oADO.close
