// -----------------------------------------------------------------------------
// ru-RU
// ������ ���������� ���������� �� ����� � �� ����� � �� �������� ����������� X, Y
//
// en-EN
// The module determines the distance from point A to point B according to the specified X, Y coordinates
//
// Version 1.0.0
// The year the module was created 09.09.2024
// -----------------------------------------------------------------------------
// ------------------------------------------------------- author Strashnov Igor
// -----------------------------------------------------------------------------

unit DistanceByCoordinates;

interface

uses System.SysUtils;

Type
  /// <summary>
  /// Distanse
  /// </summary>
  /// <param name = "Xa,Ya,Xb,Yb">
  /// Coordinates
  /// </param>
  /// <returns>
  /// length by coordinates
  /// </returns>
  TDistance = class sealed
  public
    function XYAB(Xa, Ya, Xb, Yb: Single): Single;
  end;

  { TDistance }
implementation

{ TDistance }

function TDistance.XYAB(Xa, Ya, Xb, Yb: Single): Single;
begin
  Result := sqrt(sqr(Xa - Xb)) + sqr(Ya - Yb)
end;

end.
