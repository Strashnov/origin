unit mainClient;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.Menus, System.ImageList, FMX.ImgList,
  IdIntercept, IdCompressionIntercept, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.MultiView, FMX.Objects,
  FMX.Layouts, FMX.ListBox, FMX.TabControl, FMX.Edit;

type
  TformClient = class(TForm)
    ActionList: TActionList;
    ImageList: TImageList;
    IdTCPClient: TIdTCPClient;
    IdIOHandlerStack: TIdIOHandlerStack;
    IdCompressionIntercept: TIdCompressionIntercept;
    btnCoordinats: TButton;
    labStatusBar: TLabel;
    panMain: TPanel;
    mvMenu: TMultiView;
    tbMenu: TToolBar;
    sbMenu: TSpeedButton;
    lbMenu: TListBox;
    recImageMenu: TRectangle;
    lbghMenu: TListBoxGroupHeader;
    lbiMain: TListBoxItem;
    lbghLineOne: TListBoxGroupHeader;
    lbiExit: TListBoxItem;
    tcMain: TTabControl;
    tiMain: TTabItem;
    tiStyle: TTabItem;
    pbMain: TPaintBox;
    labNamePrograms: TLabel;
    lbStyle: TListBox;
    lbiLight: TListBoxItem;
    lbiDark: TListBoxItem;
    tiSettings: TTabItem;
    lbiSettings: TListBoxItem;
    actExit: TAction;
    lbSettings: TListBox;
    lbghStyleBook: TListBoxGroupHeader;
    lbiStyle: TListBoxItem;
    lbghLanguage: TListBoxGroupHeader;
    lbiLanguage: TListBoxItem;
    lbghTCP: TListBoxGroupHeader;
    lbiIP: TListBoxItem;
    edtIP: TEdit;
    lbiPort: TListBoxItem;
    edtPort: TEdit;
    lbiSwitch: TListBoxItem;
    swtIPPORT: TSwitch;
    txtMessage: TText;
    layTopCoordinats: TLayout;
    tiMessage: TTabItem;
    edtSendMessage: TEdit;
    lbiMessage: TListBoxItem;
    actSendMessage: TAction;
    actSettings: TAction;
    actMain: TAction;
    cbTimeStamp: TCheckBox;
    layMessage: TLayout;
    procedure pbMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure pbMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCoordinatsClick(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure swtIPPORTSwitch(Sender: TObject);
    procedure actSendMessageExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actMainExecute(Sender: TObject);
    procedure cbTimeStampChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Xa, Ya, Xb, Yb: Single;
    TimeStamp: String;
  end;

var
  formClient: TformClient;

implementation

{$R *.fmx}

uses DistanceByCoordinates;

procedure TformClient.actExitExecute(Sender: TObject);
begin
  Application.Terminate; // Close programms
end;

procedure TformClient.actMainExecute(Sender: TObject);
begin
  tcMain.ActiveTab := tiMain; // Open main tab
end;

procedure TformClient.actSendMessageExecute(Sender: TObject);
begin
  tcMain.ActiveTab := tiMessage; // Open message tab
end;

procedure TformClient.actSettingsExecute(Sender: TObject);
begin
  tcMain.ActiveTab := tiSettings; // Open settings tab
end;

procedure TformClient.btnCoordinatsClick(Sender: TObject);
// Send data to the server
var
  messageString: string;
begin

  case tcMain.TabIndex of
    0:
      messageString := btnCoordinats.Text;
    1:
      messageString := edtSendMessage.Text + ' ' + TimeStamp;
  end;

  IdTCPClient.Connect;
  try
    IdTCPClient.Socket.Writeln(messageString);
  finally
    IdTCPClient.Disconnect;
  end;
end;

procedure TformClient.cbTimeStampChange(Sender: TObject);
// Send the current time to the message
begin
  if cbTimeStamp.IsChecked = False then
    TimeStamp := ''
  else
  begin
    cbTimeStamp.IsChecked := True;
    TimeStamp := TimeToStr(now);
  end;
end;

procedure TformClient.pbMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Xa := X;
  Ya := Y;
end;

procedure TformClient.pbMainMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  var
    Distance: TDistance;

  begin
    Xb := X;
    Yb := Y;
    Canvas.BeginScene();
    try
      Canvas.DrawLine(PointF(Xa, Ya), PointF(Xb, Yb), 1);
    finally
      Canvas.EndScene;
    end;

    labStatusBar.Text := Xa.ToString + ',' + Ya.ToString + ',' + ' ' +
      Xb.ToString + ',' + Yb.ToString; // Print the coordinates

    Distance := TDistance.Create;
    try
      btnCoordinats.Text := Distance.XYAB(Xa, Ya, Xb, Yb).ToString;
    finally
      Distance.Free;
    end;
  end;
end;

procedure TformClient.swtIPPORTSwitch(Sender: TObject);
begin
  if swtIPPORT.IsChecked = True then
  begin
    lbiIP.Visible := False;
    lbiPort.Visible := False;
    IdTCPClient.Host := edtIP.Text; // Set ip
    IdTCPClient.Port := edtPort.Text.ToInteger; // Set port
  end
  else
  begin
    lbiIP.Visible := True;
    lbiPort.Visible := True;
  end;
end;

end.
