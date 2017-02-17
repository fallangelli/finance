unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, Ora, DateUtils, OraScript,StrUtils,
  OdacVcl, Buttons, DAScript ;

type
  TForm1 = class(TForm)
    OraSession1: TOraSession;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    OraQuery19: TOraQuery;
    OraQuery25: TOraQuery;
    OraQuery28: TOraQuery;
    OraQuery29: TOraQuery;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Memo1: TMemo;
    OraScript1: TOraScript;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    OraQuery30: TOraQuery;
    ConnectDialog1: TConnectDialog;
    Label1: TLabel;
    Label2: TLabel;
    OraQuery1: TOraQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    OraQuery2: TOraQuery;
    OraQuery5: TOraQuery;
    OraQuery18: TOraQuery;
    OraScript2: TOraScript;
    OraScript3: TOraScript;
    OraQuery4: TOraQuery;
    OraQuery6: TOraQuery;
    OraScript4: TOraScript;
    OraQuery3: TOraQuery;
    OraQuery7: TOraQuery;
    OraQuery8: TOraQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure WriteLogToFile(LogContent:String);
    procedure WriteLogToScreen(LogContent:String);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    function  WinExecAndWait(FileName:String;   Visibility   :   integer):Thandle;
    procedure DropTable(TableName: String);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  StartTime:TDateTime;
  OraQueryTemp: TOraQuery;
  pc_queryrecord_tablename:String;
begin


  DropTable('pc_queryrecord_'+ComboBox1.Text+RightStr('0'+ComboBox2.Text,2));
  WriteLogToFile('开始抽取查询记录');
  WriteLogToScreen('开始抽取查询记录');
  StartTime:=StrToDateTime(ComboBox1.Text+'-'+ComboBox2.Text+'-01 00:00:00');
  pc_queryrecord_tablename:='pc_queryrecord_'+ComboBox1.Text+RightStr('0'+ComboBox2.Text,2);
  DropTable(pc_queryrecord_tablename) ;
  OraQuery6.MacroByName('pc_queryrecord_tablename').Value:=pc_queryrecord_tablename;
  WriteLogToFile(OraQuery6.sql.text);
  OraQuery6.ExecSQL;
  OraQuery4.MacroByName('pc_queryrecord_tablename').Value:=pc_queryrecord_tablename;
  OraQuery4.ParamByName('StartTime').AsDateTime:=StartTime;
  OraQuery4.ParamByName('EndTime').AsDateTime:=StartTime+DaysInMonth(StartTime);
  WriteLogToFile(OraQuery4.sql.text);
  OraQuery4.ExecSQL;

    WriteLogToFile('完成抽取查询记录');
    WriteLogToScreen('完成抽取查询记录');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin

  DropTable('pc_org');
  DropTable('pc_org_attr');
  DropTable('pc_org_relation');
  DropTable('PC_PROVINCE');
  DropTable('PC_OUTERUSER');
  DropTable('ORG_TEMP');

  WriteLogToFile('开始抽取ORG、ORG_RELATION、PC_PROVINCE、PC_OUTERUSER表,并为ORG、ORG_RELATION表创建索引');
   WriteLogToScreen('开始抽取ORG、ORG_RELATION、PC_PROVINCE、PC_OUTERUSER表,并为ORG、ORG_RELATION表创建索引');
  oraScript2.Execute;
   WriteLogToFile('完成抽取ORG、ORG_RELATION、PC_PROVINCE表、PC_OUTERUSER和ORG、ORG_RELATION表上的索引创建');
  WriteLogToScreen('完成抽取ORG、ORG_RELATION、PC_PROVINCE、PC_OUTERUSER表和ORG、ORG_RELATION表上的索引创建');
    WriteLogToFile('开始创建个人机构树');
  WriteLogToScreen('开始创建个人机构树');
   WriteLogToFile(OraScript3.SQL.Text);
    OraScript3.Execute;
   
  WriteLogToFile('完成创建个人机构树');
  WriteLogToScreen('完成创建个人机构树');

end;

procedure TForm1.Button4Click(Sender: TObject);
var
  StartTime:TDateTime;
  i:Integer;
  feelog_pc_tablename,pc_queryrecord_tablename :string;
