program tep;

uses
  Forms,
  Main in 'Main.pas' {Form1};
//{$APPTYPE   CONSOLE}
{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

