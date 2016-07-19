unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComObj, ShellAPI, FileCtrl, ComCtrls, activex;

type
  TForm1 = class(TForm)
    btn3: TButton;
    pb_main: TProgressBar;
    procedure btn3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

//合并两个Excel文件到一个Excel文件
function MergerExcel(filePath, file1Name, file2Name, targetFileName: string; sErrMsg: string): Boolean; overload;
function RemoveStr(const Content, Sub: string): string;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function MergerExcel(filePath, file1Name, file2Name, targetFileName: string; sErrMsg: string): Boolean;
var ExcelApp: Variant;
  ExcelWorkBook1: OleVariant;
  ExcelWorkBook2: OleVariant;
  ExcelWorkBook3: OleVariant;
  WorkDir: string;
begin
  try
    try
      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.Visible := False;
      ExcelApp.DisplayAlerts := False;

      ExcelWorkBook1 := ExcelApp.WorkBooks.Open(filePath + '\' + file1Name);
      ExcelWorkBook2 := ExcelApp.WorkBooks.Open(filePath + '\' + file2Name);

      GetDir(0, WorkDir);
      ExcelWorkBook3 := ExcelApp.WorkBooks.Open(WorkDir + '\model.xls');

    //Sheet复制到模版文件中
      ExcelWorkBook1.Sheets[1].range['A1', 'IV65536'].copy;
      ExcelWorkBook3.Sheets[1].cells[1, 1].PasteSpecial;
      ExcelWorkBook2.Sheets[1].range['A1', 'IV65536'].copy;
      ExcelWorkBook3.Sheets[2].cells[1, 1].PasteSpecial;

    //删除可能已经存在的目标文件
      if FileExists(filePath + '\merge\' + targetFileName) then
        DeleteFile(filePath + '\merge\' + targetFileName);

    //将生成的Model文件另存为
      ForceDirectories(filePath + '\merge');
      ExcelWorkBook3.SaveAs(filePath + '\merge\' + targetFileName);

      Result := True;
    except
      on E: Exception do
      begin
        sErrMsg := E.Message;
        showmessage(sErrMsg);
        Result := False;
      end;
    end;
  finally
    ExcelWorkBook1.Close;
    ExcelWorkBook2.Close;
    ExcelWorkBook3.Close;
    ExcelApp.Quit;
  end;
end;

function RemoveStr(const Content, Sub: string): string;
var
  iPos: Integer;
begin
  Result := Content;
  iPos := Pos(Sub, Result);
  while iPos > 0 do
  begin
    Delete(Result, iPos, Length(Sub));
    iPos := Pos(Sub, Result);
  end;
end;

function procFun(p: Pointer): Integer; stdcall;
var
  s: string;
  i, index: integer;
  MyTStringList: TStringList;
  SearchRec: TSearchRec;
  found: integer;
  tmp: string;
  Dir: string;
begin
  CoInitialize(nil); // 一定要加上此行代码
  Form1.btn3.Enabled := False;
  try
    SelectDirectory('请选择目录', '', Dir);
    if Length(Dir) > 0 then
    begin
      MyTStringList := TStringList.Create;

      found := FindFirst(Dir + '\' + '*.*', faAnyFile, SearchRec);
      while found = 0 do
      begin
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and
          (SearchRec.Attr <> faDirectory) then
          MyTStringList.Add(SearchRec.Name);
        found := FindNext(SearchRec);
      end;
      FindClose(SearchRec);

      MyTStringList.Sort;
      Form1.pb_main.Max := MyTStringList.Count;
      for i := 0 to MyTStringList.Count - 1 do
      begin
        tmp := RemoveStr(MyTStringList[i], '_10.xls');
        index := MyTStringList.IndexOf(tmp + '_20.xls');
        if (index >= 0) then
        begin
          MergerExcel(Dir, MyTStringList[i], MyTStringList[index], tmp, s);
        end;
        Form1.pb_main.Position := i + 1;
      end;
    end;
    Form1.btn3.Enabled := True;

    Result := 0;
  finally
    CoUninitialize;
  end;

end;

procedure TForm1.btn3Click(Sender: TObject);
var
  ID: THandle;
begin

  CreateThread(nil, 0, @procFun, nil, 0, ID);

end;

end.

