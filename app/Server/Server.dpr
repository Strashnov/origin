program Server;

uses
  System.StartUpCopy,
  FMX.Forms,
  mainServer in 'mainServer.pas' {formMain},
  dm�omponents in 'DataModule\dm�omponents.pas' {dmCompanents: TDataModule},
  libChangeStyle in 'Library\libChangeStyle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TdmCompanents, dmCompanents);
  Application.Run;
end.