begin
  WriteLogToFile('开始计费明细计算');
  WriteLogToScreen('开始计费明细计算');
  StartTime:=StrToDateTime(ComboBox1.Text+'-'+ComboBox2.Text+'-01 00:00:00');

 feelog_pc_tablename:='FEELOG_PC_'+ComboBox1.Text+RightStr('0'+ComboBox2.Text,2);
  OraQuery1.MacroByName('feelog_pc_tablename').Value:=feelog_pc_tablename;
  DropTable(feelog_pc_tablename);
   DropTable('FEELOG_PC_TEMP9');
  OraQuery1.ExecSQL;
  pc_queryrecord_tablename:='PC_QueryRecord_'+ComboBox1.Text+RightStr('0'+ComboBox2.Text,2);
   OraQuery8.ExecSQL;

  for i:=0 to DaysInMonth(StartTime)-1 do
    begin
      WriteLogToFile('计算'+DateTimeToStr(StartTime+i)+'日明细');
      WriteLogToScreen('计算'+DateTimeToStr(StartTime+i)+'日明细');
      DropTable('FEELOG_PC_TEMP1');
      DropTable('FEELOG_PC_TEMP2');
      DropTable('FEELOG_PC_TEMP3');
      DropTable('FEELOG_PC_TEMP4');
      DropTable('FEELOG_PC_TEMP5');
      DropTable('FEELOG_PC_TEMP6');
      DropTable('FEELOG_PC_TEMP7');
      DropTable('FEELOG_PC_TEMP8');
      //DropTable('FEELOG_PC_TEMP9');

      OraQuery3.MacroByName('pc_queryrecord_tablename').Value:=pc_queryrecord_tablename;
      WriteLogToFile( OraQuery3.SQL.Text);
      OraQuery3.ExecSQL;

      OraQuery19.MacroByName('pc_queryrecord_tablename').Value:=pc_queryrecord_tablename;
      OraQuery19.ParamByName('StartTime').AsDateTime:=StartTime+i;
      OraQuery19.ParamByName('EndTime').AsDateTime:=StartTime+i+1;
      WriteLogToFile( OraQuery19.SQL.Text);
      OraQuery19.ExecSQL;



      WriteLogToFile( OraScript1.SQL.Text);
      OraScript1.Execute;

      WriteLogToFile( OraQuery25.SQL.Text);
      OraQuery25.ExecSQL;

      WriteLogToFile( OraQuery28.SQL.Text);
      OraQuery28.ExecSQL;

      WriteLogToFile( OraQuery29.SQL.Text);
      OraQuery29.ExecSQL;
       WriteLogToFile( OraQuery5.SQL.Text);
      OraQuery5.ExecSQL;
        WriteLogToFile( OraQuery18.SQL.Text);
      OraQuery18.ExecSQL;
        WriteLogToFile( OraQuery7.SQL.Text);
      OraQuery7.ExecSQL;
        





      DropTable('FEELOG_PC_TEMP1');
      DropTable('FEELOG_PC_TEMP2');
      DropTable('FEELOG_PC_TEMP3');
      DropTable('FEELOG_PC_TEMP4');
      DropTable('FEELOG_PC_TEMP5');
      DropTable('FEELOG_PC_TEMP6');
      DropTable('FEELOG_PC_TEMP7');
      DropTable('FEELOG_PC_TEMP8');
    end;
   
     OraQuery30.MacroByName('feelog_pc_tablename').Value:=feelog_pc_tablename;
     WriteLogToFile( OraQuery30.SQL.Text);
     OraQuery30.ExecSQL;

      DropTable('FEELOG_PC_TEMP9');

  WriteLogToFile('完成计费明细计算');
  WriteLogToScreen('完成计费明细计算');
end;

procedure TForm1.WriteLogToFile(LogContent:String);
var
F:TextFile;
result3 :string;
begin
 // Memo1.Lines.Add(DateTimeToStr(Now)+'  '+LogContent) ;
  ForceDirectories('D:\LOG');
  DateTimeToString(result3,'yyyy-mm-dd',now());
    Assignfile(F,'D:\LOG\pc_log'+result3+'.txt');
 if FileExists('D:\LOG\pc_log'+result3+'.txt') then
     Append(F)
     else
     Rewrite(F) ;

  writeln(F,DateTimeToStr(Now));
  writeln(F,LogContent);
  CloseFile(F);

