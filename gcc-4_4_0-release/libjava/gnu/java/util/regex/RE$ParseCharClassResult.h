
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __gnu_java_util_regex_RE$ParseCharClassResult__
#define __gnu_java_util_regex_RE$ParseCharClassResult__

#pragma interface

#include <java/lang/Object.h>
extern "Java"
{
  namespace gnu
  {
    namespace java
    {
      namespace util
      {
        namespace regex
        {
            class RE$ParseCharClassResult;
            class RETokenOneOf;
        }
      }
    }
  }
}

class gnu::java::util::regex::RE$ParseCharClassResult : public ::java::lang::Object
{

  RE$ParseCharClassResult();
public: // actually package-private
  RE$ParseCharClassResult(::gnu::java::util::regex::RE$ParseCharClassResult *);
  ::gnu::java::util::regex::RETokenOneOf * __attribute__((aligned(__alignof__( ::java::lang::Object)))) token;
  jint index;
  jboolean returnAtAndOperator;
public:
  static ::java::lang::Class class$;
};

#endif // __gnu_java_util_regex_RE$ParseCharClassResult__