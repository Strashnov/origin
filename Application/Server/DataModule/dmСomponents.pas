unit dm—omponents;

interface

uses
  System.SysUtils, System.Classes, FMX.StdActns, System.Actions, FMX.ActnList,
  System.ImageList, FMX.ImgList, FMX.Types, FMX.Controls;

type
  TdmCompanents = class(TDataModule)
    ImageList: TImageList;
    alMenu: TActionList;
    actMain: TAction;
    actSettings: TAction;
    actExit: TFileExit;
    sbLight: TStyleBook;
    Language: TLang;
    sbDark: TStyleBook;
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

end.