end;


procedure TForm1.WriteLogToScreen(LogContent:String);
begin
  Memo1.Lines.Add(DateTimeToStr(Now)+'  '+LogContent) ;

end;




procedure TForm1.Button5Click(Sender: TObject);
begin
  DropTable('pc_certificate')  ;
  DropTable('pc_dd_certificate');
  WriteLogToFile('开始抽取人员信息表Certificate、人员证件类型字典表DD_Certificate,并建立索引');
  WriteLogToScreen('开始抽取人员信息表Certificate、人员证件类型字典表DD_Certificate，并建立索引');
  oraScript4.Execute;
  WriteLogToFile('完成抽取人员信息表Certificate、人员证件类型字典表DD_Certificate和创建索引');
  WriteLogToScreen('完成抽取人员信息表Certificate、人员证件类型字典表DD_Certificate和创建索引');
  
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 // Button8Click(Self);
  Button3Click(Self);
  Button2Click(Self);
  Button5Click(Self);
 //Button3Click(Self);
  Button4Click(Self);
  Button7Click(Self);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  CommandStr:String;
  StartDate,EndDate:TDateTime;
begin
  WriteLogToFile('开始导出消费明细表');
   WriteLogToScreen('开始导出消费明细表');
  StartDate:=StrToDateTime(ComboBox1.Text+'-'+RightStr('0'+ComboBox2.Text,2)+'-01 00:00:00');
  EndDate:=StartDate+DaysInMonth(StartDate);
  ForceDirectories('D:\ExportData');
  CommandStr:='exp '+OraSession1.Username+'/'+OraSession1.Password+'@710_jf_pctns tables=(feelog_pc_'+ComboBox1.Text+RightStr(('0'+ComboBox2.Text),2)+') grants=n indexes=n constraints=n ';
  CommandStr:=CommandStr+' file=D:\ExportData\feelog_pc_'+ComboBox1.Text+RightStr(('0'+ComboBox2.Text),2)+'.dmp ';
    
  WriteLogToFile(CommandStr);
  WinExecAndWait(CommandStr,0);

  WriteLogToFile('完成导出消费明细表');
   WriteLogToScreen('完成导出消费明细表');

  WriteLogToFile('开始导出机构、机构关系、外部用户表');
  WriteLogToScreen('开始导出机构、机构关系、外部用户表');

  CommandStr:='exp '+OraSession1.Username+'/'+OraSession1.Password+'@710_jf_pctns tables=(pc_org,pc_org_relation,pc_outersuer,pc_org_attr) grants=n indexes=n constraints=n ';
  CommandStr:=CommandStr+' file=D:\ExportData\pc_org_outeruser'+ComboBox1.Text+RightStr(('0'+ComboBox2.Text),2)+'.dmp ';
    
  WriteLogToFile(CommandStr);
  WinExecAndWait(CommandStr,0);

  WriteLogToFile('完成导出机构、机构关系、外部用户表');
    WriteLogToScreen('完成导出机构、机构关系、外部用户表');
     WriteLogToScreen('个人前置计算过程结束！');

end;

function TForm1.WinExecAndWait(FileName: String; Visibility: Integer):Thandle;
var
  zAppName:array[0..512]   of   char;
  zCurDir:array[0..255]   of   char;
  WorkDir:String;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
begin
  StrPCopy(zAppName,FileName);
  GetDir(0,WorkDir);
  StrPCopy(zCurDir,WorkDir);
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb   :=   Sizeof(StartupInfo);
  StartupInfo.dwFlags   :=   STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow   :=   Visibility;
  if not CreateProcess(nil,zAppName,nil,nil,false,CREATE_NEW_CONSOLE   or  NORMAL_PRIORITY_CLASS, nil,nil,StartupInfo,   ProcessInfo) then
    begin
      Result:=0;
      Exit;
    end
  else
    begin
      WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
      GetExitCodeProcess(ProcessInfo.hProcess,Result);   
    end;   
end;

