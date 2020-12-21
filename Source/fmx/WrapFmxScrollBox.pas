unit WrapFmxScrollBox;

interface

uses
  FMX.ScrollBox, WrapFmxControls;

type
  TPyDelphiCustomPresentedScrollBox = class(TPyDelphiPresentedControl)
  private
    function GetDelphiObject: TCustomPresentedScrollBox;
    procedure SetDelphiObject(const Value: TCustomPresentedScrollBox);
  public
    class function  DelphiObjectClass : TClass; override;
    // Properties
    property DelphiObject: TCustomPresentedScrollBox read GetDelphiObject write SetDelphiObject;
  end;

implementation

uses
  WrapDelphi;

{ Register the wrappers, the globals and the constants }
type
  TScrollBoxRegistration = class(TRegisteredUnit)
  public
    function Name : string; override;
    procedure RegisterWrappers(APyDelphiWrapper : TPyDelphiWrapper); override;
    procedure DefineVars(APyDelphiWrapper : TPyDelphiWrapper); override;
  end;

{ TScrollBoxRegistration }

procedure TScrollBoxRegistration.DefineVars(APyDelphiWrapper: TPyDelphiWrapper);
begin
  inherited;
end;

function TScrollBoxRegistration.Name: string;
begin
  Result := 'ScrollBox';
end;

procedure TScrollBoxRegistration.RegisterWrappers(
  APyDelphiWrapper: TPyDelphiWrapper);
begin
  inherited;
  APyDelphiWrapper.RegisterDelphiWrapper(TPyDelphiCustomPresentedScrollBox);
end;

{ TPyDelphiCustomPresentedScrollBox }

class function TPyDelphiCustomPresentedScrollBox.DelphiObjectClass: TClass;
begin
  Result := TCustomPresentedScrollBox;
end;

function TPyDelphiCustomPresentedScrollBox.GetDelphiObject: TCustomPresentedScrollBox;
begin
  Result := TCustomPresentedScrollBox(inherited DelphiObject);
end;

procedure TPyDelphiCustomPresentedScrollBox.SetDelphiObject(
  const Value: TCustomPresentedScrollBox);
begin
  inherited DelphiObject := Value;
end;

initialization
  RegisteredUnits.Add(TScrollBoxRegistration.Create);

end.
