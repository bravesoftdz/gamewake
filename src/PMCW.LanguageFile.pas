﻿{ *********************************************************************** }
{                                                                         }
{ PM Code Works Cross Plattform Language Handler Unit v2.1.3              }
{                                                                         }
{ Copyright (c) 2011-2017 Philipp Meisberger (PM Code Works)              }
{                                                                         }
{ *********************************************************************** }

unit PMCW.LanguageFile;

{$IFDEF FPC}{$mode delphi}{$ENDIF}

interface

uses
  Classes, SysUtils, Forms, Dialogs, Menus,
{$IFDEF MSWINDOWS}
{$WARN SYMBOL_PLATFORM OFF}
  Winapi.Windows, Winapi.CommCtrl, System.Generics.Collections, Winapi.ShellAPI,
  System.UITypes, System.NetEncoding;
{$ELSE}
  IniFiles;
{$ENDIF}

const
  { Flag indicating line feed }
  NEW_LINE                          = 1023;

  { The absolute start index of the first language. }
  FIRST_LANGUAGE_START_INDEX        = 100;

  { General language IDs }
  LID_WARNING                       = 1;
  LID_ERROR                         = 2;
  LID_QUESTION                      = 3;
  LID_INFORMATION                   = 4;
  LID_CANCEL                        = 6;
  LID_CANCELED                      = 7;
  LID_FINISHED                      = 8;
  LID_VIEW                          = 10;
  LID_HELP                          = 14;
  LID_ABOUT                         = 17;
  LID_FILE                          = 33;
  LID_IMPOSSIBLE                    = 18;
  LID_SELECT_LANGUAGE               = 25;
  LID_TO_WEBSITE                    = 29;
  LID_REPORT_BUG                    = 26;
  LID_REPORT_BUG_SUBJECT            = 19;
  LID_REPORT_BUG_BODY               = 20;
  LID_FATAL_ERROR                   = 31;
  LID_TECHNICAL_DETAILS             = 32;
  LID_FILTER_REGISTRY_FILE          = 36;

  { Update language IDs }
  LID_UPDATE                        = 5;
  LID_UPDATE_SELECT_DIR             = 9;
  LID_UPDATE_INSTALL                = 11;
  LID_UPDATE_NO_CONNECTION          = 12;
  LID_UPDATE_CHECK_CONNECTION       = 13;
  LID_UPDATE_SEARCH                 = 15;
  LID_UPDATE_AVAILABLE              = 21;
  LID_UPDATE_CONFIRM_DOWNLOAD       = 22;
  LID_UPDATE_DOWNLOAD               = 24;
  LID_UPDATE_NOT_AVAILABLE          = 23;
  LID_UPDATE_CANCELED               = 30;
  LID_UPDATE_64BIT                  = 34;
  LID_UPDATE_64BIT_CONFIRM          = 35;
  LID_UPDATE_SECURE                 = 37;
  LID_UPDATE_SECURE_DESCRIPTION1    = 38;
  LID_UPDATE_SECURE_DESCRIPTION2    = 39;

  { Certificate language IDs }
  LID_CERTIFICATE_INSTALL           = 16;
  LID_CERTIFICATE_INSTALL_CONFIRM   = 40;
  LID_CERTIFICATE_ALREADY_INSTALLED = 27;
  LID_CERTIFICATE_NO_CERTUTIL       = 28;

  { End mark of the predefined range }
  LID_LAST                          = 40;

type
  /// <summary>
  ///   The language exception class.
  /// </summary>
  ELanguageException = class(Exception);