{procedure TForm1.Button8Click(Sender: TObject);
var
  StartTime,EndTime:TDateTime;
begin
  StartTime:=StrToDateTime(ComboBox1.Text+'-'+RightStr('0'+ComboBox2.Text,2)+'-01 00:00:00');
  EndTime:=StartTime+DaysInMonth(StartTime);
  WriteLog('开始清除消费明细表');
  OraQuery36.ParamByName('STARTTIME').AsDateTime:=StartTime;
  OraQuery36.ParamByName('ENDTIME').AsDateTime:=EndTime;
  OraQuery36.ExecSQL;
  WriteLog('完成清除消费明细表');
  WriteLog('开始清除查询记录表');
  OraQuery37.ParamByName('STARTTIME').AsDateTime:=StartTime;
  OraQuery37.ParamByName('ENDTIME').AsDateTime:=EndTime;
  OraQuery37.ExecSQL;
  WriteLog('完成清除查询记录表');
end;
 }

procedure TForm1.DropTable(TableName: String);
var
  OraQueryDrop: TOraQuery;
begin
  OraQueryDrop:=TOraQuery.Create(nil);
  OraQueryDrop.SQL.Clear;
  OraQueryDrop.SQL.Add('select count(*) as num from user_objects t where t.object_type = ''TABLE'' and t.object_name = '''+UpperCase(Trim(TableName))+'''');
  OraQueryDrop.ExecSQL;
  if OraQueryDrop.FieldByName('NUM').AsInteger>0 then
    begin
      OraQueryDrop.SQL.Clear;
      OraQueryDrop.SQL.Add('Drop Table '+Trim(TableName)+' cascade constraints');
      OraQueryDrop.ExecSQL;
    end;
  OraQueryDrop.Free;
end;

 function SplitString(const source, ch: string): TStringList;
var
  temp, t2: string;
  i: integer;
begin
  result := TStringList.Create;
  temp := source;
  i := pos(ch, source);
  while i <> 0 do
  begin
    t2 := copy(temp, 0, i - 1);
    if (t2 <> '') then
      result.Add(t2);
    delete(temp, 1, i - 1 + Length(ch));
    i := pos(ch, temp);
  end;
  result.Add(temp);
end;


procedure TForm1.BitBtn1Click(Sender: TObject);
var
name,path : string;
begin
if opendialog1.Execute then
begin 
name := extractfilename(opendialog1.FileName); 
path := extractfiledir(opendialog1.FileName);
Edit1.Text:=path+'\'+name;
Edit1.enabled:=true;
//ShellExecute(handle, nil, pchar(name), nil,pchar(path),SW_SHOW) ;
 BitBtn2.Enabled:=true;
 end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
F:TextFile;
  string1:string;
 string2:TStringList;
begin

  Assignfile(F,Edit1.Text);
 // WriteLogToScreen(Edit2.Text);
    if FileExists(Edit1.text)   then
   reset(F)
   else
 begin
  
 WriteLogToScreen('文件不存在');
   exit;
 end;
   while not eof(F) do
   begin

    readln(F,string1);


   WriteLogToScreen(string1);

   string2:=SplitString(string1,' ');
   //WriteLogToScreen(string2[0]);
 //  WriteLogToScreen(string2[1]);



   OraQuery2.SQL.Clear;
   OraQuery2.SQL.Add('update pc_org  t set t.rootid='+string2[1]+' where t.orgid='+string2[0]);
   WriteLogToScreen(OraQuery2.SQL.Text);
   WriteLogToFile(OraQuery2.SQL.Text);
     try
    OraQuery2.ExecSQL;
    except
 on E:Exception do
     begin
            WriteLogToScreen('存储过程有误，请查看日志！');
            WriteLogToFile('存储过程有误，请查看日志！');

                              end;
        end;
       string2.clear;
      end;
    Button6.Enabled:=true;
end;
procedure TForm1.Edit1Change(Sender: TObject);
begin
       WriteLogToScreen(edit1.text);
   BitBtn2.Enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   ComboBox1.Text:=IntToStr(YearOf(Now()-DayOf(Now())-1));
  ComboBox2.Text:=IntToStr(MonthOf(Now()-DayOf(Now())-1));
end;

end.
