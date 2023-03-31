PROGRAM Sliding_door_with_sensors
  VAR_INPUT RETAIN
    X0 : BOOL := 0;
  END_VAR
  VAR_INPUT
    X1 : BOOL;
    X2 : BOOL;
  END_VAR
  VAR_OUTPUT
    Y0 : BOOL;
    Y1 : BOOL;
  END_VAR
  VAR_IN_OUT
    Zs : BOOL;
  END_VAR
  VAR
    RS0 : RS;
    TON0 : TON;
    SR1 : SR;
    _TMP_NOT19_OUT : BOOL;
    _TMP_AND18_OUT : BOOL;
    _TMP_AND7_OUT : BOOL;
    _TMP_OR9_OUT : BOOL;
  END_VAR

  RS0(S := X0, R1 := X2);
  Y0 := RS0.Q1;
  _TMP_NOT19_OUT := NOT(X0);
  _TMP_AND18_OUT := AND(_TMP_NOT19_OUT, X2);
  TON0(IN := _TMP_AND18_OUT, PT := T#2m);
  Zs := TON0.Q;
  _TMP_AND7_OUT := AND(_TMP_NOT19_OUT, Zs);
  _TMP_OR9_OUT := OR(X0, X1);
  SR1(S1 := _TMP_AND7_OUT, R := _TMP_OR9_OUT);
  Y1 := SR1.Q1;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Sliding_door_with_sensors;
  END_RESOURCE
END_CONFIGURATION