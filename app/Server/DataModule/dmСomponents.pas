unit dm—omponents;

interface

uses
  System.SysUtils, System.Classes, FMX.StdActns, System.Actions, FMX.ActnList,
  System.ImageList, FMX.ImgList, FMX.Types, FMX.Controls, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdTCPServer, FMX.Forms, IdServerIOHandler,
  IdServerIOHandlerSocket, IdServerIOHandlerStack, IdIntercept,
  IdCompressionIntercept, IdContext, libChangeStyle, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait;

type
  TdmCompanents = class(TDataModule)
    ImageList: TImageList;
    sbLight: TStyleBook; // Light theme
    sbDark: TStyleBook; // Dark theme
    IdTCPServer: TIdTCPServer;
    Language: TLang;
    IdServerCompressionIntercept: TIdServerCompressionIntercept;
    IdServerIOHandlerStack: TIdServerIOHandlerStack;
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    FDQuery: TFDQuery;
    FDQueryDATA: TStringField;
    procedure ChangeStyleLight; // Light theme
    procedure ChangeStyleDark; // Dark theme
    procedure IdTCPServerExecute(AContext: TIdContext);
  private
    { Private declarations }
    sMessage: string;
  public
    { Public declarations }
  end;

var
  dmCompanents: TdmCompanents;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses mainServer;

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
  sMessage := AContext.Connection.Socket.ReadLn();
  formMain.memMessageFromClient.Lines.Add(sMessage);

  FDQuery.Open();
  FDQuery.Insert;

  FDQuery.FieldByName('DATA').AsString := sMessage; // Add data to database
  FDQuery.Post;

  AContext.Connection.Socket.WriteLn(formMain.edtResponse.Text);
  AContext.Connection.Disconnect;
end;

end.