{$IFDEF MSWINDOWS}
  /// <summary>
  ///   Possible icons in the balloon tip inside a <c>TEdit</c>.
  /// </summary>
  TBalloonIcon = (
    biNone, biInfo, biWarning, biError, biInfoLarge, biWarningLarge, biErrorLarge
  );

  /// <summary>
  ///   The language code.
  /// </summary>
  TLocale = Word;
{$ELSE}
  /// <summary>
  ///   The language code.
  /// </summary>
  TLocale = string;
{$ENDIF}
  /// <summary>
  ///   The identifier of a translation string.
  /// </summary>
  TLanguageId = Word;

  /// <summary>
  ///   Receive notfication when user changes the language of the current
  ///   application. Must be implemented by classes that use the
  ///   <see cref="TLanguageFile"/>.
  /// </summary>
  IChangeLanguageListener = interface
  ['{FF4AAD19-49DC-403B-8EA0-3E24D984B603}']
    /// <summary>
    ///   Sets the current UI language to the specified locale.
    /// </summary>
    /// <param name="ANewLanguage">
    ///   The new language that should be applied.
    /// </param>
    procedure SetLanguage(ANewLanguage: TLocale);
  end;

  /// <summary>
  ///   The <c>TLanguageFile</c> is a platform independent UI translater. It
  ///   uses language IDs to unique identify strings inside a StringTable or
  ///   INI file resource. It scans such a resource an identifies available
  ///   languages. A menu can be automatically created using the found languages.
  /// </summary>
  TLanguageFile = class(TObject)
  private
    FMenu: TMenuItem;
    FListeners: TInterfaceList;
    FLocale,
    FLangId: TLocale;
  {$IFDEF LINUX}
    FIni: TIniFile;
    FLanguages: TStringList;
  {$ELSE}
    FInterval: Word;
    FLanguages: TDictionary<TLanguageId, TLanguageId>;
    procedure OnHyperlinkClicked(Sender: TObject);
  {$ENDIF}
    procedure OnSelectLanguage(Sender: TObject);
  public
    /// <summary>
    ///   Constructor for creating a <c>TLanguageFile</c> instance.
    /// </summary>
    constructor Create({$IFDEF LINUX}AIniFile: string = ''{$ENDIF}); reintroduce; overload;

    /// <summary>
    ///   Constructor for creating a <c>TLanguageFile</c> instance.
    /// </summary>
    /// <param name="AOwner">
    ///   The owner that implements the <see cref="IChangeLanguageListener"/>
    ///   interface.
    /// </param>
    constructor Create(AListener: IChangeLanguageListener{$IFDEF LINUX}; AIniFile: string = ''{$ENDIF}); reintroduce; overload;

    /// <summary>
    ///   Destructor for destroying a <c>TLanguageFile</c> instance.
    /// </summary>
    destructor Destroy; override;

    /// <summary>
    ///   Adds a listener to the notification list.
    /// </summary>
    /// <param name="AListener">
    ///   A listener which implements the <see cref="IChangeLanguageListener"/> interface.
    /// </param>
    procedure AddListener(AListener: IChangeLanguageListener);

    /// <summary>
    ///   Builds a select language menu based on available languages.
    /// </summary>
    /// <param name="AMainMenu">
    ///   The application main menu to build the language menu in.
    /// </param>
    /// <param name="ARootMenuItem">
    ///   The language selection submenu root item.
    /// </param>
    procedure BuildLanguageMenu(AMainMenu: TMainMenu; ARootMenuItem: TMenuItem);

    /// <summary>
    ///   Changes the language.
    /// </summary>
    /// <param name="ALocale">
    ///   The locale to which the language should be changed.
    /// </param>
    procedure ChangeLanguage(ALocale: TLocale);

    /// <summary>
    ///   Embeds data into a single string by replacing a special flag starting
    ///   with <c>%</c> using a language ID.
    /// </summary>
    /// <param name="AIndex">
    ///   The language ID.
    /// </param>
    /// <param name="AArgs">
    ///   Arguments passed to <see cref="Format"/>.
    /// </param>
    /// <returns>
    ///   The formatted string.
    /// </returns>
    function Format(AIndex: TLanguageId; const AArgs: array of
      {$IFDEF FPC}const{$ELSE}TVarRec{$ENDIF}): string; overload;

    /// <summary>
    ///   Embeds data into a multiple strings by replacing a special flag
    ///   starting with <c>%</c> using language IDs.
    /// </summary>
    /// <param name="AIndices">
    ///   An array containing multiple language IDs.
    /// </param>
    /// <param name="AArgs">
    ///   Arguments passed to <see cref="Format"/>.
    /// </param>
    /// <returns>
    ///   The formatted string.
    /// </returns>
    function Format(AIndices: array of TLanguageId; const AArgs: array of
      {$IFDEF FPC}const{$ELSE}TVarRec{$ENDIF}): string; overload;
  {$IFDEF MSWINDOWS}
    /// <summary>
    ///   Shows a balloon tip inside an edit field with more comfortable usage.
    /// </summary>
    /// <param name="AEditHandle">
    ///   The handle to an <c>TEdit</c>.
    /// </param>
    /// <param name="ATitle">
    ///   The title to display.
    /// </param>
    /// <param name="AText">
    ///   The text to display.
    /// </param>
    /// <param name="AIcon">
    ///   A <see cref="TBalloonIcon"/> icon to use. Default is <c>biInfo</c>.
    /// </param>
    /// <returns>
    ///   <c>True</c> if balloon tip was shown successful or <c>False</c>
    ///   otherwise.
    /// </returns>
    function EditBalloonTip(AEditHandle: THandle; const ATitle, AText: WideString;
      AIcon: TBalloonIcon = biInfo): Boolean; overload;

    /// <summary>
    ///   Shows a balloon tip inside an edit field with more comfortable usage.
    /// </summary>
    /// <param name="AEditHandle">
    ///   The handle to an <c>TEdit</c>.
    /// </param>
    /// <param name="ATitle">
    ///   The language ID of a title to display.
    /// </param>
    /// <param name="AText">
    ///   The language ID of a text to display.
    /// </param>
    /// <param name="AIcon">
    ///   A <see cref="TBalloonIcon"/> icon to use. Default is <c>biInfo</c>.
    /// </param>
    /// <returns>
    ///   <c>True</c> if balloon tip was shown successful or <c>False</c>
    ///   otherwise.
    /// </returns>
    function EditBalloonTip(AEditHandle: THandle; ATitle, AText: TLanguageId;
      AIcon: TBalloonIcon = biInfo): Boolean; overload;

    /// <summary>
    ///   Gets the name of a language ID.
    /// </summary>
    /// <param name="ALanguage">
    ///   The language ID.
    /// </param>
    /// <returns>
    ///   The name.
    /// </returns>
    function GetLanguageName(ALanguage: TLanguageId): string;
  {$ENDIF}
    /// <summary>
    ///   Loads a single string from a StringTable resource based language file.
    /// </summary>
    /// <param name="AIndex">
    ///   The language ID.
    /// </param>
    /// <returns>
    ///   The string.
    /// </returns>
    function GetString(AIndex: TLanguageId): string; overload;

    /// <summary>
    ///   Loads multiple strings from a StringTable file based language file.
    /// </summary>
    /// <param name="AIndices">
    ///   An array containing multiple language IDs.
    /// </param>
    /// <returns>
    ///   The string.
    /// </returns>
    function GetString(AIndices: array of TLanguageId): string; overload;
  {$IFDEF LINUX}
    /// <summary>
    ///   Gets a the current used system language.
    /// </summary>
    /// <returns>
    ///   The language.
    /// </returns>
    function GetUserDefaultUILanguage(): string;
  {$ENDIF}
    /// <summary>
    ///   Loads available languages from language file.
    /// </summary>
    procedure Load();

    /// <summary>
    ///   Removes a listener from the notification list.
    /// </summary>
    /// <param name="AListener">
    ///   A listener which implements the <see cref="IChangeLanguageListener"/> interface.
    /// </param>
    procedure RemoveListener(AListener: IChangeLanguageListener);

    /// <summary>
    ///   Shows a message with text and specific look.
    /// </summary>
    /// <param name="AText">
    ///   The text to display.
    /// </param>
    /// <param name="AMessageType">
    ///   A <c>TMsgDlgType</c> to use.
    /// </param>
    /// <returns>
    ///   Which button the user has clicked.
    /// </returns>
    function ShowMessage(const AText: string;
      AMessageType: TMsgDlgType = mtInformation): Integer; overload;

    /// <summary>
    ///   Shows a message with text and specific look.
    /// </summary>
    /// <param name="ATitle">
    ///   The title to display.
    /// </param>
    /// <param name="AText">
    ///   The text to display.
    /// </param>
    /// <param name="AMessageType">
    ///   A <c>TMsgDlgType</c> to use.
    /// </param>
    /// <returns>
    ///   Which button the user has clicked.
    /// </returns>
    function ShowMessage(const ATitle, AText: string;
      AMessageType: TMsgDlgType = mtInformation): Integer; overload;

    /// <summary>
    ///   Shows a message with text and specific look.
    /// </summary>
    /// <param name="ATitle">
    ///   The language ID of a title to display.
    /// </param>
    /// <param name="AText">
    ///   The language ID of a text to display.
    /// </param>
    /// <param name="AMessageType">
    ///   A <c>TMsgDlgType</c> to use.
    /// </param>
    /// <returns>
    ///   Which button the user has clicked.
    /// </returns>
    function ShowMessage(ATitle, AText: TLanguageId;
      AMessageType: TMsgDlgType = mtInformation): Integer; overload;

    /// <summary>
    ///   Shows a message with multiple string text and specific look.
    /// </summary>
    /// <param name="ATitle">
    ///   The language ID of a title to display.
    /// </param>
    /// <param name="AIndices">
    ///   An array containing multiple language IDs.
    /// </param>
    /// <param name="AMessageType">
    ///   A <c>TMsgDlgType</c> to use.
    /// </param>
    /// <returns>
    ///   Which button the user has clicked.
    /// </returns>
    function ShowMessage(ATitle: TLanguageId; AIndices: array of TLanguageId;
      AMessageType: TMsgDlgType = mtInformation): Integer; overload;

    /// <summary>
    ///   Shows a message with multiple formatted string text and specific look.
    /// </summary>
    /// <param name="ATitle">
    ///   The language ID of a title to display.
    /// </param>
    /// <param name="AIndices">
    ///   An array containing multiple language IDs.
    /// </param>
    /// <param name="AArgs">
    ///   Arguments passed to <see cref="Format"/>.
    /// </param>
    /// <param name="AMessageType">
    ///   A <c>TMsgDlgType</c> to use.
    /// </param>
    /// <returns>
    ///   Which button the user has clicked.
    /// </returns>
    function ShowMessage(ATitle: TLanguageId; AIndices: array of TLanguageId;
      AArgs: array of const; AMessageType: TMsgDlgType = mtInformation): Integer; overload;

    /// <summary>
    ///   Shows an exception message with additional information.
    /// </summary>
    /// <param name="AText">
    ///   Text containing an error message.
    /// </param>
    /// <param name="AInformation">
    ///   Technical error details.
    /// </param>
    /// <param name="AOptions">
    ///   Additional <c>TTaskDialogFlags</c> to use.
    /// </param>
    procedure ShowException(const AText, AInformation: string{$IFDEF MSWINDOWS};
      AOptions: TTaskDialogFlags = []{$ENDIF});

    /// <summary>
    ///   The current used language.
    /// </summary>
    property Id: TLocale read FLangId;
  {$IFDEF MSWINDOWS}
    /// <summary>
    ///   An application defined interval between languages.
    /// </summary>
    property Interval: Word read FInterval write FInterval default 200;
  {$ENDIF}

    /// <summary>
    ///   The current locale.
    /// </summary>
    property Locale: TLocale read FLocale write ChangeLanguage;

    /// <summary>
    ///   Loads a single string from a StringTable resource based language file.
    /// </summary>
    property Strings[Index: TLanguageId]: string read GetString; default;
  end;

