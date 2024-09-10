unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.Menus, System.ImageList, FMX.ImgList,
  IdIntercept, IdCompressionIntercept, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TformClient = class(TForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    ActionList: TActionList;
    Exit: TFileExit;
    ImageList: TImageList;
    IdTCPClient: TIdTCPClient;
    IdIOHandlerStack: TIdIOHandlerStack;
    IdCompressionIntercept: TIdCompressionIntercept;
    btnCoordinats: TButton;
    StatusBar: TStatusBar;
    labStatusBar: TLabel;
    procedure ExitCanActionExec(Sender: TCustomAction; var CanExec: Boolean);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    { Private declarations }
  public
    { Public declarations }
    Xa, Ya, Xb, Yb: Single;
  end;

var
  formClient: TformClient;

implementation

{$R *.fmx}

uses DistanceByCoordinates;

procedure TformClient.ExitCanActionExec(Sender: TCustomAction;
  var CanExec: Boolean);
begin
  Application.Terminate; // Close programms
end;

procedure TformClient.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Xa := X;
  Ya := Y;
end;

procedure TformClient.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  Distance: TDistance;
begin
  self.Canvas.BeginScene();
  try
    self.Canvas.DrawLine(PointF(Xa, Ya), PointF(X, Y), 1);
  finally
    self.Canvas.EndScene;
  end;
  Xb := X;
  Yb := Y;
  labStatusBar.Text := Xa.ToString + ',' + Ya.ToString + ',' + ' ' + Xb.ToString
    + ',' + Yb.ToString; // Print the coordinates

  Distance := TDistance.Create;
  try
    btnCoordinats.Text := Distance.XYAB(Xa, Ya, Xb, Yb).ToString;
  finally
    Distance.Free;
  end;

end;

end.
