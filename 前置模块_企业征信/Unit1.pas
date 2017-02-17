unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, Ora, DateUtils, OraScript,StrUtils,
  ExtCtrls, OdacVcl, ComCtrls, Buttons, DAScript ;

type
  TForm1 = class(TForm)
    OraSession1: TOraSession;
    OraQuery4: TOraQuery;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    OraQuery25: TOraQuery;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Memo1: TMemo;
    Button6: TButton;
    Button7: TButton;
    OraQuery24: TOraQuery;
    Button5: TButton;
    OraScript1: TOraScript;
    ConnectDialog1: TConnectDialog;
    OraQuery10: TOraQuery;
    OraQuery19: TOraQuery;
    OraQuery12: TOraQuery;
    OraQuery1: TOraQuery;
    OraQuery2: TOraQuery;
    OraQuery8: TOraQuery;
    OraQuery3: TOraQuery;
    OraQuery20: TOraQuery;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    OraQuery28: TOraQuery;
    OraScript2: TOraScript;
    BitBtn3: TBitBtn;
    Edit2: TEdit;
    OpenDialog2: TOpenDialog;
    OraQuery31: TOraQuery;
    OraScript3: TOraScript;
    OraScript4: TOraScript;
    OraScript5: TOraScript;
    OraScript6: TOraScript;
    OraQuery5: TOraQuery;
    OraQuery6: TOraQuery;
    OraQuery7: TOraQuery;
    OraQuery9: TOraQuery;

    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure WriteLogToFile(LogContent:String);
    procedure WriteLogToScreen(LogContent:String);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    function  WinExecAndWait(FileName:String;   Visibility   :   integer):Thandle;
    procedure DropTable(TableName: String);
    procedure Button5Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure deletedata();
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }

     progressBarRect:TRect;
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
  Feelog_TableName:string;
  text_month: string;
  aDateTimeFormat: TFormatSettings;
begin
  WriteLogToFile('��ʼ��ȡ��ѯ��¼');
  WriteLogToScreen('��ʼ��ȡ��ѯ��¼');
  aDateTimeFormat.DateSeparator := '-';
  aDateTimeFormat.ShortDateFormat := 'yyyy-mm-dd';
  aDateTimeFormat.TimeSeparator := ':';
  aDateTimeFormat.ShortTimeFormat := 'hh:mm:ss';
  text_month := RightStr('0' + ComboBox2.Text, 2);

  StartTime:=StrToDateTime(ComboBox1.Text+'-'+text_month+'-01 00:00:00', aDateTimeFormat);
  Feelog_TableName:='EC_TP_FEELOG_'+ComboBox1.Text+text_month;
  DropTable(Feelog_TableName);
  OraQuery28.MacroByName('Feelog_TableName').Value:=Feelog_TableName;
  WriteLogToFile(OraQuery28.sql.text);
  OraQuery28.ExecSQL;
  OraQuery4.MacroByName('Feelog_TableName').Value:=Feelog_TableName;
  OraQuery4.ParamByName('StartTime').AsDateTime:=StartTime;
  OraQuery4.ParamByName('EndTime').AsDateTime:=StartTime+DaysInMonth(StartTime);
  WriteLogToFile(OraQuery4.sql.text);
  OraQuery4.ExecSQL;
  WriteLogToFile('��ɳ�ȡ��ѯ��¼');
  WriteLogToScreen('��ɳ�ȡ��ѯ��¼');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DropTable('EC_TM_ORG');
  DropTable('EC_AREACODE');
  WriteLogToFile('��ʼ��ȡTM_ORG��EC_AREACOD��');
  WriteLogToScreen('��ʼ��ȡTM_ORG��EC_AREACOD��');
  OraScript2.Execute;
  WriteLogToFile('��ɳ�ȡTM_ORG��EC_AREACODE��');
  WriteLogToScreen('��ɳ�ȡTM_ORG��EC_AREACODE��');
  DropTable('ORG_TEMP');
  OraScript4.Execute;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  StartTime:TDateTime;
  result1,result2:string;
  text_month: string;
  aDateTimeFormat: TFormatSettings;
  Feelog_TableName,feelog_ec_tablename,tablename1,tablename2:string;
