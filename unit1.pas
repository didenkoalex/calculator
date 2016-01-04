unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BComma: TButton;
    BPlus: TButton;
    BEqual: TButton;
    Bone: TButton;
    BSeven: TButton;
    BEight: TButton;
    BNine: TButton;
    BDiv: TButton;
    BProc: TButton;
    BDelLastChar: TButton;
    BCe: TButton;
    BC: TButton;
    BCh: TButton;
    BSqrt: TButton;
    BTwo: TButton;
    BMc: TButton;
    BMr: TButton;
    BMs: TButton;
    BMPlus: TButton;
    BMMinus: TButton;
    BThree: TButton;
    BMinus: TButton;
    BFour: TButton;
    BFive: TButton;
    BSix: TButton;
    BMult: TButton;
    BOneDivX: TButton;
    BZero: TButton;
    MemIndicator: TLabel;
    Pole: TEdit;
    procedure BCClick(Sender: TObject);
    procedure BCeClick(Sender: TObject);
    procedure BChClick(Sender: TObject);
    procedure BCommaClick(Sender: TObject);
    procedure BDelLastCharClick(Sender: TObject);
    procedure BMcClick(Sender: TObject);
    procedure BMMinusClick(Sender: TObject);
    procedure BMPlusClick(Sender: TObject);
    procedure BMrClick(Sender: TObject);
    procedure BMsClick(Sender: TObject);
    procedure BOneDivXClick(Sender: TObject);
    procedure BProcClick(Sender: TObject);
    procedure BSqrtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NumberClick(Sender: TObject);
    procedure OperClick(Sender: TObject);
    procedure EqualClick(Sender: TObject);
    procedure clean;
  private
    num1, num2, res: Extended;
    flag, error: byte;
    Oper, Oper1: string;
    Memory: Extended;
    e: extended;
  public
  end;

var
  Form1: TForm1;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.NumberClick(Sender: TObject);
var
  st: string;
begin
  st:=(Sender as TButton).caption;
  if((pole.text='0') or (flag=1) or (error=1)) then begin
    pole.text:=st;
    flag:=0;
    error:=0;
  end
  else
    pole.text:=pole.text+st;
end;

procedure TForm1.OperClick(Sender: TObject);
begin
  if(error<>1) and (flag=0) then begin
  if (Oper<>'') then  begin
        if(error=1) then pole.text:='0';
        num2:=StrToFloat(pole.text);
      case Oper of
        '+':  res:=num1+num2;
        '-':  res:=num1-num2;
        '*':  res:=num1*num2;
        '/': begin
          if(num2=0) then begin
            clean;
            exit;
          end else
            res:=num1/num2;
        end;
      end;
      Oper:=(Sender as TButton).caption;
      num1:=res;
      pole.text:=FloatToStr(res);
      flag:=1;
      end else begin
        if(error=1) then pole.text:='0';
        num1:=StrToFloat(pole.text);
        Oper:=(Sender as TButton).caption;
        flag:=1;
      end;
  end else
    Oper:=(Sender as TButton).caption;
end;

procedure TForm1.EqualClick(Sender: TObject);
begin
if(error<>1) then begin
  res:=strToFloat(pole.text);
  if Oper='' then begin
    Num1:=strToFloat(pole.text);
    case Oper1 of
      '+': res:=num1+num2;
      '-': res:=num1-num2;
      '/': begin
        if(num2=0) then begin
          clean;
          exit;
        end else
          res:=num1/num2;
      end;
      '*': res:=num1*num2;
    end;
  end
  else begin
    num2:=StrToFloat(pole.text);
     case Oper of
       '+': res:=num1+num2;
       '-': res:=num1-num2;
       '*': res:=num1*num2;
       '/': begin
         if(num2=0) then begin
            clean;
            exit;
         end else
           res:=num1/num2;
       end;
     end;
    Oper1:=Oper;
    Oper:='';
  end;
  pole.text:=floatToStr(res);
  flag:=1;
end;
end;

procedure TForm1.clean;
begin
  pole.text:='Неверный ввод';
  num1:=0;
  num2:=0;
  res:=0;
  flag:=0;
  Oper:='';
  Oper1:='';
  error:=1;
end;

procedure TForm1.BCClick(Sender: TObject);
begin
  pole.text:='0';
  num1:=0;
  num2:=0;
  res:=0;
  flag:=0;
  Oper:='';
end;

procedure TForm1.BCeClick(Sender: TObject);
begin
  pole.text:='0';
  flag:=0;
end;

procedure TForm1.BChClick(Sender: TObject);
begin
    pole.text:=FloatToStr(strToFloat(pole.text)*(-1));
end;

procedure TForm1.BCommaClick(Sender: TObject);
begin
  if(pos(',', pole.text)<1) then
    pole.text:=pole.text+',';
  flag:=0;
end;

procedure TForm1.BDelLastCharClick(Sender: TObject);
var
  str: string;
begin
  if(flag=0) then begin
    if(error=0) then begin
      str:=pole.text;
      if(length(str)=1) then
        str:='0'
      else begin
        delete(str, length(str), 1);
      end;
      pole.text:=str;
    end else begin
      pole.text:='0';
      error:=0;
    end;
  end;
end;

procedure TForm1.BMcClick(Sender: TObject);
begin
    MemIndicator.visible:=false;
    Memory:=0;
    pole.text:='0';
end;

procedure TForm1.BMMinusClick(Sender: TObject);
begin
  if(error<>1) then begin
  if(pole.text<>'0') then begin
    Memory:=Memory-strToFloat(pole.text);
    flag:=1;
    MemIndicator.visible:=true;
  end;
  end;
end;

procedure TForm1.BMPlusClick(Sender: TObject);
begin
  if(error<>1) then begin
  if(pole.text<>'0') then begin
    Memory:=Memory+strToFloat(pole.text);
    flag:=1;
    MemIndicator.visible:=true;
  end;
  end;
end;

procedure TForm1.BMrClick(Sender: TObject);
begin
  pole.text:=floatToStr(Memory);
end;

procedure TForm1.BMsClick(Sender: TObject);
begin
  if(error<>1) then begin
  if (pole.text<>'0') then begin
    Memory:=strToFloat(pole.text);
    MemIndicator.visible:=true;
  end;
  end;
end;

procedure TForm1.BOneDivXClick(Sender: TObject);
begin
  if (error=0) then begin
    if (pole.text<>'0') and (error=0) then
      pole.text:=floatToStr(1/strToFloat(pole.text))
    else begin
      clean;
      exit;
    end;
  end;
end;

procedure TForm1.BProcClick(Sender: TObject);
begin
  if(flag=0) and (error=0) then begin
    num2:=strToFloat(pole.text);
    num1:=num1/100*num2;
    pole.text:=floatToStr(num1);
    num1:=0;
    num2:=0;
  end;
end;

procedure TForm1.BSqrtClick(Sender: TObject);
begin
  if (error=0) then begin
    if (strToFloat(pole.text)>=0) then
      pole.text:=floatToStr(sqrt(strToFloat(pole.text)))
    else begin
      clean;
      exit;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memory:=0;
  error:=0;
  Oper:='';
  flag:=0;
  num1:=0;
  num2:=0;
  res:=0;
  e:=1.18E-38;
end;
end.
