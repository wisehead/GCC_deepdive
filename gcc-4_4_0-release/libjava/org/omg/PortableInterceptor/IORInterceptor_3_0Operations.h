
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __org_omg_PortableInterceptor_IORInterceptor_3_0Operations__
#define __org_omg_PortableInterceptor_IORInterceptor_3_0Operations__

#pragma interface

#include <java/lang/Object.h>
#include <gcj/array.h>

extern "Java"
{
  namespace org
  {
    namespace omg
    {
      namespace PortableInterceptor
      {
          class IORInfo;
          class IORInterceptor_3_0Operations;
          class ObjectReferenceTemplate;
      }
    }
  }
}

class org::omg::PortableInterceptor::IORInterceptor_3_0Operations : public ::java::lang::Object
{

public:
  virtual void adapter_manager_state_changed(jint, jshort) = 0;
  virtual void adapter_state_changed(JArray< ::org::omg::PortableInterceptor::ObjectReferenceTemplate * > *, jshort) = 0;
  virtual void components_established(::org::omg::PortableInterceptor::IORInfo *) = 0;
  virtual void establish_components(::org::omg::PortableInterceptor::IORInfo *) = 0;
  virtual void destroy() = 0;
  virtual ::java::lang::String * name() = 0;
  static ::java::lang::Class class$;
} __attribute__ ((java_interface));

#endif // __org_omg_PortableInterceptor_IORInterceptor_3_0Operations__