begin
  WriteLogToFile('*************************************************');
  WriteLogToFile('*         ��ʼ����'+ComboBox1.Text+'��'+ComboBox2.Text+'�¼Ʒ���ϸ             *');
  WriteLogToFile('*************************************************');
  WriteLogToScreen('��ʼ�Ʒ���ϸ����');
  aDateTimeFormat.DateSeparator := '-';
  aDateTimeFormat.ShortDateFormat := 'yyyy-mm-dd';
  aDateTimeFormat.TimeSeparator := ':';
  aDateTimeFormat.ShortTimeFormat := 'hh:mm:ss';
  text_month := RightStr('0' + ComboBox2.Text, 2);
  StartTime := StrToDateTime(ComboBox1.Text + '-' + text_month + '-01 00:00:00', aDateTimeFormat);
  DropTable('EC_TP_FEELOG_TEMP1');
  DropTable('EC_TP_FEELOG_TEMP2');
  DropTable('EC_TP_FEELOG_TEMP3');
  DropTable('EC_TP_FEELOG_TEMP4');
  DropTable('EC_TP_FEELOG_TEMP5'); 
  DropTable('EC_TP_FEELOG_TEMP6');
  DropTable('EC_TP_FEELOG_TEMP7');
 WriteLogToFile('1����ʼ����ҵ��־���г���ɸѡ��������ʱ�����EC_TP_FEELOG_TEMP1');
  WriteLogToScreen('1����ʼ����ҵ��־���г���ɸѡ��������ʱ�����EC_TP_FEELOG_TEMP1');
  WriteLogToFile('   1)ɸѡ����������ѯ�ļ�¼');
  WriteLogToScreen('   1)ɸѡ����������ѯ�ļ�¼');
  Feelog_TableName:='EC_TP_FEELOG_'+ComboBox1.Text+text_month;
  OraQuery19.MacroByName('Feelog_TableName').Value:=Feelog_TableName;
  WriteLogToFile(OraQuery19.sql.text);
  OraQuery19.ExecSQL;
  WriteLogToFile('   2)ɸѡ����֯���������ѯ�ļ�¼');
  WriteLogToScreen('   2)ɸѡ����֯���������ѯ�ļ�¼');
  OraQuery12.MacroByName('Feelog_TableName').Value:=Feelog_TableName;
  WriteLogToFile(OraQuery12.sql.text);
  OraQuery12.ExecSQL;
  WriteLogToFile('   3)ɸѡ������ע��Ų�ѯ�ļ�¼');
  WriteLogToScreen('   3)ɸѡ������ע��Ų�ѯ�ļ�¼');
  OraQuery1.MacroByName('Feelog_TableName').Value:=Feelog_TableName;
  WriteLogToFile(OraQuery1.sql.text);
  OraQuery1.ExecSQL;
  WriteLogToFile('   4)ɸѡ����˰�Ų�ѯ�ļ�¼');
  WriteLogToScreen('   4)ɸѡ����˰�Ų�ѯ�ļ�¼');
  OraQuery2.MacroByName('Feelog_TableName').Value:=Feelog_TableName;
  WriteLogToFile(OraQuery2.sql.text);
  OraQuery2.ExecSQL;
  WriteLogToFile('   5)ɸѡ����˰�Ų�ѯ�ļ�¼');
  WriteLogToScreen('   5)ɸѡ����˰�Ų�ѯ�ļ�¼');
  OraQuery8.MacroByName('Feelog_TableName').Value:=Feelog_TableName;
  WriteLogToFile(OraQuery8.sql.text);
  OraQuery8.ExecSQL;


  WriteLogToFile('2���Ե�1�������EC_TP_FEELOG_TEMP1�����ڻ������û�����ѯ���ڽ��з��飬������EC_TP_FEELOG_TEMP2�����²�ѯ�ͻ���');
  WriteLogToScreen('2���Ե�1�������EC_TP_FEELOG_TEMP1�����ڻ������û�����ѯ���ڽ��з��飬������EC_TP_FEELOG_TEMP2�����²�ѯ�ͻ���');
  WriteLogToFile(OraScript5.sql.text);
  OraScript5.Execute;           
  WriteLogToFile('3���Ե�2��������У�ȥ���������в�ѯ�ļ�¼���Ӷ���������������ơ���ѯ������������ʡ�ݣ�������EC_TP_FEELOG_TEMP3��');
  WriteLogToScreen('3���Ե�2��������У�ȥ���������в�ѯ�ļ�¼���Ӷ���������������ơ���ѯ������������ʡ�ݣ�������EC_TP_FEELOG_TEMP3��');
  WriteLogToFile(OraScript6.sql.text);
  OraScript6.Execute;;
  //deletedata;
 
  WriteLogToFile('4���Ե�3��������У�������ҵ��ѯ�ӿڱ�ҵ������ֶΣ�������EC_TP_FEELOG_TEMP4��');
  WriteLogToScreen('4���Ե�3��������У�������ҵ��ѯ�ӿڱ�ҵ������ֶΣ�������EC_TP_FEELOG_TEMP4��');
  WriteLogToFile(OraQuery24.sql.text);
  OraQuery24.ExecSQL;
  WriteLogToFile('5���Ե�4��������У�������ҵ��Ʒ�����ֶΣ�������EC_TP_FEELOG_TEMP5��');
  WriteLogToScreen('5���Ե�4��������У�������ҵ��Ʒ�����ֶΣ�������EC_TP_FEELOG_TEMP5��');
  WriteLogToFile(OraQuery25.sql.text);
  OraQuery25.ExecSQL;
  WriteLogToFile('6���������ǰ30���ѯ�ͻ��������ʱ��EC_TP_FEELOG_TEMP6');
  WriteLogToScreen('6���������ǰ30���ѯ�ͻ��������ʱ��EC_TP_FEELOG_TEMP6');
  DateTimeToString(result1,'yyyymm',incmonth(StartTime,-1));
  DateTimeToString(result2,'yyyymm',incmonth(StartTime,-2));
  tablename1:='FEELOG_EC_'+result1;
  tablename2:='FEELOG_EC_'+result2;
  OraQuery5.ExecSQL;
  OraQuery20.MacroByName('tablename1').Value:=tablename1;
  OraQuery20.MacroByName('tablename2').Value:=tablename2;
  OraQuery20.ParamByName('StartTime').AsDateTime:=StartTime;
  WriteLogToFile(OraQuery20.sql.text);
  OraQuery20.ExecSQL;

  OraQuery7.ExecSQL;

  WriteLogToFile('7��������ѡ���µĽӿڱ�');
  WriteLogToScreen('7��������ѡ���µĽӿڱ�');
  feelog_ec_tablename:='FEELOG_EC_'+ComboBox1.Text+text_month;
  OraQuery3.MacroByName('feelog_ec_tablename').Value:=feelog_ec_tablename;
  DropTable(feelog_ec_tablename);

  OraQuery3.ExecSQL;
  WriteLogToFile('8����ӿڱ��в�������');
  WriteLogToScreen('8����ӿڱ��в�������');

 //OraQuery10.MacroByName('feelog_ec_tablename').Value:=feelog_ec_tablename;

  OraQuery10.ParamByName('StartTime').AsDateTime:=StartTime;
  WriteLogToFile(OraQuery10.sql.text);
  OraQuery10.ExecSQL;


  OraQuery9.MacroByName('feelog_ec_tablename').Value:=feelog_ec_tablename;
  OraQuery9.MacroByName('tablename1').Value:=tablename1;
  OraQuery9.ParamByName('StartTime').AsDateTime:=StartTime;
  WriteLogToFile(OraQuery9.sql.text);
  OraQuery9.ExecSQL;

  WriteLogToFile('��ɼƷ���ϸ����');
  WriteLogToScreen('��ɼƷ���ϸ����');
