unit GlobalEnumerator;

interface

uses
  Generics.Collections;

type
  TGlobalEnumerator<T> = class
  private
    FPos: Integer;
    FList: TList<T>;
    FCreatedList: Boolean;
    function GetCurrent: T;
  public
    function MoveNext: Boolean;
    procedure Add(AVal: T);
    constructor Create; overload;
    constructor Create(AList: TList<T>); overload;
    destructor Destroy;
  published
    property Current: T read GetCurrent;
  end;

implementation


constructor TGlobalEnumerator<T>.Create;
begin
  FList:= TList<T>.Create;
  FCreatedList:= True;
end;

constructor TGlobalEnumerator<T>.Create(AList: TList<T>);
begin
  FList:= AList;
  FCreatedList:= False;
end;

destructor TGlobalEnumerator<T>.Destroy;
begin
  if FCreatedList then
    FList.Free;
end;

function TGlobalEnumerator<T>.GetCurrent: T;
begin
  Result:= FList[FPos];
  inc(FPos);
end;

function TGlobalEnumerator<T>.MoveNext: Boolean;
begin
  Result:= FPos<FList.Count;
end;

procedure TGlobalEnumerator<T>.Add(AVal: T);
begin
  FList.Add(AVal);
end;


end.
