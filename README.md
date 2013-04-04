INTRIN - Interface to GCC intrin api
======

This library is NOT intended for performing high speed calculations
but used as a simple way to play with and test the low level SIMD instructions
available through the GCC intrin api.

I use the library to ease up the testing of simd algorithms, using intrin
it is easy to read and write registers run sequences of SIMD instructions
and check the result.

Currently there is no emulation support for running all the 
variants of SIMD instructions on the same platform. This means
that only instructions available on the running platform is 
potentially available.

Example
    > X0 = << <<X:32/native-float>> || X <- [1.0, 2.0, 3.0, 4.0] >>.
    > intrin:mm_set(xmm0,X0).
    > X1 = << <<X:32/native-float>> || X <- [8.0, 9.0, 10.0, 11.0] >>.
    > intrin:mm_set(xmm1,X1).

    > intrin:mm_mul_ps(xmm1, xmm0).
    
    > [ X || <<X:32/float-native>> <= intrin:mm_get(xmm1)].
    [8.0,18.0,30.0,44.0]

This code loads register xmm0 and xmm1 with 4 single precision floats each
then multiply them pairwise. The result ends up in xmm1 and is then extracted.

As you can see the interface does not return vectors as in the low level
GCC intrin api but instead use a register api mimicing the even lower level
instruction set.

One more example:
    > X0 = << <<(X*X):32/native-float>> || X <- [1,2,3,4,5,6,7,8] >>.
    > intrin:mm_load(xmm0, 0, X0).
    > intrin:mm_sqrt_ps(xmm1, xmm0).
    > intrin:mm_load(xmm0, 16, X0).
    > intrin:mm_sqrt_ps(xmm2, xmm0).
    > [ X || <<X:32/float-native>> <= intrin:mm_get(xmm1)] ++
      [ X || <<X:32/float-native>> <= intrin:mm_get(xmm2)].
    [1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0]
    
    
