unit dm�omponents;

interface

uses
  System.SysUtils, System.Classes, FMX.StdActns, System.Actions, FMX.ActnList,
  System.ImageList, FMX.ImgList;

type
  TdmCompanents = class(TDataModule)
    alMenu: TActionList;
    actMain: TAction;
    actSettings: TAction;
    FileExit: TFileExit;
    ImageList: TImageList;
    procedure actMainExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
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

procedure TdmCompanents.actMainExecute(Sender: TObject);
begin
  formMain.tcMain.ActiveTab := formMain.tiMain; // Open main tab
end;

procedure TdmCompanents.actSettingsExecute(Sender: TObject);
begin
  formMain.tcMain.ActiveTab := formMain.tiSettings; // Open settings tab
end;

end.
