; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS






[Setup]
AppName=Nexus Mod Manager - Legacy
AppID=6af12c54-643b-4752-87d0-8335503010de
AppVersion=0.52.4
AppVerName=Nexus Mod Manager - Legacy 0.52.4
AppCopyright=Copyright © Black Tree Gaming 2011-2013
VersionInfoVersion=0.52.4
VersionInfoCompany=Black Tree Gaming
AppPublisher=Black Tree Gaming
;AppPublisherURL=http://...
;AppSupportURL=http://...
;AppUpdatesURL=http://...
OutputBaseFilename=Nexus Mod Manager-legacy-0.52.4
DefaultGroupName=Nexus Mod Manager - Legacy
DefaultDirName={pf}\Nexus Mod Manager - Legacy
UninstallDisplayName=Nexus Mod Manager - Legacy
UninstallDisplayIcon={app}\NexusClient.exe,0
Uninstallable=true
UninstallFilesDir={app}\uninstall
DirExistsWarning=no
CreateAppDir=true
OutputDir=bin
SourceDir=.
AllowNoIcons=true
UsePreviousGroup=true
UsePreviousAppDir=true
LanguageDetectionMethod=uilanguage
InternalCompressLevel=Ultra64
SolidCompression=true
Compression=lzma2/Max
ChangesAssociations=true
LicenseFile=..\bin\Release\data\Licence.rtf
InfoBeforeFile=..\bin\Release\data\releasenotes.rtf
MinVersion=0,5.01
PrivilegesRequired=admin
ArchitecturesAllowed=x86 x64 ia64
ArchitecturesInstallIn64BitMode=x64 ia64
AppMutex=Global\6af12c54-643b-4752-87d0-8335503010de

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "de"; MessagesFile: "compiler:Languages\German.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: associateNxmFiles; Description: &Associate *.NXM files with Nexus Mod Manager - Legacy; GroupDescription: Other tasks:;
Name: associateNxmUrls; Description: Associate NXM: &URLs with Nexus Mod Manager - Legacy; GroupDescription: Other tasks:;
Name: associateFomodFiles; Description: &Associate *.FOMOD files with Nexus Mod Manager - Legacy; GroupDescription: Other tasks:;
Name: associateOmodFiles; Description: &Associate *.OMOD files with Nexus Mod Manager - Legacy; GroupDescription: Other tasks:;

[Files]
Source: "..\bin\Release\*.exe"; Excludes: "*.vshost.exe"; DestDir: {app}; Flags: ignoreversion
Source: "..\bin\Release\*.config"; Excludes: "*.vshost.exe.config"; DestDir: {app}; Flags: ignoreversion
Source: "..\bin\Release\*.dll"; DestDir: {app}; Flags: ignoreversion
Source: "..\bin\Release\data\*"; DestDir: {app}\data; Flags: ignoreversion recursesubdirs
Source: "..\bin\Release\GameModes\*"; DestDir: {app}\GameModes; Flags: ignoreversion recursesubdirs
Source: "..\bin\Release\ModFormats\*"; DestDir: {app}\ModFormats; Flags: ignoreversion recursesubdirs
Source: "..\bin\Release\ScriptTypes\*"; DestDir: {app}\ScriptTypes; Flags: ignoreversion recursesubdirs

[Icons]
Name: {group}\Nexus Mod Manager - Legacy; Filename: {app}\NexusClient.exe; WorkingDir: {app}
Name: {group}\Nexus Mod Manager - Legacy (Trace Mode); Filename: {app}\NexusClient.exe; Parameters: -trace; WorkingDir: {app}
Name: {group}\{cm:UninstallProgram,Nexus Mod Manager - Legacy}; Filename: {uninstallexe}; WorkingDir: {app}
Name: {commondesktop}\Nexus Mod Manager - Legacy; Filename: {app}\NexusClient.exe; Tasks: desktopicon; WorkingDir: {app}
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\Nexus Mod Manager - Legacy; Filename: {app}\NexusClient.exe; Tasks: quicklaunchicon; WorkingDir: {app}

[Run]
Filename: {app}\NexusClient.exe; Description: {cm:LaunchProgram,Nexus Mod Manager - Legacy}; Flags: nowait postinstall skipifsilent

