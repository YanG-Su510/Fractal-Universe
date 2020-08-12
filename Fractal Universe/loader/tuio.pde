///////////////////////////////////////////////////////////////////////////////////
// TUIO
void addTuioObject(TuioObject tobj) {}
void updateTuioObject(TuioObject tobj) {}
void removeTuioObject(TuioObject tobj) {}

void addTuioCursor(TuioCursor tcur) {
  println("Detect a touch\t" + tcur.getCursorID());
}

void updateTuioCursor(TuioCursor tcur) {}

void removeTuioCursor(TuioCursor tcur) {
  println("A touch released\t" + tcur.getCursorID());
}

void addTuioBlob(TuioBlob tblb) {}
void updateTuioBlob(TuioBlob tblb) {}
void removeTuioBlob(TuioBlob tblb) {}
void refresh(TuioTime frameTime) {}