implementation

{$IFDEF MSWINDOWS}
{$R lang.res}
{$ENDIF}

{ TLanguageFile }

constructor TLanguageFile.Create({$IFDEF LINUX}AIniFile: string = ''{$ENDIF});
begin
  inherited Create;
  FListeners := TInterfaceList.Create;
{$IFDEF MSWINDOWS}
  FLanguages := TDictionary<TLanguageId, TLanguageId>.Create;
  FInterval := 200;
  FLangId := 0;
{$ELSE}
  FLanguages := TStringList.Create;
  FLanguages.Duplicates := dupIgnore;

  if (AIniFile = '') then
    AIniFile := ExtractFilePath(ParamStr(0)) +'lang';

  FIni := TIniFile.Create(AIniFile);
{$ENDIF}
  FLocale := GetUserDefaultUILanguage();
end;

constructor TLanguageFile.Create(AListener: IChangeLanguageListener{$IFDEF LINUX};
  AIniFile: string = ''{$ENDIF});
begin
  Create({$IFDEF LINUX}AIniFile{$ENDIF});
  AddListener(AListener);
end;

destructor TLanguageFile.Destroy;
begin
{$IFDEF LINUX}
  FreeAndNil(FIni);
{$ENDIF}
  FreeAndNil(FLanguages);
  FreeAndNil(FListeners);
  inherited Destroy;
