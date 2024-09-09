unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl, FMX.Layouts,
  FMX.ListBox, FMX.Objects, dm—omponents;

type
  TformMain = class(TForm)
    panMainRight: TPanel;
    tbMenu: TToolBar;
    MultiView: TMultiView;
    tcMain: TTabControl;
    sbMenu: TSpeedButton;
    lbMenu: TListBox;
    labNamePrograms: TLabel;
    recImageMenu: TRectangle;
    tiMain: TTabItem;
    tiSettings: TTabItem;
    lbiMenu: TListBoxItem;
    lbiSettings: TListBoxItem;
    lbgfLineOne: TListBoxGroupFooter;
    lbiExit: TListBoxItem;
    procedure lbiMenuClick(Sender: TObject);
    procedure lbiSettingsClick(Sender: TObject);
    procedure lbiExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

{$R *.fmx}

procedure TformMain.lbiExitClick(Sender: TObject);
begin
  Application.Terminate; // Close main form
end;

procedure TformMain.lbiMenuClick(Sender: TObject);
begin
  Self.tcMain.ActiveTab := formMain.tiMain; // Open main tab
end;

procedure TformMain.lbiSettingsClick(Sender: TObject);
begin
  Self.tcMain.ActiveTab := formMain.tiSettings; // Open settings tab
end;

end.
