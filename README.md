**GlobalEnumerator Example 1**

```
type
  TCountries = record {or class}
  public
    function GetEnumerator: TGlobalEnumerator<string>;
  end;

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TCountries.GetEnumerator: TGlobalEnumerator<string>;
begin
  Result:= TGlobalEnumerator<string>.Create;
  Result.Add('Türkiye');
  Result.Add('Fransa');
  Result.Add('İspanya');
  Result.Add('ABD');
  Result.Add('Çin');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Countries: TCountries;
begin
  for var Country in Countries do
    ShowMessage(Country);
end;
```


**GlobalEnumerator Example 2**

```
type
  TCountries = class {or record}
  private
    FList: TList<string>;
  public
    function GetEnumerator: TGlobalEnumerator<string>;
    constructor Create;
  end;

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

constructor TCountries.Create;
begin
  FList:= TList<string>.Create;
  FList.Add('Türkiye');
  FList.Add('Fransa');
  FList.Add('İspanya');
  FList.Add('ABD');
  FList.Add('Çin');
end;

function TCountries.GetEnumerator: TGlobalEnumerator<string>;
begin
  Result:= TGlobalEnumerator<string>.Create(FList);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Countries: TCountries;
begin
  Countries:= TCountries.Create;

  for var Country in Countries do
    ShowMessage(Country);
end;
```

