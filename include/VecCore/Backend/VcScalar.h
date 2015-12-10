#ifndef VECCORE_BACKEND_VC_SCALAR_H
#define VECCORE_BACKEND_VC_SCALAR_H

#ifdef VECCORE_ENABLE_VC

#include <cassert>
#include <cstdint>

#include <Vc/Vc>

namespace vecCore {
namespace backend {

template <>
template <typename T>
struct ScalarType<Vc::Scalar::Vector<T> > { typedef T Type; };

template <typename FloatT = float, bool EReturns = true>
class VcScalar {
public:
  static constexpr bool EarlyReturns = EReturns;

  typedef bool Bool_t;
  typedef FloatT Real_t;
  typedef float Float_t;
  typedef double Double_t;

  typedef typename IntFor<Real_t>::type Int_t;
  typedef typename UIntFor<Real_t>::type UInt_t;

  typedef int16_t Int16_t;
  typedef int32_t Int32_t;
  typedef int64_t Int64_t;

  typedef uint16_t UInt16_t;
  typedef uint32_t UInt32_t;
  typedef uint64_t UInt64_t;

  typedef Vc::Scalar::Vector<Real_t> Real_v;
  typedef Vc::Scalar::Vector<Float_t> Float_v;
  typedef Vc::Scalar::Vector<Double_t> Double_v;

  typedef Vc::Scalar::Vector<Int_t> Int_v;
  typedef Vc::Scalar::Vector<Int16_t> Int16_v;
  typedef Vc::Scalar::Vector<Int32_t> Int32_v;
  typedef Vc::Scalar::Vector<Int64_t> Int64_v;

  typedef Vc::Scalar::Vector<UInt_t> UInt_v;
  typedef Vc::Scalar::Vector<UInt16_t> UInt16_v;
  typedef Vc::Scalar::Vector<UInt32_t> UInt32_v;
  typedef Vc::Scalar::Vector<UInt64_t> UInt64_v;
};

} // namespace backend
} // namespace vecCore

#endif
#endif