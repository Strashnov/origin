unit dm—omponents;

interface

uses
  System.SysUtils, System.Classes, FMX.StdActns, System.Actions, FMX.ActnList,
  System.ImageList, FMX.ImgList, FMX.Types, FMX.Controls, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdTCPServer, FMX.Forms, IdServerIOHandler,
  IdServerIOHandlerSocket, IdServerIOHandlerStack, IdIntercept,
  IdCompressionIntercept, IdContext, libChangeStyle;

type
  TdmCompanents = class(TDataModule)
    ImageList: TImageList;
    alMenu: TActionList;
    actMain: TAction;
    actSettings: TAction;
    actExit: TFileExit;
    sbLight: TStyleBook; // Light theme
    sbDark: TStyleBook; // Dark theme
    IdTCPServer: TIdTCPServer;
    Language: TLang;
    IdServerCompressionIntercept: TIdServerCompressionIntercept;
    IdServerIOHandlerStack: TIdServerIOHandlerStack;
    procedure ChangeStyleLight; // Light theme
    procedure ChangeStyleDark; // Dark theme
    procedure IdTCPServerExecute(AContext: TIdContext);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  dmCompanents: TdmCompanents;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses main;

{$R *.dfm}
{ TdmCompanents }

procedure TdmCompanents.ChangeStyleDark; // Dark theme
var
  ChangeStyle: TChangeStyle; // Library loading from libChangeStyle.pas
begin
  ChangeStyle := TChangeStyle.Create;
  try
    ChangeStyle.ChangeStyle(sbDark);
  finally
    ChangeStyle.Free;
  end;
end;

procedure TdmCompanents.ChangeStyleLight; // Light theme
var
  ChangeStyle: TChangeStyle; // Library loading from libChangeStyle.pas
begin
  ChangeStyle := TChangeStyle.Create;
  try
    ChangeStyle.ChangeStyle(sbLight);
  finally
    ChangeStyle.Free;
  end;
end;

procedure TdmCompanents.IdTCPServerExecute(AContext: TIdContext);
// Accept data from the client
begin
  formMain.memMessageFromClient.Lines.Add(AContext.Connection.Socket.ReadLn());
  AContext.Connection.Disconnect;
end;

end.
