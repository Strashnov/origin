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
  FMX.Layouts, FMX.ListBox, FMX.TabControl, FMX.Edit, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

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
    lbMessage: TListBox;
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
    messageStringServer: string;
    Xa, Ya, Xb, Yb: Single;
    TimeStamp: String;
    ClientMessage, ServerMessage: int64;
  public
    { Public declarations }
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
  messageStringClient: string;
  ClientListBoxItems, ServerListBoxItems: TListBoxItem;
  ClientRectangel, ServerRectangel: TRectangle;
  increaseText: TText;
  responseFromServer: TText;
begin

  case tcMain.TabIndex of
    0:
      messageStringClient := btnCoordinats.Text;
    1:
      begin
        messageStringClient := edtSendMessage.Text + ' ' + TimeStamp;
        begin
          // Message client
          ClientMessage := ClientMessage + 1;
          ClientListBoxItems := TListBoxItem.Create(lbMessage);
          ClientListBoxItems.Parent := lbMessage;
          ClientListBoxItems.Name := 'ClientListBoxItems' +
            ClientMessage.ToString;
          ClientListBoxItems.Height := 110;
          ClientListBoxItems.Text := EmptyStr;

          ClientRectangel := TRectangle.Create(ClientListBoxItems);
          ClientRectangel.Parent := ClientListBoxItems;
          ClientRectangel.Name := 'ClientMessage' + ClientMessage.ToString;
          ClientRectangel.Height := 100;
          ClientRectangel.Width := 200;
          ClientRectangel.Align := TAlignLayout.Left;
          ClientRectangel.Margins.Left := 20;
          ClientRectangel.Margins.Top := 5;
          ClientRectangel.Margins.Bottom := 5;
          ClientRectangel.XRadius := -15;
          ClientRectangel.YRadius := 10;
          ClientRectangel.Stroke.Kind := TBrushKind.None;
          ClientRectangel.CornerType := TCornerType.Bevel;
          ClientRectangel.Corners := [TCorner.BottomLeft];
          ClientRectangel.Fill.Color := TAlphaColorRec.Lemonchiffon;

          increaseText := TText.Create(ClientRectangel);
          increaseText.Parent := ClientRectangel;
          increaseText.Name := 'increaseText' + ClientMessage.ToString;
          increaseText.Align := TAlignLayout.Client;
          increaseText.Margins.Bottom := 5;
          increaseText.Margins.Left := 5;
          increaseText.Margins.Right := 5;
          increaseText.Margins.Top := 5;
          increaseText.TextSettings.VertAlign := TTextAlign.Leading;
          increaseText.TextSettings.HorzAlign := TTextAlign.Leading;
          increaseText.TextSettings.WordWrap := True;

          increaseText.Text := messageStringClient;
        end;

        if messageStringServer <> EmptyStr.Empty then
        begin
          // Message server
          ServerMessage := ServerMessage + 1;
          ServerListBoxItems := TListBoxItem.Create(lbMessage);
          ServerListBoxItems.Parent := lbMessage;
          ServerListBoxItems.Name := 'ServerListBoxItems' +
            ServerMessage.ToString;
          ServerListBoxItems.Height := 110;
          ServerListBoxItems.Text := EmptyStr;

          ServerRectangel := TRectangle.Create(ServerListBoxItems);
          ServerRectangel.Parent := ServerListBoxItems;
          ServerRectangel.Name := 'ServerListBoxItems' + ServerMessage.ToString;
          ServerRectangel.Height := 100;
          ServerRectangel.Width := 200;
          ServerRectangel.Align := TAlignLayout.Right;
          ServerRectangel.Margins.Right := 20;
          ServerRectangel.Margins.Top := 5;
          ServerRectangel.Margins.Bottom := 5;
          ServerRectangel.XRadius := -15;
          ServerRectangel.YRadius := 10;
          ServerRectangel.Stroke.Kind := TBrushKind.None;
          ServerRectangel.CornerType := TCornerType.Bevel;
          ServerRectangel.Corners := [TCorner.TopRight];
          ServerRectangel.Fill.Color := TAlphaColorRec.Lightskyblue;

          responseFromServer := TText.Create(ServerRectangel);
          responseFromServer.Parent := ServerRectangel;
          responseFromServer.Name := 'ServerMessage' + ServerMessage.ToString;
          responseFromServer.Align := TAlignLayout.Client;
          responseFromServer.Margins.Bottom := 5;
          responseFromServer.Margins.Left := 5;
          responseFromServer.Margins.Right := 5;
          responseFromServer.Margins.Top := 5;
          responseFromServer.TextSettings.VertAlign := TTextAlign.Leading;
          responseFromServer.TextSettings.HorzAlign := TTextAlign.Leading;
          responseFromServer.TextSettings.WordWrap := True;
          responseFromServer.Text := messageStringServer;
        end;
      end;
  end;

  IdTCPClient.Connect;
  try
    IdTCPClient.Socket.Writeln(messageStringClient);
    messageStringServer := IdTCPClient.Socket.ReadLn();
  finally
    IdTCPClient.Disconnect;
  end;

end;

procedure TformClient.cbTimeStampChange(Sender: TObject);
// Send the current time to the message
begin
  if cbTimeStamp.IsChecked = False then
    TimeStamp := EmptyStr.Empty
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