end;

procedure TForm1.WriteLogToFile(LogContent:String);
var
  F:TextFile;
  result3 :string;
begin
  ForceDirectories('D:\LOG');
  DateTimeToString(result3,'yyyy-mm-dd',now());
  Assignfile(F,'D:\LOG\ec_log'+result3+'.txt');
  if FileExists('D:\LOG\ec_log'+result3+'.txt') then Append(F) else Rewrite(F) ;
  writeln(F,DateTimeToStr(Now));
  writeln(F,LogContent);
  CloseFile(F);
end;

procedure TForm1.WriteLogToScreen(LogContent:String);
begin
  Memo1.Lines.Add(DateTimeToStr(Now)+'  '+LogContent) ;
end;

procedure TForm1.deletedata;
var
  F:TextFile;
  string1:string;
begin
  Assignfile(F,Edit2.Text);
  if FileExists(Edit2.text)   then  reset(F)  else  WriteLogToScreen('�ļ�������');
  while not eof(F) do
    begin
      readln(F,string1);
      OraQuery31.SQL.Clear;
      OraQuery31.SQL.Add('delete EC_TP_FEELOG_TEMP3 where product_memo_1='''+string1+'''');
      WriteLogToScreen(OraQuery31.SQL.Text);
      WriteLogToFile(OraQuery31.SQL.Text);
      try
        OraQuery31.ExecSQL;
      except on E:Exception do
        begin
          WriteLogToScreen('�洢����������鿴��־��');
          WriteLogToFile('�洢����������鿴��־��');
        end;
      end;
    end;
end;


procedure TForm1.Button6Click(Sender: TObject);
begin
  Button3Click(Self);
  Button2Click(Self);
  Button5Click(Self);
  Button4Click(Self);
  Button7Click(Self);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  CommandStr:String;
begin
  WriteLogToFile('��ʼ����������ϸ��');
  WriteLogToScreen('��ʼ����������ϸ��');
  ForceDirectories('D:\ExportData');
  CommandStr:='exp '+OraSession1.Username+'/'+OraSession1.Password+'@720_jf_ectns tables=(feelog_ec_'+ComboBox1.Text+RightStr(('0'+ComboBox2.Text),2)+') grants=n indexes=n constraints=n ';
  CommandStr:=CommandStr+' file=D:\ExportData\feelog_ec_'+ComboBox1.Text+RightStr(('0'+ComboBox2.Text),2)+'.dmp ';
  WriteLogToFile(CommandStr);
  WinExecAndWait(CommandStr,0);
  WriteLogToFile('��ɵ���������ϸ��');
  WriteLogToScreen('��ɵ���������ϸ��');
  WriteLogToFile('��ʼ������ҵ������');
  WriteLogToScreen('��ʼ������ҵ������');
  CommandStr:='exp '+OraSession1.Username+'/'+OraSession1.Password+'@720_jf_ectns tables=(ec_tm_org) grants=n indexes=n constraints=n ';
  CommandStr:=CommandStr+' file=D:\ExportData\ec_tm_org_'+ComboBox1.Text+RightStr(('0'+ComboBox2.Text),2)+'.dmp ';
  WriteLogToFile(CommandStr);
  WinExecAndWait(CommandStr,0);
  WriteLogToFile('��ɵ�����ҵ������');
  WriteLogToScreen('��ɵ�������ҵ������');
  WriteLogToScreen('��ҵǰ�ü�����̽���');
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


procedure TForm1.Button5Click(Sender: TObject);
begin
  DropTable('ec_td_enterpriseinfo');
  WriteLogToFile('���ɾ��ec_td_enterpriseinfo,������ec_td_enterpriseinfo�н��������');
  WriteLogToFile('��ʼ����ec_td_enterpriseinfo');
  OraScript3.Execute;
  WriteLogToFile( OraScript3.sql.text);
  WriteLogToFile('��ɴ���ec_td_enterpriseinfo��ec_td_enterpriseinfo�н�������Ƹ���');
  WriteLogToFile('��ʼΪec_td_enterpriseinfo��������');
  OraScript1.Execute;
  WriteLogToFile(OraScript1.SQL.Text);
  WriteLogToFile('���Ϊec_td_enterpriseinfo��������');
end;

procedure TForm1.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
progressBarRect:=Rect;
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
      BitBtn2.Enabled:=true;
    end;
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

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  F:TextFile;
  string1:string;
  string2:TStringList;
begin
  Assignfile(F,Edit1.Text);
  if FileExists(Edit1.text)   then  reset(F)
  else
    begin
      WriteLogToScreen('�ļ�������');
      exit;
    end;
  while not eof(F) do
    begin
      readln(F,string1);
      WriteLogToScreen(string1);
      string2:=SplitString(string1,' ');
      OraQuery6.SQL.Clear;
      OraQuery6.SQL.Add('update org_temp  t set t.uporg='''+string2[1]+ ''' where t.orgcode='''+string2[0]+'''');
      WriteLogToScreen(OraQuery6.SQL.Text);
      WriteLogToFile(OraQuery6.SQL.Text);
      try
        OraQuery2.ExecSQL;
      except on E:Exception do
        begin
          WriteLogToScreen('�洢����������鿴��־��');
          WriteLogToFile('�洢����������鿴��־��');
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

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  name,path : string;
begin
  if opendialog2.Execute then
    begin
      name := extractfilename(opendialog2.FileName);
      path := extractfiledir(opendialog2.FileName);
      Edit2.Text:=path+'\'+name;
      Edit2.enabled:=true;
    end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
   deletedata;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBox1.Text:=IntToStr(YearOf(Now()-DayOf(Now())-1));
  ComboBox2.Text:=IntToStr(MonthOf(Now()-DayOf(Now())-1));
end;

end.
