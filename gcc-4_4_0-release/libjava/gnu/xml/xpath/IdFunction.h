
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __gnu_xml_xpath_IdFunction__
#define __gnu_xml_xpath_IdFunction__

#pragma interface

#include <gnu/xml/xpath/Pattern.h>
extern "Java"
{
  namespace gnu
  {
    namespace xml
    {
      namespace xpath
      {
          class Expr;
          class IdFunction;
      }
    }
  }
  namespace javax
  {
    namespace xml
    {
      namespace namespace
      {
          class QName;
      }
    }
  }
  namespace org
  {
    namespace w3c
    {
      namespace dom
      {
          class Node;
      }
    }
  }
}

class gnu::xml::xpath::IdFunction : public ::gnu::xml::xpath::Pattern
{

public: // actually package-private
  IdFunction(::java::util::List *);
public:
  IdFunction(::gnu::xml::xpath::Expr *);
  jboolean matches(::org::w3c::dom::Node *);
  ::java::lang::Object * evaluate(::org::w3c::dom::Node *, jint, jint);
  ::gnu::xml::xpath::Expr * clone(::java::lang::Object *);
  jboolean references(::javax::xml::namespace::QName *);
  ::java::lang::String * toString();
public: // actually package-private
  ::gnu::xml::xpath::Expr * __attribute__((aligned(__alignof__( ::gnu::xml::xpath::Pattern)))) arg;
public:
  static ::java::lang::Class class$;
};

#endif // __gnu_xml_xpath_IdFunction__
