unit mainServer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl, FMX.Layouts,
  FMX.ListBox, FMX.Objects, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.Edit, System.Actions, FMX.ActnList;

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
    lbiMain: TListBoxItem;
    lbiSettings: TListBoxItem;
    lbiExit: TListBoxItem;
    lbSettings: TListBox;
    lbghStyleBook: TListBoxGroupHeader;
    lbiStyle: TListBoxItem;
    lbghLanguage: TListBoxGroupHeader;
    lbiLanguage: TListBoxItem;
    lbghMenu: TListBoxGroupHeader;
    MetropolisUIListBoxItem: TMetropolisUIListBoxItem;
    lbiAbout: TListBoxItem;
    tiLanguage: TTabItem;
    tiStyle: TTabItem;
    lbghOther: TListBoxGroupHeader;
    lbLanguage: TListBox;
    lbiRussian: TListBoxItem;
    lbiEnglish: TListBoxItem;
    lbStyle: TListBox;
    lbiLight: TListBoxItem;
    lbiDark: TListBoxItem;
    tiAbout: TTabItem;
    memMessageFromClient: TMemo;
    imgLogo: TImage;
    txtName: TText;
    txtDiscription: TText;
    lbghTCP: TListBoxGroupHeader;
    lbiIP: TListBoxItem;
    lbiPort: TListBoxItem;
    edtIP: TEdit;
    edtPort: TEdit;
    alMenu: TActionList;
    actMain: TAction;
    actSettings: TAction;
    actExit: TAction;
    actAbout: TAction;
    lbiSwitch: TListBoxItem;
    swtIPPORT: TSwitch;
    procedure lbiStyleClick(Sender: TObject);
    procedure lbiLanguageClick(Sender: TObject);
    procedure lbiRussianClick(Sender: TObject);
    procedure lbiEnglishClick(Sender: TObject);
    procedure lbiLightClick(Sender: TObject);
    procedure lbiDarkClick(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actMainExecute(Sender: TObject);
    procedure swtIPPORTSwitch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

{$R *.fmx}

uses dm—omponents;

procedure TformMain.actAboutExecute(Sender: TObject);
begin
  tcMain.ActiveTab := tiAbout; // Open about tab
end;

procedure TformMain.actExitExecute(Sender: TObject);
begin
  Application.Terminate; // Close main form
end;

procedure TformMain.actMainExecute(Sender: TObject);
begin
  tcMain.ActiveTab := tiMain; // Open main tab
end;

procedure TformMain.actSettingsExecute(Sender: TObject);
begin
  tcMain.ActiveTab := tiSettings; // Open settings tab
end;

procedure TformMain.lbiDarkClick(Sender: TObject);
begin
  lbiLight.ItemData.Accessory := TListBoxItemData.TAccessory.aNone;
  // Off checkmark style light
  lbiDark.ItemData.Accessory := TListBoxItemData.TAccessory.aCheckmark;
  // On checkmark style dark
  dmCompanents.ChangeStyleDark; // On dark style
end;

procedure TformMain.lbiEnglishClick(Sender: TObject);
begin
  lbiRussian.ItemData.Accessory := TListBoxItemData.TAccessory.aNone;
  // Off checkmark language
  lbiEnglish.ItemData.Accessory := TListBoxItemData.TAccessory.aCheckmark;
  // On checmark language
  LoadLangFromStrings(dmCompanents.Language.LangStr['en']); // English language
end;

procedure TformMain.lbiLanguageClick(Sender: TObject);
begin
  tcMain.ActiveTab := tiLanguage; // Open style tab

end;

procedure TformMain.lbiLightClick(Sender: TObject);
begin
  lbiLight.ItemData.Accessory := TListBoxItemData.TAccessory.aCheckmark;
  // On checkmark style light
  lbiDark.ItemData.Accessory := TListBoxItemData.TAccessory.aNone;
  // Off checkmark style dark
  dmCompanents.ChangeStyleLight; // On light style
end;

procedure TformMain.lbiRussianClick(Sender: TObject);
begin
  lbiRussian.ItemData.Accessory := TListBoxItemData.TAccessory.aCheckmark;
  // On checkmark language
  lbiEnglish.ItemData.Accessory := TListBoxItemData.TAccessory.aNone;
  // Off checmark language
  LoadLangFromStrings(dmCompanents.Language.LangStr['ru']); // Russian language
end;

procedure TformMain.lbiStyleClick(Sender: TObject);
begin
  tcMain.ActiveTab := tiStyle; // Open style tab
end;

procedure TformMain.swtIPPORTSwitch(Sender: TObject);
begin
  if swtIPPORT.IsChecked = True then
  begin
    lbiIP.Visible := False;
    lbiPort.Visible := False;
    dmCompanents.IdTCPServer.Bindings.Add.IP := edtIP.Text; // Set ip
    dmCompanents.IdTCPServer.Bindings.Add.Port := edtPort.Text.ToInteger;
    // Set port
    dmCompanents.IdTCPServer.Active := True;
  end
  else
  begin
    lbiIP.Visible := True;
    lbiPort.Visible := True;
    dmCompanents.IdTCPServer.Active := False;
  end;
end;

end.
