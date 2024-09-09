unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl, FMX.Layouts,
  FMX.ListBox, FMX.Objects;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

{$R *.fmx}

end.