[Registry]
;.nxm
Root: HKCR; Subkey: .nxm; ValueType: string; ValueName: ; ValueData: NXM_File_Type; Flags: uninsdeletekey; Tasks: associateNxmFiles
Root: HKCR; Subkey: NXM_File_Type; ValueType: string; ValueName: ; ValueData: Nexus Mod Manager - Legacy Mod Archive; Flags: uninsdeletekey; Tasks: associateNxmFiles
Root: HKCR; Subkey: NXM_File_Type\DefaultIcon; ValueType: string; ValueName: ; ValueData: {app}\NexusClient.exe,0; Tasks: associateNxmFiles
Root: HKCR; Subkey: NXM_File_Type\shell\open\command; ValueType: string; ValueName: ; ValueData: """{app}\NexusClient.exe"" ""%1"""; Tasks: associateNxmFiles
;URL support
Root: HKCR; Subkey: nxm; ValueType: string; ValueName: ; ValueData: "URL:Nexus Mod"; Flags: uninsdeletekey; Tasks: associateNxmUrls
Root: HKCR; Subkey: nxm; ValueType: string; ValueName: "URL Protocol"; ValueData: ; Tasks: associateNxmUrls
Root: HKCR; Subkey: nxm\DefaultIcon; ValueType: string; ValueName: ; ValueData: NexusClient.exe; Tasks: associateNxmUrls
Root: HKCR; Subkey: nxm\shell\open\command; ValueType: string; ValueName: ; ValueData: """{app}\NexusClient.exe"" ""%1"""; Tasks: associateNxmUrls
;.fomod
Root: HKCR; Subkey: .fomod; ValueType: string; ValueName: ; ValueData: FOMOD_File_Type; Flags: uninsdeletekey; Tasks: associateFomodFiles
Root: HKCR; Subkey: FOMOD_File_Type; ValueType: string; ValueName: ; ValueData: Fallout Mod Archive; Flags: uninsdeletekey; Tasks: associateFomodFiles
Root: HKCR; Subkey: FOMOD_File_Type\DefaultIcon; ValueType: string; ValueName: ; ValueData: {app}\NexusClient.exe,0; Tasks: associateFomodFiles
Root: HKCR; Subkey: FOMOD_File_Type\shell\open\command; ValueType: string; ValueName: ; ValueData: """{app}\NexusClient.exe"" ""%1"""; Tasks: associateFomodFiles
;.omod
Root: HKCR; Subkey: .omod; ValueType: string; ValueName: ; ValueData: OMOD_File_Type; Flags: uninsdeletekey; Tasks: associateFomodFiles
Root: HKCR; Subkey: OMOD_File_Type; ValueType: string; ValueName: ; ValueData: Oblivion Mod Archive; Flags: uninsdeletekey; Tasks: associateFomodFiles
Root: HKCR; Subkey: OMOD_File_Type\DefaultIcon; ValueType: string; ValueName: ; ValueData: {app}\NexusClient.exe,0; Tasks: associateFomodFiles
Root: HKCR; Subkey: OMOD_File_Type\shell\open\command; ValueType: string; ValueName: ; ValueData: """{app}\NexusClient.exe"" ""%1"""; Tasks: associateFomodFiles

[Files]
Source: "scripts\isxdl\isxdl.dll"; Flags: dontcopy

[Code]
procedure isxdl_AddFile(URL, Filename: PAnsiChar);
external 'isxdl_AddFile@files:isxdl.dll stdcall';

function isxdl_DownloadFiles(hWnd: Integer): Integer;
external 'isxdl_DownloadFiles@files:isxdl.dll stdcall';

function isxdl_SetOption(Option, Value: PAnsiChar): Integer;
external 'isxdl_SetOption@files:isxdl.dll stdcall';

[CustomMessages]
DependenciesDir=MyProgramDependencies

en.depdownload_msg=The following applications are required before setup can continue:%n%n%1%nDownload and install now?
de.depdownload_msg=Die folgenden Programme werden benötigt bevor das Setup fortfahren kann:%n%n%1%nJetzt downloaden und installieren?

en.depdownload_admin=An Administrator account is required installing these dependencies.%nPlease run this setup again using 'Run as Administrator' or install the following dependencies manually:%n%n%1%nClose this message and press Cancel to exit setup.
;de.depdownload_admin=

en.previousinstall_admin=This setup was previously run as Administrator. A non-administrator is not allowed to update in the selected location.%n%nPlease run this setup again using 'Run as Administrator'.%nClose this message and press Cancel to exit setup.
;de.previousinstall_admin=

