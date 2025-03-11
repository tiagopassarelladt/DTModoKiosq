unit Unit7;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.Helpers, Androidapi.JNI.App,
  Androidapi.JNI.Os, Androidapi.JNI.JavaTypes, Androidapi.JNIBridge,
  FMX.Controls.Presentation, FMX.Objects, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type
  TForm7 = class(TForm)
    rect_toolbar: TRectangle;
    Label1: TLabel;
    rect_KiosqON: TRectangle;
    Label3: TLabel;
    rec_KiosqOFF: TRectangle;
    Label8: TLabel;
    rect_memo_log: TRectangle;
    mmo_log: TMemo;
    Label4: TLabel;
    procedure rect_KiosqONClick(Sender: TObject);
    procedure rec_KiosqOFFClick(Sender: TObject);
  private
    procedure StartKioskMode;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.fmx}


procedure TForm7.rect_KiosqONClick(Sender: TObject);
begin
StartKioskMode;
end;

procedure TForm7.rec_KiosqOFFClick(Sender: TObject);
var
  Activity: JActivity;
begin
  Activity := TAndroidHelper.Activity;
  Activity.stopLockTask;
  mmo_log.Lines.Clear;
    mmo_log.Lines.Add('Modo Kiosq DESATIVADO');

end;

procedure TForm7.StartKioskMode;
var
  Activity: JActivity;
  ActivityManager: JActivityManager;
begin
  Activity := TAndroidHelper.Activity;

  ActivityManager := TJActivityManager.Wrap(
    (Activity.getSystemService(TJContext.JavaClass.ACTIVITY_SERVICE) as JObject)
  );

  if not ActivityManager.isInLockTaskMode then
  begin
    Activity.startLockTask;
    mmo_log.Lines.Clear;
    mmo_log.Lines.Add('Modo Kiosq ATIVO');
  end
  else
  begin
    mmo_log.Lines.Clear;
    mmo_log.Lines.Add('Modo Kiosq ATIVO');
  end;
end;

end.
