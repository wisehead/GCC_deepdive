
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __javax_swing_plaf_basic_ComboPopup__
#define __javax_swing_plaf_basic_ComboPopup__

#pragma interface

#include <java/lang/Object.h>
extern "Java"
{
  namespace java
  {
    namespace awt
    {
      namespace event
      {
          class KeyListener;
          class MouseListener;
          class MouseMotionListener;
      }
    }
  }
  namespace javax
  {
    namespace swing
    {
        class JList;
      namespace plaf
      {
        namespace basic
        {
            class ComboPopup;
        }
      }
    }
  }
}

class javax::swing::plaf::basic::ComboPopup : public ::java::lang::Object
{

public:
  virtual void show() = 0;
  virtual void hide() = 0;
  virtual jboolean isVisible() = 0;
  virtual ::javax::swing::JList * getList() = 0;
  virtual ::java::awt::event::MouseListener * getMouseListener() = 0;
  virtual ::java::awt::event::MouseMotionListener * getMouseMotionListener() = 0;
  virtual ::java::awt::event::KeyListener * getKeyListener() = 0;
  virtual void uninstallingUI() = 0;
  static ::java::lang::Class class$;
} __attribute__ ((java_interface));

#endif // __javax_swing_plaf_basic_ComboPopup__