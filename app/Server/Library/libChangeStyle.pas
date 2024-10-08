// -----------------------------------------------------------------------------
// ru-RU
// ������ ������ ���� FMX
//
// en-EN
// The module changes the FMX theme
//
// Version 1.0.0
// The year the module was created 10.09.2024
// -----------------------------------------------------------------------------
// ------------------------------------------------------- author Strashnov Igor
// -----------------------------------------------------------------------------
unit libChangeStyle;

interface

uses FMX.Controls, FMX.Forms;

Type
  /// <summary>
  /// Change style in FMX
  /// </summary>
  /// <param name = "TStyleBook">
  /// StyleBook
  /// </param>
  /// <returns>
  /// Selected style theme
  /// </returns>
  TChangeStyle = class sealed
  public
    procedure ChangeStyle(Theme: TStyleBook);
  end;

implementation

{ TChangeStyle }

procedure TChangeStyle.ChangeStyle(Theme: TStyleBook);
var
  i: byte;
begin
  for i := 0 to Application.ComponentCount - 1 do
    if Application.Components[i] is TForm then
      TForm(Application.Components[i]).StyleBook := Theme;
end;

end.
