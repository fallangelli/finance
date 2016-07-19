unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, Ora, DateUtils, OraScript, StrUtils,
  OdacVcl, Buttons, ExtDlgs, DAScript, Grids, ValEdit, IniFiles, OraSmart,
  DBGrids, activex;

type
  TForm1 = class(TForm)
    OraSession1: TOraSession;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ConnectDialog1: TConnectDialog;
    Label1: TLabel;
    Label2: TLabel;
    OraQuery5: TOraQuery;
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    OraQuery1: TOraQuery;
    OraQuery2: TOraQuery;
    OraScript1: TOraScript;
    OraScript2: TOraScript;
    OraQuery3: TOraQuery;
    OraQuery4: TOraQuery;
    OraQuery6: TOraQuery;
    OraQuery7: TOraQuery;
    OraQuery8: TOraQuery;
    OraScript3: TOraScript;
    OraScript5: TOraScript;
    OraQuery9: TOraQuery;
    OraQuery10: TOraQuery;
    OraQuery11: TOraQuery;
    OraScript7: TOraScript;
    OraScript9: TOraScript;
    OraQuery12: TOraQuery;
    BitBtn4: TBitBtn;
    OraQuery13: TOraQuery;
    OraQuery14: TOraQuery;
    OraQuery15: TOraQuery;
    OraQuery16: TOraQuery;
    OraQuery17: TOraQuery;
    OraQuery18: TOraQuery;
    OraQuery19: TOraQuery;
    OraQuery20: TOraQuery;
    OraScript6: TOraScript;
    OraScript10: TOraScript;
    btn_showpro: TBitBtn;
    orscrpt_merge_pc: TOraScript;
    orscrpt_update_headquarter_orgcode_pc: TOraScript;
    orscrpt_merge_ec: TOraScript;
    orscrpt_update_headquarter_orgcode_ec: TOraScript;
    btn_merge: TButton;
    orqry_check_merge_result: TOraQuery;
    dbgrd_result: TDBGrid;
    ds_result: TDataSource;
    lbl_result: TLabel;
    lbl_log: TLabel;
    btn_check_merge: TButton;
    btn_check_split: TButton;
    orqry_check_split_result: TOraQuery;
    lbl_status: TLabel;
    btnExport: TBitBtn;
    OraScript8: TOraScript;
    OraScript4: TOraScript;
    procedure WriteLog(LogContent: string);
    function WinExecAndWait(FileName: string; Visibility: integer): Thandle;
    procedure DropTable(TableName: string);
    procedure expdata(path: string; sort: integer);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure OpenDialog1Show(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btn_showproClick(Sender: TObject);
    procedure btn_mergeClick(Sender: TObject);
    procedure btn_check_mergeClick(Sender: TObject);
    procedure btn_check_splitClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
          { Private declarations }
  public

  end;

procedure SetItemDisable(disable: Boolean);
var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.WriteLog(LogContent: string);
var
  F: TextFile;
  DateTimeString: string;
begin
  ForceDirectories(extractfilepath(paramstr(0)) + 'LOG');
  DateTimeToString(DateTimeString, 'yyyy-mm-dd', now());
  Assignfile(F, extractfilepath(paramstr(0)) + 'LOG\ar_log' + DateTimeString + '.txt');
  if FileExists(extractfilepath(paramstr(0)) + 'LOG\ar_log' + DateTimeString + '.txt') then Append(F) else Rewrite(F);
  Writeln(F, DateTimeToStr(Now));
  Writeln(F, LogContent);
  CloseFile(F);
  Memo1.Lines.Add(DateTimeToStr(Now) + '  ' + LogContent);
end;


function TForm1.WinExecAndWait(FileName: string; Visibility: Integer): Thandle;
var
  zAppName: array[0..512] of char;
  zCurDir: array[0..255] of char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb := Sizeof(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil, zAppName, nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo) then
  begin
    Result := 0;
    Exit;
  end
  else
  begin
    WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess, Result);
  end;
end;


