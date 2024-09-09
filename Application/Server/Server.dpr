program Server;

uses
  System.StartUpCopy,
  FMX.Forms,
  main in 'main.pas' {formMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.Run;
end.