en.depdownload_memo_title=Download dependencies
de.depdownload_memo_title=Abhängigkeiten downloaden

en.depinstall_memo_title=Install dependencies
de.depinstall_memo_title=Abhängigkeiten installieren

en.depinstall_title=Installing dependencies
de.depinstall_title=Installiere Abhängigkeiten

en.depinstall_description=Please wait while Setup installs dependencies on your computer.
de.depinstall_description=Warten Sie bitte während Abhängigkeiten auf Ihrem Computer installiert wird.

en.depinstall_status=Installing %1...
de.depinstall_status=Installiere %1...

en.depinstall_missing=%1 must be installed before setup can continue. Please install %1 and run Setup again.
de.depinstall_missing=%1 muss installiert werden bevor das Setup fortfahren kann. Bitte installieren Sie %1 und starten Sie das Setup erneut.

en.depinstall_error=An error occured while installing the dependencies. Please restart the computer and run the setup again or install the following dependencies manually:%n
de.depinstall_error=Ein Fehler ist während der Installation der Abghängigkeiten aufgetreten. Bitte starten Sie den Computer neu und führen Sie das Setup erneut aus oder installieren Sie die folgenden Abhängigkeiten per Hand:%n

en.isxdl_langfile=
de.isxdl_langfile=german2.ini


[Files]
Source: "scripts\isxdl\german2.ini"; Flags: dontcopy

[Code]
type
	TProduct = record
		File: String;
		Title: String;
		Parameters: String;
		InstallClean : Boolean;
		MustRebootAfter : Boolean;
        RequestRestart : Boolean;
	end;
	
var
	installMemo, downloadMemo, downloadMessage: string;
	products: array of TProduct;
	DependencyPage: TOutputProgressWizardPage;

	rebootRequired : boolean;
	rebootMessage : string;
  
procedure AddProduct(FileName, Parameters, Title, Size, URL: string; InstallClean : Boolean; MustRebootAfter : Boolean);
var
	path: string;
	i: Integer;
begin
	installMemo := installMemo + '%1' + Title + #13;
	
	path := ExpandConstant('{src}{\}') + CustomMessage('DependenciesDir') + '\' + FileName;
	if not FileExists(path) then begin
		path := ExpandConstant('{tmp}{\}') + FileName;
		
		isxdl_AddFile(URL, path);
		
		downloadMemo := downloadMemo + '%1' + Title + #13;
		downloadMessage := downloadMessage + '    ' + Title + ' (' + Size + ')' + #13;
	end;
	
	i := GetArrayLength(products);
	SetArrayLength(products, i + 1);
	products[i].File := path;
	products[i].Title := Title;
	products[i].Parameters := Parameters;
	products[i].InstallClean := InstallClean;
	products[i].MustRebootAfter := MustRebootAfter;
	products[i].RequestRestart := false;
end;

function GetProductcount: integer;
begin
    Result := GetArrayLength(products);
end;

function SmartExec(prod : TProduct; var ResultCode : Integer) : Boolean;
begin
    if (UpperCase(Copy(prod.File,Length(prod.File)-2,3)) <> 'EXE') then begin
        Result := ShellExec('', prod.File, prod.Parameters, '', SW_SHOWNORMAL, ewWaitUntilTerminated, ResultCode);
    end else begin
        Result := Exec(prod.File, prod.Parameters, '', SW_SHOWNORMAL, ewWaitUntilTerminated, ResultCode);
    end;
    if (ResultCode = 3010) then begin
        prod.RequestRestart := true;
        ResultCode := 0;
    end;
end;

