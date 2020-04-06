int rtx_const(int i){
  char *name = "This is a Name.";
  char *title= "This is a Title.";

AGAIN:
  if(i<11){
        i=i*2;
        goto AGAIN;
  }
  return i;
}
/*
int main()
{}
*/
