
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __java_util_PriorityQueue$1__
#define __java_util_PriorityQueue$1__

#pragma interface

#include <java/lang/Object.h>

class java::util::PriorityQueue$1 : public ::java::lang::Object
{

public: // actually package-private
  PriorityQueue$1(::java::util::PriorityQueue *);
public:
  jboolean hasNext();
  ::java::lang::Object * next();
  void remove();
public: // actually package-private
  jint __attribute__((aligned(__alignof__( ::java::lang::Object)))) index;
  jint count;
  ::java::util::PriorityQueue * this$0;
public:
  static ::java::lang::Class class$;
};

#endif // __java_util_PriorityQueue$1__