function PendingReboot : Boolean;
var	Names: String;
begin
  if (RegQueryMultiStringValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Session Manager', 'PendingFileRenameOperations', Names)) then begin
      Result := true;
  end else if ((RegQueryMultiStringValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Session Manager', 'SetupExecute', Names)) and (Names <> ''))  then begin
		Result := true;
	end
	else begin
	  Result := false;
  end;		
end;

function InstallProducts: Boolean;
var
	ResultCode, i, productCount, finishCount: Integer;
begin
	Result := true;
	productCount := GetArrayLength(products);
		
	if productCount > 0 then begin
		DependencyPage := CreateOutputProgressPage(CustomMessage('depinstall_title'), CustomMessage('depinstall_description'));
		DependencyPage.Show;
		
		for i := 0 to productCount - 1 do begin
		    if ((products[i].InstallClean) and PendingReboot)  then begin
		        rebootRequired := true;
		        rebootmessage := products[i].Title;
		        exit;
		    end;
		  
		    DependencyPage.SetText(FmtMessage(CustomMessage('depinstall_status'), [products[i].Title]), '');
		    DependencyPage.SetProgress(i, productCount);
			
            if SmartExec(products[i], ResultCode) then begin
				if ResultCode = 0 then
					finishCount := finishCount + 1;
				if (products[i].MustRebootAfter = true) then begin
				    rebootRequired := true;
				    rebootmessage := products[i].Title;
				    if not PendingReboot then begin
  				        RegWriteMultiStringValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Session Manager', 'PendingFileRenameOperations', '');
                    end;
                    exit;
                end;
            end
			else begin
			    Result := false;
				break;
			end;
	    end;
		
		for i := 0 to productCount - finishCount - 1 do begin
			products[i] := products[i+finishCount];
		end;
		SetArrayLength(products, productCount - finishCount);
		
		DependencyPage.Hide;
	end;
end;


function PrepareToInstall(var NeedsRestart: Boolean): String;
var
	i: Integer;
	s: string;
begin
	if not InstallProducts() then begin
		s := CustomMessage('depinstall_error');
		
		for i := 0 to GetArrayLength(products) - 1 do begin
			s := s + #13 + '    ' + products[i].Title;
		end;
		
		Result := s;
	end
  else if (rebootrequired) then
	begin
	   Result := RebootMessage;
	   NeedsRestart := true;
	    RegWriteStringValue(HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce',
                           'InstallBootstrap', ExpandConstant('{srcexe}'));
	end;
end;


function NeedRestart : Boolean;
var i: integer;
begin
    result := false;
	for i := 0 to GetArrayLength(products) - 1 do
        result := result or products[i].RequestRestart;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
	s: string;
begin
	if downloadMemo <> '' then
		s := s + CustomMessage('depdownload_memo_title') + ':' + NewLine + FmtMessage(downloadMemo, [Space]) + NewLine;
	if installMemo <> '' then
		s := s + CustomMessage('depinstall_memo_title') + ':' + NewLine + FmtMessage(installMemo, [Space]) + NewLine;

	s := s + MemoDirInfo + NewLine + NewLine + MemoGroupInfo
	
	if MemoTasksInfo <> '' then
		s := s + NewLine + NewLine + MemoTasksInfo;

	Result := s
end;


function NextButtonClick(CurPageID: Integer): Boolean;
var pf: string;
begin
	Result := true;

    if (CurPageID = wpWelcome) and (not IsAdminLoggedOn()) and Result then begin
   
        if (Wizardform.PrevAppDir <> '') then begin
            pf := ExpandConstant('{pf}');
            if Copy(Wizardform.PrevAppDir,1,Length(pf)) = pf then begin
                SuppressibleMsgBox(CustomMessage('previousinstall_admin'), mbConfirmation, MB_OK, IDOK);
                Result := false;
            end;
        end;
    end;
    if (CurPageID = wpWelcome) and (GetArrayLength(products) > 0) and (not IsAdminLoggedOn()) and Result then begin
        SuppressibleMsgBox(FmtMessage(CustomMessage('depdownload_admin'), [downloadMessage]), mbConfirmation, MB_OK, IDOK);
        Result := false;
    end;
	if CurPageID = wpReady then begin

		if downloadMemo <> '' then begin
			if ActiveLanguage() <> 'en' then begin
				ExtractTemporaryFile(CustomMessage('isxdl_langfile'));
				isxdl_SetOption('language', ExpandConstant('{tmp}{\}') + CustomMessage('isxdl_langfile'));
			end;
			
			if SuppressibleMsgBox(FmtMessage(CustomMessage('depdownload_msg'), [downloadMessage]), mbConfirmation, MB_YESNO, IDYES) = IDNO then
				Result := false
			else if isxdl_DownloadFiles(StrToInt(ExpandConstant('{wizardhwnd}'))) = 0 then
				Result := false;
		end;
	end;
end;

function IsX64: Boolean;
begin
	Result := Is64BitInstallMode and (ProcessorArchitecture = paX64);
end;

function IsIA64: Boolean;
begin
	Result := Is64BitInstallMode and (ProcessorArchitecture = paIA64);
end;

function GetURL(x86, x64, ia64: String): String;
begin
	if IsX64() and (x64 <> '') then
		Result := x64;
	if IsIA64() and (ia64 <> '') then
		Result := ia64;
	
	if Result = '' then
		Result := x86;
end;

[Code]
var
	WindowsVersion: TWindowsVersion;
	
procedure initwinversion();
begin
	GetWindowsVersionEx(WindowsVersion);
end;

function exactwinversion(MajorVersion, MinorVersion: integer): boolean;
begin
	Result := (WindowsVersion.Major = MajorVersion) and (WindowsVersion.Minor = MinorVersion);
end;

function minwinversion(MajorVersion, MinorVersion: integer): boolean;
begin
	Result := (WindowsVersion.Major > MajorVersion) or ((WindowsVersion.Major = MajorVersion) and (WindowsVersion.Minor >= MinorVersion));
end;

function maxwinversion(MajorVersion, MinorVersion: integer): boolean;
begin
	Result := (WindowsVersion.Major < MajorVersion) or ((WindowsVersion.Major = MajorVersion) and (WindowsVersion.Minor <= MinorVersion));
end;

function exactwinspversion(MajorVersion, MinorVersion, SpVersion: integer): boolean;
begin
	if exactwinversion(MajorVersion, MinorVersion) then
		Result := WindowsVersion.ServicePackMajor = SpVersion
	else
		Result := true;
end;

function minwinspversion(MajorVersion, MinorVersion, SpVersion: integer): boolean;
begin
	if exactwinversion(MajorVersion, MinorVersion) then
		Result := WindowsVersion.ServicePackMajor >= SpVersion
	else
		Result := true;
end;

function maxwinspversion(MajorVersion, MinorVersion, SpVersion: integer): boolean;
begin
	if exactwinversion(MajorVersion, MinorVersion) then
		Result := WindowsVersion.ServicePackMajor <= SpVersion
	else
		Result := true;
end;
[Code]
function GetFullVersion(VersionMS, VersionLS: cardinal): string;
var
	version: string;
begin
	version := IntToStr(word(VersionMS shr 16));
	version := version + '.' + IntToStr(word(VersionMS and not $ffff0000));
	
	version := version + '.' + IntToStr(word(VersionLS shr 16));
	version := version + '.' + IntToStr(word(VersionLS and not $ffff0000));
	
	Result := version;
end;

function fileversion(file: string): string;
var
	versionMS, versionLS: cardinal;
begin
	if GetVersionNumbers(file, versionMS, versionLS) then
		Result := GetFullVersion(versionMS, versionLS)
	else
		Result := '0';
end;

[CustomMessages]
msi31_title=Windows Installer 3.1

en.msi31_size=2.5 MB
de.msi31_size=2,5 MB


[Code]
const
	msi31_url = 'http://download.microsoft.com/download/1/4/7/147ded26-931c-4daf-9095-ec7baf996f46/WindowsInstaller-KB893803-v2-x86.exe';

procedure msi31(MinVersion: string);
begin
	if minwinversion(5, 0) and (fileversion(ExpandConstant('{sys}{\}msi.dll')) < MinVersion) then
		AddProduct('msi31.exe',
			'/qb /norestart',
			CustomMessage('msi31_title'),
			CustomMessage('msi31_size'),
			msi31_url,false,false);
end;


[CustomMessages]
dotnetfx35sp1_title=.NET Framework 3.5 Service Pack 1

en.dotnetfx35sp1_size=3 MB - 232 MB
de.dotnetfx35sp1_size=3 MB - 232 MB


[Code]	
const
	dotnetfx35sp1_url = 'http://download.microsoft.com/download/0/6/1/061f001c-8752-4600-a198-53214c69b51f/dotnetfx35setup.exe';

procedure dotnetfx35sp1();
var
	version: cardinal;
begin
	RegQueryDWordValue(HKLM, 'Software\Microsoft\NET Framework Setup\NDP\v3.5', 'SP', version);
	if version < 1 then
		AddProduct('dotnetfx35sp1.exe',
			'/lang:enu /qb /norestart',
			CustomMessage('dotnetfx35sp1_title'),
			CustomMessage('dotnetfx35sp1_size'),
			dotnetfx35sp1_url,false,false);
end;

[CustomMessages]
win2000sp3_title=Windows 2000 Service Pack 3
winxpsp2_title=Windows XP Service Pack 2
winxpsp3_title=Windows XP Service Pack 3