procedure SetItemDisable(disable: Boolean);
begin
  if disable then
  begin
    Form1.lbl_status.Font.Color := clGreen;
    Form1.lbl_status.Caption := '执行完毕！';
  end
  else begin
    Form1.lbl_status.Font.Color := clRed;
    Form1.lbl_status.Caption := '运行中......'
  end;

  Form1.ComboBox1.Enabled := disable;
  Form1.ComboBox2.Enabled := disable;
  Form1.BitBtn2.Enabled := disable;
  Form1.btn_showpro.Enabled := disable;
  Form1.btn_merge.Enabled := disable;
  Form1.btn_check_merge.Enabled := disable;
  Form1.btnExport.Enabled := disable;
  Form1.BitBtn1.Enabled := disable;
  Form1.BitBtn3.Enabled := disable;
  Form1.BitBtn4.Enabled := disable;
  Form1.btn_check_split.Enabled := disable;
  Form1.ComboBox1.Enabled := disable;
  Form1.ComboBox2.Enabled := disable;
end;

procedure TForm1.DropTable(TableName: string);
var
  OraQueryDrop: TOraQuery;
begin
  OraQueryDrop := TOraQuery.Create(nil);
  OraQueryDrop.SQL.Clear;
  OraQueryDrop.SQL.Add('select count(*) as num from user_objects t where t.object_type = ''TABLE'' and t.object_name = ''' + UpperCase(Trim(TableName)) + '''');
  OraQueryDrop.ExecSQL;
  if OraQueryDrop.FieldByName('NUM').AsInteger > 0 then
  begin
    OraQueryDrop.SQL.Clear;
    OraQueryDrop.SQL.Add('Drop Table ' + Trim(TableName) + ' cascade constraints');
    WriteLog('开始删除表' + TableName);
    OraQueryDrop.ExecSQL;
    WriteLog('完成删除表' + TableName);
  end;
  OraQueryDrop.Free;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBox1.Text := IntToStr(YearOf(Now() - DayOf(Now()) - 1));
  ComboBox2.Text := IntToStr(MonthOf(Now() - DayOf(Now()) - 1));
end;


function procImportDmp(p: Pointer): Integer; stdcall;
var
  name, path, CommandStr: string;
  read_ini: TIniFile;
  tns: string;
begin
  SetItemDisable(false);

  read_ini := tinifile.Create(extractfilepath(paramstr(0)) + 'config.ini');
  tns := read_ini.ReadString('Connect_Data', 'tns', '');

  name := extractfilename(Form1.OpenDialog1.FileName);
  path := extractfiledir(Form1.OpenDialog1.FileName);

    //ShellExecute(handle, nil, pchar(name), nil,pchar(path),SW_SHOW);
  CommandStr := 'imp ' + Form1.OraSession1.Username + '/' + Form1.OraSession1.Password + '@' + tns + ' file=' + path + '\' + name + ' full=y ignore=y ';
  Form1.WriteLog(commandStr);
  Form1.WinExecAndWait(CommandStr, 0);

       //showmessage(commandStr)  ;
  SetItemDisable(true);
  Result := 1;
end;


procedure TForm1.BitBtn2Click(Sender: TObject);
var
  ID: DWORD;
begin
  if OpenDialog1.Execute then
  begin
    CreateThread(nil, 0, @procImportDmp, nil, 0, ID);
  end;
end;

procedure TForm1.expdata(path: string; sort: integer);
var
  CommandStr: string;
  tns: string;
  read_ini: TIniFile;
begin
  read_ini := tinifile.Create(extractfilepath(paramstr(0)) + 'config.ini');
  tns := read_ini.ReadString('Connect_Data', 'tns', '');

  ForceDirectories(path);
      //ForceDirectories('D:\ExportData');
  if sort = 1 then
  begin
    CommandStr := 'exp ' + OraSession1.Username + '/' + OraSession1.Password + '@' + tns + ' tables=(feelog_ec_' + ComboBox1.Text + RightStr(('0' + ComboBox2.Text), 2) + ') grants=n indexes=n constraints=n ';
    CommandStr := CommandStr + ' file=' + path + '\feelog_ec_' + ComboBox1.Text + RightStr(('0' + ComboBox2.Text), 2) + '.dmp ';
    WinExecAndWait(CommandStr, 0);
  end;
  if sort = 0 then
  begin
    CommandStr := 'exp ' + OraSession1.Username + '/' + OraSession1.Password + '@' + tns + ' tables=(feelog_pc_' + ComboBox1.Text + RightStr(('0' + ComboBox2.Text), 2) + ') grants=n indexes=n constraints=n ';
    CommandStr := CommandStr + ' file=' + path + '\feelog_pc_' + ComboBox1.Text + RightStr(('0' + ComboBox2.Text), 2) + '.dmp ';
    WinExecAndWait(CommandStr, 0);
  end;
       //showmessage(commandStr)  ;
end;



procedure TForm1.OpenDialog1Show(Sender: TObject);
begin
  SetDlgItemText(GetParent(OpenDialog1.Handle), IDOK, '导入');
end;


function procGeneralOrgTable(p: Pointer): Integer; stdcall;
begin
  Result := 1;

  SetItemDisable(False);

  Form1.DropTable('pc_org_temp');
  Form1.DropTable('pc_org_temp_tree');

  Form1.WriteLog('开始生成个人机构表');
  Form1.WriteLog(Form1.OraScript1.SQL.Text);
  Form1.OraScript1.Execute;
  Form1.WriteLog('结束生成个人机构表');


  Form1.DropTable('ec_org_temp');
  Form1.DropTable('ec_org_temp_tree');
  Form1.WriteLog('开始生成企业机构表');
  Form1.WriteLog(Form1.OraScript2.SQL.Text);
  Form1.OraScript2.Execute;
  Form1.WriteLog('结束生成企业机构表');

  SetItemDisable(True);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  ID: Dword;
begin
  CreateThread(nil, 0, @procGeneralOrgTable, nil, 0, ID);
end;


function procMergeOrg(p: Pointer): Integer; stdcall;
var
  condition: string;
  types: string;
  read_ini: TIniFile;
  s1: TStringList;
  i: Integer;
begin
  Result := 0;
  s1 := TStringList.Create;

  read_ini := tinifile.Create(extractfilepath(paramstr(0)) + 'config.ini');
  types := read_ini.ReadString('Split_Keyword', 'words', '');
  s1.Delimiter := ',';
  s1.DelimitedText := types;

  for i := 0 to s1.Count - 1 do
  begin
    condition := condition + ' OR INSTR (f.headquarter_orgname, ''' + s1[i] + ''') > 0';
  end;

  SetItemDisable(False);


  Form1.WriteLog('配置文件内容:' + condition);

  Form1.OraQuery1.MacroByName('rural_feelog_ec_temp1').Value := 'rural_feelog_ec_temp1_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraQuery1.MacroByName('feelog_ec').Value := 'feelog_ec_' + Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.DropTable('rural_feelog_ec_temp1_' + Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2));
  //添加按配置文件查找的内容
  Form1.OraQuery1.MacroByName('condition').Value := condition;
  Form1.WriteLog(Form1.OraQuery1.SQL.Text);
  Form1.OraQuery1.ExecSQL;

  Form1.OraQuery2.MacroByName('rural_feelog_pc_temp1').Value := 'rural_feelog_pc_temp1_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraQuery2.MacroByName('feelog_pc').Value := 'feelog_pc_' + Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2); ;
  Form1.DropTable('rural_feelog_pc_temp1_' + Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2));
  //按配置文件 添加指定关键字
  Form1.OraQuery2.MacroByName('condition').Value := condition;
  Form1.WriteLog(Form1.OraQuery2.SQL.Text);
  Form1.OraQuery2.ExecSQL;

  //自动配置fee_org
  Form1.WriteLog('开始合并企业机构');
  Form1.orscrpt_merge_ec.MacroByName('rural_feelog_ec_temp1').Value := 'rural_feelog_ec_temp1_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.orscrpt_merge_ec.MacroByName('condition').Value := condition;
  Form1.WriteLog(Form1.orscrpt_merge_ec.SQL.Text);
  Form1.orscrpt_merge_ec.Execute;
  Form1.WriteLog('结束合并企业机构');


  Form1.WriteLog('开始合并个人机构');
  Form1.orscrpt_merge_pc.MacroByName('rural_feelog_pc_temp1').Value := 'rural_feelog_pc_temp1_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.orscrpt_merge_pc.MacroByName('condition').Value := condition;
  Form1.WriteLog(Form1.orscrpt_merge_pc.SQL.Text);
  Form1.orscrpt_merge_pc.Execute;
  Form1.WriteLog('结束合并个人机构');

  SetItemDisable(true);

end;

procedure TForm1.btn_mergeClick(Sender: TObject);
var
  ID: Dword;
begin
  CreateThread(nil, 0, @procMergeOrg, nil, 0, ID);
end;


procedure TForm1.btn_check_mergeClick(Sender: TObject);
var
  mesString: string;
begin
  orqry_check_merge_result.MacroByName('rural_feelog_pc_temp1').Value := 'rural_feelog_pc_temp1_' + ComboBox1.Text + RightStr('0' + ComboBox2.Text, 2);
  orqry_check_merge_result.MacroByName('rural_feelog_ec_temp1').Value := 'rural_feelog_ec_temp1_' + ComboBox1.Text + RightStr('0' + ComboBox2.Text, 2);
  WriteLog(orqry_check_merge_result.SQL.Text);
  orqry_check_merge_result.FetchAll := True;
  orqry_check_merge_result.Open();

  ds_result.DataSet := orqry_check_merge_result;


  dbgrd_result.Columns.Items[0].Width := 200;
  dbgrd_result.Columns.Items[1].Width := 100;
  dbgrd_result.Columns.Items[2].Width := 80;
  dbgrd_result.Columns.Items[3].Width := 50;


  if (orqry_check_merge_result.RecordCount > 0) then
  begin
    mesString := '存在 ' + IntToStr(orqry_check_merge_result.RecordCount) + ' 个无法自动合并的企业，请检查！！！';
    showmessage(mesString);
  end
  else
  begin
    mesString := '检查通过，可以执行拆分DMP文件！';
    showmessage(mesString);
  end;
end;


function procSplitOrg(p: Pointer): Integer; stdcall;
var
  types: string;
  condition: string;
  read_ini: TIniFile;
  s1: TStringList;
  i: Integer;
begin
  s1 := TStringList.Create;

  read_ini := tinifile.Create(extractfilepath(paramstr(0)) + 'config.ini');
  types := read_ini.ReadString('Split_Keyword', 'words', '');
  s1.Delimiter := ',';
  s1.DelimitedText := types;

  for i := 0 to s1.Count - 1 do
  begin
    condition := condition + ' OR INSTR (f.headquarter_orgname, ''' + s1[i] + ''') > 0';
  end;

  SetItemDisable(False);

  Form1.WriteLog('配置文件内容:' + condition);

  Form1.WriteLog('开始拆分企业机构');

  // 生成rural_feelog_ec_temp2，待调整级别的数据
  //上一步结果与fee_org关联，该部分数据为总部机构已建立财务机构的数据
  Form1.OraQuery5.MacroByName('rural_feelog_ec_temp2').Value := 'rural_feelog_ec_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraQuery5.MacroByName('rural_feelog_ec_temp1').Value := 'rural_feelog_ec_temp1_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.DropTable('rural_feelog_ec_temp2_' + Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2));
  Form1.WriteLog(Form1.OraQuery5.SQL.Text);
  Form1.OraQuery5.ExecSQL;

  //创建feelog_ec_normal，添加：
  //1 正常数据，feelog_ec 与 rural_feelog_ec_temp1 不同的记录
  //2 已建立财务机构的数据，rural_feelog_ec_temp1 与 rural_feelog_ec_temp2 不同的记录
  Form1.DropTable('feelog_ec_normal_' + Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2));
  Form1.OraScript6.MacroByName('rural_feelog_ec_temp1').Value := 'rural_feelog_ec_temp1_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript6.MacroByName('feelog_ec_normal').Value := 'feelog_ec_normal_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript6.MacroByName('feelog_ec').Value := 'feelog_ec_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript6.MacroByName('rural_feelog_ec_temp2').Value := 'rural_feelog_ec_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraScript6.SQL.Text);
  Form1.OraScript6.Execute;

  Form1.OraQuery4.MacroByName('rural_feelog_ec_temp2').Value := 'rural_feelog_ec_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery4.SQL.Text);
  Form1.OraQuery4.ExecSQL;


  Form1.OraQuery6.MacroByName('rural_feelog_ec_temp2').Value := 'rural_feelog_ec_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery6.SQL.Text);
  Form1.OraQuery6.ExecSQL;

  Form1.OraQuery13.MacroByName('rural_feelog_ec_temp2').Value := 'rural_feelog_ec_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery13.SQL.Text);
  Form1.OraQuery13.ExecSQL;

  Form1.OraQuery7.MacroByName('rural_feelog_ec_temp2').Value := 'rural_feelog_ec_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery7.SQL.Text);
  Form1.OraQuery7.ExecSQL;

  Form1.OraQuery8.MacroByName('rural_feelog_ec_temp2').Value := 'rural_feelog_ec_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery8.SQL.Text);
  Form1.OraQuery8.ExecSQL;


  Form1.OraQuery15.MacroByName('rural_feelog_ec_temp2').Value := 'rural_feelog_ec_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery15.SQL.Text);
  Form1.OraQuery15.ExecSQL;

  Form1.OraQuery17.MacroByName('rural_feelog_ec_temp2').Value := 'rural_feelog_ec_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery17.SQL.Text);
  Form1.OraQuery17.ExecSQL;

  Form1.OraQuery19.MacroByName('rural_feelog_ec_temp2').Value := 'rural_feelog_ec_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery19.SQL.Text);
  Form1.OraQuery19.ExecSQL;

  Form1.OraScript3.MacroByName('feelog_ec_normal').Value := 'feelog_ec_normal_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript3.MacroByName('rural_feelog_ec_temp2').Value := 'rural_feelog_ec_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraScript3.SQL.Text);
  Form1.OraScript3.Execute;


  Form1.WriteLog('开始拆分个人机构');
  Form1.OraQuery3.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraQuery3.MacroByName('rural_feelog_pc_temp1').Value := 'rural_feelog_pc_temp1_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.DropTable('rural_feelog_pc_temp2_' + Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2));
  Form1.WriteLog(Form1.OraQuery3.SQL.Text);
  Form1.OraQuery3.ExecSQL;

  Form1.DropTable('feelog_pc_normal_' + Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2));
  Form1.OraScript10.MacroByName('rural_feelog_pc_temp1').Value := 'rural_feelog_pc_temp1_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript10.MacroByName('feelog_pc_normal').Value := 'feelog_pc_normal_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript10.MacroByName('feelog_pc').Value := 'feelog_pc_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript10.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraScript10.SQL.Text);
  Form1.OraScript10.Execute;

  Form1.OraQuery9.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery9.SQL.Text);
  Form1.OraQuery9.ExecSQL;

  Form1.OraQuery10.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery10.SQL.Text);
  Form1.OraQuery10.ExecSQL;
//优化：使用中间表提高效率
//  DropTable('headcode_l2code_tmp');
//  orscrpt_update_headquarter_orgcode_pc.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' + ComboBox1.Text + RightStr('0' + ComboBox2.Text, 2);
//  WriteLog(orscrpt_update_headquarter_orgcode_pc.SQL.Text);
//  orscrpt_update_headquarter_orgcode_pc.Execute;
//  DropTable('headcode_l2code_tmp');

  Form1.OraQuery14.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery14.SQL.Text);
  Form1.OraQuery14.ExecSQL;

  Form1.OraQuery11.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery11.SQL.Text);
  Form1.OraQuery11.ExecSQL;

  Form1.OraQuery12.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery12.SQL.Text);
  Form1.OraQuery12.ExecSQL;

  Form1.OraQuery16.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery16.SQL.Text);
  Form1.OraQuery16.ExecSQL;

  Form1.OraQuery18.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery18.SQL.Text);
  Form1.OraQuery18.ExecSQL;

  Form1.OraQuery20.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraQuery20.SQL.Text);
  Form1.OraQuery20.ExecSQL;

  Form1.OraScript7.MacroByName('feelog_pc_normal').Value := 'feelog_pc_normal_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript7.MacroByName('rural_feelog_pc_temp2').Value := 'rural_feelog_pc_temp2_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraScript7.SQL.Text);
  Form1.OraScript7.Execute;

  Form1.WriteLog('结束拆分个人机构');

  SetItemDisable(true);

  Result := 1;
end;


procedure TForm1.BitBtn1Click(Sender: TObject);
var
  ID: Dword;
begin
  CreateThread(nil, 0, @procSplitOrg, nil, 0, ID);
end;


procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  DropTable('pc_org');
  DropTable('pc_org_attr');
  DropTable('pc_org_relation');
  DropTable('pc_org_temp');
  DropTable('pc_org_temp_tree');

  DropTable('ec_tm_org');
  DropTable('ec_org_temp');
  DropTable('ec_org_temp_tree');
end;


procedure TForm1.btn_showproClick(Sender: TObject);
var
  CommandStr: string;
begin
  CommandStr := 'notepad ' + extractfilepath(paramstr(0)) + 'config.ini';
  WinExec(PChar(CommandStr), SW_Normal);
end;


procedure TForm1.btn_check_splitClick(Sender: TObject);
var
  mesString: string;
var
  types: string;
  condition: string;
  read_ini: TIniFile;
  s1: TStringList;
  i: Integer;
begin
  s1 := TStringList.Create;

  SetItemDisable(False);
  try
    read_ini := tinifile.Create(extractfilepath(paramstr(0)) + 'config.ini');
    types := read_ini.ReadString('Split_Keyword', 'words', '');
    s1.Delimiter := ',';
    s1.DelimitedText := types;

    for i := 0 to s1.Count - 1 do
    begin
      condition := condition + ' OR INSTR (f.headquarter_orgname, ''' + s1[i] + ''') > 0';
    end;

    WriteLog('配置文件内容:' + condition);
    orqry_check_split_result.MacroByName('condition').Value := condition;
    orqry_check_split_result.MacroByName('feelog_pc_normal').Value := 'feelog_pc_normal_' +
      ComboBox1.Text + RightStr('0' + ComboBox2.Text, 2);
    orqry_check_split_result.MacroByName('feelog_ec_normal').Value := 'feelog_ec_normal_' +
      ComboBox1.Text + RightStr('0' + ComboBox2.Text, 2);
    WriteLog(orqry_check_split_result.SQL.Text);
    orqry_check_split_result.FetchAll := True;
    orqry_check_split_result.Open();


    ds_result.DataSet := orqry_check_split_result;

    dbgrd_result.Columns.Items[0].Width := 200;
    dbgrd_result.Columns.Items[1].Width := 120;


    if (orqry_check_split_result.RecordCount > 0) then
    begin
      mesString := '存在 ' + IntToStr(orqry_check_split_result.RecordCount) + ' 个含有关键字的机构！！！';
      showmessage(mesString);
    end
    else
    begin
      mesString := '检查通过！';
      showmessage(mesString);
    end;
  finally
    SetItemDisable(True);
  end;
end;




function procExportTable(p: Pointer): Integer; stdcall;
begin
  Result := 1;

  SetItemDisable(False);

  Form1.DropTable('ec_feelog_temp');
  Form1.OraScript4.MacroByName('feelog_ec_normal').Value := 'feelog_ec_normal_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript4.MacroByName('feelog_ec').Value := 'feelog_ec_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraScript4.SQL.Text);
  Form1.OraScript4.Execute;

  Form1.WriteLog('导出feelog_ec_normal为feelog_ec');
  Form1.expdata('c:\feelog', 1);

  //rename &feelog_ec to &feelog_ec_normal ;
  //rename ec_feelog_temp  to &feelog_ec ;
  Form1.OraScript5.MacroByName('feelog_ec_normal').Value := 'feelog_ec_normal_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript5.MacroByName('feelog_ec').Value := 'feelog_ec_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraScript5.SQL.Text);
  Form1.OraScript5.Execute;
  Form1.WriteLog('结束导出企业机构');

  Form1.DropTable('pc_feelog_temp');
  Form1.WriteLog('导出feelog_pc_normal为feelog_pc');

  Form1.OraScript8.MacroByName('feelog_pc_normal').Value := 'feelog_pc_normal_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript8.MacroByName('feelog_pc').Value := 'feelog_pc_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraScript8.SQL.Text);
  Form1.OraScript8.Execute;

  Form1.expdata('c:\feelog', 0);

  Form1.OraScript9.MacroByName('feelog_pc_normal').Value := 'feelog_pc_normal_' +
    Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.OraScript9.MacroByName('feelog_pc').Value := 'feelog_pc_' + Form1.ComboBox1.Text + RightStr('0' + Form1.ComboBox2.Text, 2);
  Form1.WriteLog(Form1.OraScript9.SQL.Text);
  Form1.OraScript9.Execute;
  Form1.WriteLog('结束导出个人机构');

  SetItemDisable(True);
end;

procedure TForm1.btnExportClick(Sender: TObject);
var
  ID: Dword;
begin
  CreateThread(nil, 0, @procExportTable, nil, 0, ID);
end;

end.

