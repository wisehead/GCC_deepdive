
;; Function main (main, funcdef_no=1, decl_uid=2397, cgraph_uid=1, symbol_order=1)


Pass statistics of "eh": ----------------


Pass statistics of "eh": ----------------

main ()
{
  charD.7 nameD.2401[18];
  floatD.29 dD.2400;
  unsigned intD.9 aD.2399;
  intD.6 D.2403;

  aD.2399 = 123456;
  dD.2400 = 1.014531993865966796875e+1;
  nameD.2401 = "This is a string.";
  _1 = (doubleD.30) dD.2400;
  # USE = anything 
  # CLB = anything 
  printfD.932 ("a=%d, d=%f,  name=%s\n", aD.2399, _1, &nameD.2401);
  D.2403 = 0;
  goto <D.2405>;
  <D.2405>:
  nameD.2401 = {CLOBBER};
  goto <D.2404>;
  D.2403 = 0;
  goto <D.2404>;
  <D.2404>:
  return D.2403;
}