end;

{$IFDEF MSWINDOWS}
procedure TLanguageFile.OnHyperlinkClicked(Sender: TObject);
begin
  // Try to send the report by mail client
  if (Sender is TTaskDialog) and (ShellExecute(0, 'open',
    PChar((Sender as TTaskDialog).URL), nil, nil, SW_SHOWNORMAL) <= 32) then
    // No mail client installed: Send it by report bug formular on website
    ShellExecute(0, 'open', 'http://www.pm-codeworks.de/kontakt.html', nil, nil, SW_SHOWNORMAL);
end;
{$ENDIF}

procedure TLanguageFile.OnSelectLanguage(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  ChangeLanguage((Sender as TMenuItem).Tag);
{$ELSE}
  ChangeLanguage((Sender as TMenuItem).Hint);
{$ENDIF}
end;

procedure TLanguageFile.AddListener(AListener: IChangeLanguageListener);
begin
  if Assigned(AListener) then
    FListeners.Add(AListener);
end;

procedure TLanguageFile.BuildLanguageMenu(AMainMenu: TMainMenu; ARootMenuItem: TMenuItem);
var
  MenuItem: TMenuItem;
{$IFDEF MSWINDOWS}
  Language: TLanguageId;
{$ELSE}
  i: Integer;
{$ENDIF}

begin
  if (FLangId = {$IFDEF MSWINDOWS}0{$ELSE}''{$ENDIF}) then
    Load();

  FMenu := ARootMenuItem;

  // Create submenu
{$IFDEF MSWINDOWS}
  for Language in FLanguages.Keys do
{$ELSE}
  for i := 0 to FLanguages.Count - 1 do
{$ENDIF}
  begin
    MenuItem := TMenuItem.Create(AMainMenu);

    with MenuItem do
    begin
      RadioItem := True;
    {$IFDEF MSWINDOWS}
      Tag := Language;
      Caption := GetLanguageName(Language);
      Checked := (FLocale = Language);
    {$ELSE}
      Hint := FLanguages.Names[i];
      Caption := FLanguages.ValueFromIndex[i];
      Checked := (FLocale = Hint);
    {$ENDIF}
      OnClick := OnSelectLanguage;
    end;  //of with

    ARootMenuItem.Add(MenuItem);
  end;  //of for

  // Try to select current user language
  ChangeLanguage(FLocale);
end;

procedure TLanguageFile.ChangeLanguage(ALocale: TLocale);
var
  LocaleId: TLocale;
  i: Integer;
  Listener: IChangeLanguageListener;

begin
  LocaleId := ALocale;

  // Load default language
{$IFDEF MSWINDOWS}
  if not FLanguages.ContainsKey(LocaleId) then
  begin
    LocaleId := MAKELANGID(LANG_ENGLISH, SUBLANG_DEFAULT);

    // Language file contains no default language?
    if not FLanguages.ContainsKey(LocaleId) then
      raise ELanguageException.Create('No default language found in language file!');
  end;  //of begin

  FLangId := FLanguages[LocaleId];
{$ELSE}
  if (FLanguages.Values[LocaleId] = '') then
  begin
    LocaleId := 'en_US';

    // Language file contains no default language?
    if (FLanguages.Values[LocaleId] = '') then
      raise ELanguageException.Create('No default language found in language file!');
  end;  //of begin

  FLangId := FLanguages.Values[LocaleId];
{$ENDIF}
  FLocale := LocaleId;

  if Assigned(FMenu) then
  begin
    // Select language visual
    for i := 0 to FMenu.Count - 1 do
    {$IFDEF MSWINDOWS}
      if (FMenu[i].Tag = LocaleId) then
    {$ELSE}
      if (FMenu[i].Hint = LocaleId) then
    {$ENDIF}
      begin
        FMenu[i].Checked := True;
        Break;
      end;  //of begin
  end;  //of begin

  // Notify all listeners
  for i := 0 to FListeners.Count - 1 do
    if Supports(FListeners[i], IChangeLanguageListener, Listener) then
      Listener.SetLanguage(ALocale);
end;

{$IFDEF MSWINDOWS}
function TLanguageFile.EditBalloonTip(AEditHandle: THandle; const ATitle,
  AText: WideString; AIcon: TBalloonIcon = biInfo): Boolean;
var
  BalloonTip: TEditBalloonTip;

begin
  ZeroMemory(@BalloonTip, SizeOf(TEditBalloonTip));

  with BalloonTip do
  begin
    cbStruct := SizeOf(BalloonTip);
    pszTitle := PChar(ATitle);
    pszText := PChar(AText);
    ttiIcon := Ord(AIcon);
  end;  //of with

  Result := Edit_ShowBalloonTip(AEditHandle, BalloonTip);
end;

function TLanguageFile.EditBalloonTip(AEditHandle: THandle; ATitle, AText: TLanguageId;
  AIcon: TBalloonIcon): Boolean;
begin
  Result := EditBalloonTip(AEditHandle, GetString(ATitle), GetString(AText), AIcon);
end;
{$ENDIF}

function TLanguageFile.Format(AIndex: TLanguageId; const AArgs: array of
  {$IFDEF FPC}const{$ELSE}TVarRec{$ENDIF}): string;
begin
  Result := SysUtils.Format(GetString(AIndex), AArgs);
end;

function TLanguageFile.Format(AIndices: array of TLanguageId;
  const AArgs: array of {$IFDEF FPC}const{$ELSE}TVarRec{$ENDIF}): string;
var
  i: Integer;
  Text: string;

begin
  Text := '';

  for i := 0 to Length(AIndices) -1 do
    if (AIndices[i] = NEW_LINE) then
      Text := Text + sLineBreak
    else
      Text := Text + Format(AIndices[i], AArgs);

  Result := Text;
end;

{$IFDEF MSWINDOWS}
function TLanguageFile.GetLanguageName(ALanguage: TLanguageId): string;
var
  Buffer: array[0..MAX_PATH-1] of Char;

begin
  VerLanguageName(MAKELANGID(ALanguage, SUBLANG_DEFAULT), @Buffer[0], Length(Buffer));
  Result := Buffer;
end;

function TLanguageFile.GetString(AIndex: TLanguageId): string;
var
  Buffer: array[0..79] of Char;
  Error: DWORD;

begin
  if (LoadString(HInstance, FLangId + AIndex, Buffer, SizeOf(Buffer)) = 0) then
  begin
    Error := GetLastError();

    // ERROR_INVALID_WINDOW_HANDLE will be raised on Windows XP
    if ((Error <> ERROR_SUCCESS) and (Error <> ERROR_INVALID_WINDOW_HANDLE)) then
      raise ELanguageException.Create(SysUtils.Format(SysErrorMessage(
        ERROR_RESOURCE_LANG_NOT_FOUND) +'. ID %d (Error %d)', [AIndex, Error]));
  end;  //of begin

  Result := Buffer;
end;
{$ELSE}
function TLanguageFile.GetString(AIndex: TLanguageId): string;
begin
  Result := FIni.ReadString(FLangId, IntToStr(AIndex + FIRST_LANGUAGE_START_INDEX), '');
end;
{$ENDIF}

function TLanguageFile.GetString(AIndices: array of TLanguageId): string;
var
  i: Integer;
  Text: string;

begin
  Text := '';

  for i := 0 to Length(AIndices) - 1 do
    if (AIndices[i] = NEW_LINE) then
      Text := Text + sLineBreak
    else
      Text := Text + GetString(AIndices[i]);

  Result := Text;
end;

{$IFDEF LINUX}
function TLanguageFile.GetUserDefaultUILanguage(): string;
begin
  Result := Copy(SysUtils.GetEnvironmentVariable('LANG'), 1, 5);
end;
{$ENDIF}

procedure TLanguageFile.Load();
{$IFDEF MSWINDOWS}
var
  Language: TLanguageId;
  Buffer: array[0..4] of Char;

begin
  Language := FIRST_LANGUAGE_START_INDEX;

  while (LoadString(HInstance, Language, Buffer, SizeOf(Buffer)) <> 0) do
  begin
    FLanguages.Add(StrToInt(Buffer), Language);
    Inc(Language, FInterval);
  end;  //of while

  // Set language ID
  FLangId := FLanguages[FLocale];
{$ELSE}
var
  Languages: TStrings;
  i: Integer;

begin
  Languages := TStringList.Create;

  try
    FIni.ReadSections(Languages);

    for i := 0 to Languages.Count - 1 do
      FLanguages.CommaText := FLanguages.CommaText + FIni.ReadString(Languages[i],
        IntToStr(FIRST_LANGUAGE_START_INDEX), '') +'='+ Languages[i]+',';

    FLanguages.CommaText := Copy(FLanguages.CommaText, 0, Length(FLanguages.CommaText) - 1);

  finally
    Languages.Free;
  end;

  // Set language ID
  FLangId := FLanguages.Values[FLocale];
{$ENDIF}
end;

procedure TLanguageFile.RemoveListener(AListener: IChangeLanguageListener);
begin
  if Assigned(AListener) then
    FListeners.Remove(AListener);
end;

function TLanguageFile.ShowMessage(const AText: string;
  AMessageType: TMsgDlgType = mtInformation): Integer;
begin
  Result := ShowMessage('', AText, AMessageType);
end;

function TLanguageFile.ShowMessage(const ATitle, AText: string;
  AMessageType: TMsgDlgType = mtInformation): Integer;
var
  Buttons: TMsgDlgButtons;
{$IFDEF MSWINDOWS}
  DefaultButton: TMsgDlgBtn;
{$ENDIF}

begin
{$IFDEF MSWINDOWS}
  DefaultButton := mbOK;
{$ENDIF}

  case AMessageType of
    mtInformation:
      begin
        Buttons := [mbOK];
      {$IFDEF MSWINDOWS}
        DefaultButton := mbOK;
        MessageBeep(MB_ICONINFORMATION);
      {$ENDIF}
      end;

    mtWarning:
      begin
        Buttons := [mbOK];
      {$IFDEF MSWINDOWS}
        MessageBeep(MB_ICONWARNING);
      {$ENDIF}
      end;

    mtConfirmation:
      begin
        Buttons := mbYesNo;
      {$IFDEF MSWINDOWS}
        DefaultButton := mbYes;
        MessageBeep(MB_ICONWARNING);
      {$ENDIF}
      end;

    mtCustom:
      begin
        Buttons := mbYesNo;
      {$IFDEF MSWINDOWS}
        DefaultButton := mbNo;
      {$ENDIF}
        AMessageType := mtWarning;
      end;

    mtError:
      begin
        Buttons := [mbClose];
      {$IFDEF MSWINDOWS}
        DefaultButton := mbClose;
        MessageBeep(MB_ICONERROR);
      {$ENDIF}
      end;
  end;  //of case

{$IFDEF MSWINDOWS}
  if (Win32MajorVersion >= 6) then
    Result := TaskMessageDlg(ATitle, AText, AMessageType, Buttons, 0, DefaultButton)
  else
    Result := MessageDlg(ATitle + sLineBreak + AText, AMessageType, Buttons, 0);
{$ELSE}
  if (ATitle <> '') then
    Result := MessageDlg(ATitle + sLineBreak + AText, AMessageType, Buttons, 0)
  else
    Result := MessageDlg(AText, AMessageType, Buttons, 0);
{$ENDIF}
end;

function TLanguageFile.ShowMessage(ATitle, AText: TLanguageId;
  AMessageType: TMsgDlgType = mtInformation): Integer;
begin
  Result := ShowMessage(GetString(ATitle), GetString(AText), AMessageType);
end;

function TLanguageFile.ShowMessage(ATitle: TLanguageId; AIndices: array of TLanguageId;
  AMessageType: TMsgDlgType = mtInformation): Integer;
begin
  Result := ShowMessage(GetString(ATitle), GetString(AIndices), AMessageType);
end;

function TLanguageFile.ShowMessage(ATitle: TLanguageId; AIndices: array of TLanguageId;
  AArgs: array of const; AMessageType: TMsgDlgType = mtInformation): Integer;
begin
  Result := ShowMessage(GetString(ATitle), Format(AIndices, AArgs), AMessageType);
end;

procedure TLanguageFile.ShowException(const AText, AInformation: string{$IFDEF MSWINDOWS};
  AOptions: TTaskDialogFlags = []{$ENDIF});
{$IFDEF MSWINDOWS}
const
  URL_MAILTO = '<a href="mailto:%s?subject=%s&body=%s">%s</a>';

var
  TaskDialog: TTaskDialog;
  MailSubject, MailBody: string;

  function URLEncode(const AString: string): string;
  begin
    Result := TNetEncoding.URL.Encode(AString);
    // Embarcadero encodes spaces as '+' which is generally correct but not in
    // mailto hyperlinks: there it must be '%20' to generate a correct mail!
    Result := StringReplace(Result, '+', '%20', [rfReplaceAll]);
  end;

begin
  // TaskDialogIndirect only possible for Windows >= Vista!
  if (Win32MajorVersion < 6) then
  begin
    ShowMessage(GetString(LID_FATAL_ERROR) +': '+ AText + sLineBreak +
      AInformation, mtError);
    Exit;
  end;  //of begin

  TaskDialog := TTaskDialog.Create(nil);

  try
    with TaskDialog do
    begin
      Caption := Application.Title;
      MainIcon := tdiError;
      Title := GetString(LID_FATAL_ERROR);
      Text := AText;
      ExpandedText := AInformation;
      ExpandButtonCaption := GetString(LID_TECHNICAL_DETAILS);
      MailSubject := URLEncode(Format(LID_REPORT_BUG_SUBJECT, [Application.Title]));
      MailBody := URLEncode(Format(LID_REPORT_BUG_BODY, [AText, AInformation]));
      FooterText := SysUtils.Format(URL_MAILTO, ['team@pm-codeworks.de', MailSubject,
        MailBody, GetString(LID_REPORT_BUG)]);
      Flags := [tfExpandFooterArea, tfEnableHyperlinks] + AOptions;
      CommonButtons := [tcbClose];
      OnHyperlinkClicked := Self.OnHyperlinkClicked;
    end;  //of with

    MessageBeep(MB_ICONERROR);

    if not TaskDialog.Execute() then
      ShowMessage(GetString(LID_FATAL_ERROR) +': '+ AText + sLineBreak +
        AInformation, mtError);

  finally
    TaskDialog.Free;
  end;  //of try
{$ELSE}
begin
  ShowMessage(GetString(LID_FATAL_ERROR) +': '+ AText + sLineBreak + AInformation,
    mtError);
{$ENDIF}
end;

end.