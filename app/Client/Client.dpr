program Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  mainClient in 'mainClient.pas' {formClient},
  DistanceByCoordinates in 'Library\DistanceByCoordinates.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformClient, formClient);
  Application.Run;
end.
