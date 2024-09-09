unit DistanceByCoordinates;

interface

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
  TDistance = class
  private
    FXa: Single;
    FYa: Single;
    FXb: Single;
    FYb: Single;
  public
    function XYAB(Xa, Ya, Xb, Yb: Single): Single;
  end;

  { TDistance }
implementation

{ TDistance }

function TDistance.XYAB(Xa, Ya, Xb, Yb: Single): Single;
begin
  FXa := Xa;
  FYa := Ya;
  FXb := Xb;
  FYb := Yb;
  Result := sqrt(sqr(FXa - FXb) + sqr(FYa - FYb));
end;

end.
