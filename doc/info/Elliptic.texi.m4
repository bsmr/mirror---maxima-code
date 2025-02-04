@c -*- mode: texinfo -*-

@menu
* Introduction to Elliptic Functions and Integrals::
* Functions and Variables for Elliptic Functions::
* Functions and Variables for Elliptic Integrals::
@end menu



@node Introduction to Elliptic Functions and Integrals, Functions and Variables for Elliptic Functions, , Top
@comment  node-name,  next,  previous,  up

@section Introduction to Elliptic Functions and Integrals

Maxima includes support for Jacobian elliptic functions and for
complete and incomplete elliptic integrals.  This includes symbolic
manipulation of these functions and numerical evaluation as well.
Definitions of these functions and many of their properties can by
found in Abramowitz and Stegun, Chapter 16--17.  As much as possible,
we use the definitions and relationships given there.

In particular, all elliptic functions and integrals use the parameter
@math{m} instead of the modulus @math{k} or the modular angle
@math{\alpha}.  This is one area where we differ from Abramowitz and
Stegun who use the modular angle for the elliptic functions.  The
following relationships are true:

m4_displaymath(
<<<\eqalign{
m &= k^2 \cr
k &= \sin\alpha
}>>>
,
<<<@math{m = k^2}

@math{k = sin(alpha)}>>>
)


The elliptic functions and integrals are primarily intended to support
symbolic computation.  Therefore, most of derivatives of the functions
and integrals are known.  However, if floating-point values are given,
a floating-point result is returned.

Support for most of the other properties of elliptic functions and
integrals other than derivatives has not yet been written.

Some examples of elliptic functions:
@c ===beg===
@c jacobi_sn (u, m);
@c jacobi_sn (u, 1);
@c jacobi_sn (u, 0);
@c diff (jacobi_sn (u, m), u);
@c diff (jacobi_sn (u, m), m);
@c ===end===
@example
(%i1) jacobi_sn (u, m);
(%o1)                    jacobi_sn(u, m)
(%i2) jacobi_sn (u, 1);
(%o2)                        tanh(u)
(%i3) jacobi_sn (u, 0);
(%o3)                        sin(u)
(%i4) diff (jacobi_sn (u, m), u);
(%o4)            jacobi_cn(u, m) jacobi_dn(u, m)
(%i5) diff (jacobi_sn (u, m), m);
(%o5) jacobi_cn(u, m) jacobi_dn(u, m)

      elliptic_e(asin(jacobi_sn(u, m)), m)
 (u - ------------------------------------)/(2 m)
                     1 - m

            2
   jacobi_cn (u, m) jacobi_sn(u, m)
 + --------------------------------
              2 (1 - m)
@end example

Some examples of elliptic integrals:
@c ===beg===
@c elliptic_f (phi, m);
@c elliptic_f (phi, 0);
@c elliptic_f (phi, 1);
@c elliptic_e (phi, 1);
@c elliptic_e (phi, 0);
@c elliptic_kc (1/2);
@c makegamma (%);
@c diff (elliptic_f (phi, m), phi);
@c diff (elliptic_f (phi, m), m);
@c ===end===
@example
(%i1) elliptic_f (phi, m);
(%o1)                  elliptic_f(phi, m)
(%i2) elliptic_f (phi, 0);
(%o2)                          phi
(%i3) elliptic_f (phi, 1);
                               phi   %pi
(%o3)                  log(tan(--- + ---))
                                2     4
(%i4) elliptic_e (phi, 1);
(%o4)                       sin(phi)
(%i5) elliptic_e (phi, 0);
(%o5)                          phi
(%i6) elliptic_kc (1/2);
                                     1
(%o6)                    elliptic_kc(-)
                                     2
(%i7) makegamma (%);
                                 2 1
                            gamma (-)
                                   4
(%o7)                      -----------
                           4 sqrt(%pi)
(%i8) diff (elliptic_f (phi, m), phi);
                                1
(%o8)                 ---------------------
                                    2
                      sqrt(1 - m sin (phi))
(%i9) diff (elliptic_f (phi, m), m);
       elliptic_e(phi, m) - (1 - m) elliptic_f(phi, m)
(%o9) (-----------------------------------------------
                              m

                                 cos(phi) sin(phi)
                             - ---------------------)/(2 (1 - m))
                                             2
                               sqrt(1 - m sin (phi))
@end example

Support for elliptic functions and integrals was written by Raymond
Toy.  It is placed under the terms of the General Public License (GPL)
that governs the distribution of Maxima.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox

@node Functions and Variables for Elliptic Functions, Functions and Variables for Elliptic Integrals, Introduction to Elliptic Functions and Integrals, Top
@comment  node-name,  next,  previous,  up

@section Functions and Variables for Elliptic Functions

@anchor{jacobi_sn}
@deffn {Function} jacobi_sn (@var{u}, @var{m})
The Jacobian elliptic function
m4_math(<<<{\rm sn}(u,m).>>>,
<<<@math{sn(u,m).}>>>)


@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{jacobi_cn}
@deffn {Function} jacobi_cn (@var{u}, @var{m})
The Jacobian elliptic function @math{cn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{jacobi_dn}
@deffn {Function} jacobi_dn (@var{u}, @var{m})
The Jacobian elliptic function @math{dn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{jacobi_ns}
@deffn {Function} jacobi_ns (@var{u}, @var{m})
The Jacobian elliptic function @math{ns(u,m) = 1/sn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{jacobi_sc}
@deffn {Function} jacobi_sc (@var{u}, @var{m})
The Jacobian elliptic function @math{sc(u,m) = sn(u,m)/cn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{jacobi_sd}
@deffn {Function} jacobi_sd (@var{u}, @var{m})
The Jacobian elliptic function @math{sd(u,m) = sn(u,m)/dn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{jacobi_nc}
@deffn {Function} jacobi_nc (@var{u}, @var{m})
The Jacobian elliptic function @math{nc(u,m) = 1/cn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{jacobi_cs}
@deffn {Function} jacobi_cs (@var{u}, @var{m})
The Jacobian elliptic function @math{cs(u,m) = cn(u,m)/sn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{jacobi_cd}
@deffn {Function} jacobi_cd (@var{u}, @var{m})
The Jacobian elliptic function @math{cd(u,m) = cn(u,m)/dn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{jacobi_nd}
@deffn {Function} jacobi_nd (@var{u}, @var{m})
The Jacobian elliptic function @math{nd(u,m) = 1/dn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{jacobi_ds}
@deffn {Function} jacobi_ds (@var{u}, @var{m})
The Jacobian elliptic function @math{ds(u,m) = dn(u,m)/sn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{jacobi_dc}
@deffn {Function} jacobi_dc (@var{u}, @var{m})
The Jacobian elliptic function @math{dc(u,m) = dn(u,m)/cn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_sn}
@deffn {Function} inverse_jacobi_sn (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{sn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_cn}
@deffn {Function} inverse_jacobi_cn (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{cn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_dn}
@deffn {Function} inverse_jacobi_dn (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{dn(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_ns}
@deffn {Function} inverse_jacobi_ns (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{ns(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_sc}
@deffn {Function} inverse_jacobi_sc (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{sc(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_sd}
@deffn {Function} inverse_jacobi_sd (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{sd(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_nc}
@deffn {Function} inverse_jacobi_nc (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{nc(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_cs}
@deffn {Function} inverse_jacobi_cs (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{cs(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_cd}
@deffn {Function} inverse_jacobi_cd (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{cd(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_nd}
@deffn {Function} inverse_jacobi_nd (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{nd(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_ds}
@deffn {Function} inverse_jacobi_ds (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{ds(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn

@anchor{inverse_jacobi_dc}
@deffn {Function} inverse_jacobi_dc (@var{u}, @var{m})
The inverse of the Jacobian elliptic function @math{dc(u,m)}.

@opencatbox{Categories:}
@category{Elliptic functions}
@closecatbox
@end deffn


@node Functions and Variables for Elliptic Integrals, , Functions and Variables for Elliptic Functions, Top
@comment  node-name,  next,  previous,  up

@section Functions and Variables for Elliptic Integrals

@anchor{elliptic_f}
@deffn {Function} elliptic_f (@var{phi}, @var{m})
The incomplete elliptic integral of the first kind, defined as

m4_displaymath(
<<<\int_0^{\phi} {\frac{d\theta}{\sqrt{1-m\sin^2\theta}}}>>>
,
<<<@math{integrate(1/sqrt(1 - m*sin(x)^2), x, 0, phi)}>>>
)

See also @ref{elliptic_e} and @ref{elliptic_kc}.

@opencatbox{Categories:}
@category{Elliptic integrals}
@closecatbox
@end deffn

@anchor{elliptic_e}
@deffn {Function} elliptic_e (@var{phi}, @var{m})
The incomplete elliptic integral of the second kind, defined as

m4_displaymath(
<<<\int_0^\phi {\sqrt{1 - m\sin^2\theta}}\, d\theta>>>
,
<<<@math{elliptic_e(phi, m) = integrate(sqrt(1 - m*sin(x)^2), x, 0, phi)}>>>
)

See also @ref{elliptic_f} and @ref{elliptic_ec}.

@opencatbox{Categories:}
@category{Elliptic integrals}
@closecatbox
@end deffn

@anchor{elliptic_eu}
@deffn {Function} elliptic_eu (@var{u}, @var{m})
The incomplete elliptic integral of the second kind, defined as

m4_displaymath(
<<<E(u, m) = \int_0^u {\rm dn}(v, m)\, dv  = \int_0^\tau \sqrt{\frac{1-m t^2}{1-t^2}}\, dt>>>
,
<<<@math{elliptic_eu(u, m) = integrate(dn(v,m)^2,v,0,u) = integrate(sqrt(1-m*t^2)/sqrt(1-t^2), t, 0, tau)}>>>
)

where
m4_math(
<<<\tau = {\rm sn}(u,m)>>>
,
<<<@math{tau = sn(u,m)}>>>
)
.

This is related to @code{elliptic_e} by

m4_displaymath(
<<<E(u,m) = E(\sin^{-1} {\rm sn}(u, m), m)>>>
,
<<<@math{elliptic_eu(u, m) = elliptic_e(asin(sn(u,m)),m)}>>>
)

See also @ref{elliptic_e}.
@opencatbox{Categories:}
@category{Elliptic integrals}
@closecatbox
@end deffn

@anchor{elliptic_pi}
@deffn {Function} elliptic_pi (@var{n}, @var{phi}, @var{m})
The incomplete elliptic integral of the third kind, defined as

m4_displaymath(
<<<\int_0^\phi {{d\theta}\over{(1-n\sin^2 \theta)\sqrt{1 - m\sin^2\theta}}}>>>
,
<<<@math{integrate(1/(1-n*sin(x)^2)/sqrt(1 - m*sin(x)^2), x, 0, phi)}>>>
)

@opencatbox{Categories:}
@category{Elliptic integrals}
@closecatbox
@end deffn

@anchor{elliptic_kc}
@deffn {Function} elliptic_kc (@var{m})
The complete elliptic integral of the first kind, defined as

m4_displaymath(
<<<\int_0^{\frac{\pi}{2}} {{d\theta}\over{\sqrt{1 - m\sin^2\theta}}}>>>
,
<<<@math{integrate(1/sqrt(1 - m*sin(x)^2), x, 0, pi/2)}>>>
)

For certain values of @math{m}, the value of the integral is known in
terms of @math{Gamma} functions.  Use @mref{makegamma} to evaluate them.

@opencatbox{Categories:}
@category{Elliptic integrals}
@closecatbox
@end deffn

@anchor{elliptic_ec}
@deffn {Function} elliptic_ec (@var{m})
The complete elliptic integral of the second kind, defined as

m4_displaymath(
<<<\int_0^{\frac{\pi}{2}} \sqrt{1 - m\sin^2\theta}\, d\theta>>>
,
<<<@math{integrate(sqrt(1 - m*sin(x)^2), x, 0, pi/2)}>>>
)

For certain values of @math{m}, the value of the integral is known in
terms of @math{Gamma} functions.  Use @mref{makegamma} to evaluate them.

@opencatbox{Categories:}
@category{Elliptic integrals}
@closecatbox
@end deffn

@anchor{carlson_rc}
@deffn {Function} carlson_rc (@var{x}, @var{y})
Carlson's RC integral is defined by

m4_displaymath(
<<<R_C(x, y) = \frac{1}{2} \int_0^{\infty} \frac{1}{\sqrt{t+x}(t+y)}\, dt>>>
,
<<<@math{integrate(1/2*(t+x)^(-1/2)/(t+y), t, 0, inf)}>>>
)

This integral is related to many elementary functions in the following
way:

m4_displaymath(
<<<\eqalign{
\log x &= (x-1) R_C\left(\left({\frac{1+x}{2}}\right)^2, x\right), \quad x > 0 \cr
\sin^{-1} x &= x R_C(1-x^2, 1), \quad |x| \le 1 \cr
\cos^{-1} x &= \sqrt{1-x^2} R_C(x^2,1), \quad 0 \le x \le 1  \cr
\tan^{-1} x &= x  R_C(1,1+x^2)  \cr
\sinh^{-1} x &= x  R_C(1+x^2,1)  \cr
\cosh^{-1} x &= \sqrt{x^2-1}  R_C(x^2,1), \quad x \ge 1  \cr
\tanh^{-1}(x) &= x  R_C(1,1-x^2), \quad |x| \le 1
}>>>
,
<<<@math{log(x)  = (x-1)*rc(((1+x)/2)^2, x), x > 0}

@math{asin(x) = x * rc(1-x^2, 1), |x|<= 1}

@math{acos(x) = sqrt(1-x^2)*rc(x^2,1), 0 <= x <=1}

@math{atan(x) = x * rc(1,1+x^2)}

@math{asinh(x) = x * rc(1+x^2,1)}

@math{acosh(x) = sqrt(x^2-1) * rc(x^2,1), x >= 1}

@math{atanh(x) = x * rc(1,1-x^2), |x|<=1}>>>
)

Also, we have the relationship

m4_displaymath(
<<<R_C(x,y) = R_F(x,y,y)>>>
,
@math{R_C(x,y) = R_F(x,y,y)}
)

Some special values:
m4_displaymath(
<<<\eqalign{R_C(0, 1) &= \frac{\pi}{2} \cr
R_C(0, 1/4) &= \pi \cr
R_C(2,1) &= \log(\sqrt{2} + 1) \cr
R_C(i,i+1) &= \frac{\pi}{4} + \frac{i}{2} \log(\sqrt{2}-1) \cr
R_C(0,i) &= (1-i)\frac{\pi}{2\sqrt{2}} \cr
}>>>
,
@math{R_C(0,1) = pi/2}

@math{R_C(0,1/4) = pi}

@math{R_C(2,1) = log(sqrt(2)+1)}

@math{R_C(i, i+1) = pi/4 + i/2*log(sqrt(2)+1)}

@math{R_C(0, i) = (1-i)*pi/(2*sqrt(2))}
)


@opencatbox{Categories:}
@category{Elliptic integrals}
@closecatbox
@end deffn

@anchor{carlson_rd}
@deffn {Function} carlson_rd (@var{x}, @var{y}, @var{z})
Carlson's RD integral is defined by

m4_displaymath(
<<<R_D(x,y,z) = \frac{3}{2} \int_0^{\infty} \frac{1}{\sqrt{t+x}\sqrt{t+y}\sqrt{t+z}\,(t+z)}\, dt>>>
,
<<<@math{R_D(x,y,z) = 3/2*integrate(1/(sqrt(t+x)*sqrt(t+y)*sqrt(t+z)*(t+z)), t, 0, inf)}>>>
)

We also have the special values

m4_displaymath(
<<<\eqalign{
R_D(x,x,x) &= x^{-\frac{3}{2}} \cr
R_D(0,y,y) &= \frac{3}{4} \pi y^{-\frac{3}{2}} \cr
R_D(0,2,1) &= 3 \sqrt{\pi} \frac{\Gamma(\frac{3}{4})}{\Gamma(\frac{1}{4})}
}>>>
,
<<<@math{R_D(x,x,x) = x^(-3/2)}

@math{R_D(0,y,y) = 3/4*pi*y^(-3/2)}

@math{R_D(0,2,1) = 3 sqrt(pi) gamma(3/4)/gamma(1/4)}>>>
)


It is also related to the complete elliptic E function as follows

m4_displaymath(
<<<E(m) = R_F(0, 1 - m, 1) - \frac{m}{3} R_D(0, 1 - m, 1)>>>
,
<<<@math{E(m) = R_F(0, 1 - m, 1) - (m/3)* R_D(0, 1 - m, 1)}>>>
)

@opencatbox{Categories:}
@category{Elliptic integrals}
@closecatbox
@end deffn

@anchor{carlson_rf}
@deffn {Function} carlson_rf (@var{x}, @var{y}, @var{z})
Carlson's RF integral is defined by

m4_displaymath(
<<<R_F(x,y,z) = \frac{1}{2} \int_0^{\infty} \frac{1}{\sqrt{t+x}\sqrt{t+y}\sqrt{t+z}}\, dt>>>
,
<<<@math{R_F(x,y,z) = 1/2*integrate(1/(sqrt(t+x)*sqrt(t+y)*sqrt(t+z)), t, 0, inf)}>>>
)

We also have the special values

m4_displaymath(
<<<\eqalign{
R_F(0,1,2)  &= \frac{\Gamma({\frac{1}{4}})^2}{4\sqrt{2\pi}} \cr
R_F(i,-i,0) &= \frac{\Gamma({\frac{1}{4}})^2}{4\sqrt{\pi}}
}>>>
,
<<<
@math{R_F(0,1,2) = gamma(1/4)^2/(4*sqrt(2*pi))}

@math{R_F(i,-i,0) = gamma(1/4)^2/(4*sqrt(pi))}
>>>
)

It is also related to the complete elliptic E function as follows

m4_displaymath(
<<<E(m) = R_F(0, 1 - m, 1) - \frac{m}{3} R_D(0, 1 - m, 1)>>>
,
<<<@math{E(m) = R_F(0, 1 - m, 1) - (m/3)* R_D(0, 1 - m, 1)}>>>
)

@opencatbox{Categories:}
@category{Elliptic integrals}
@closecatbox
@end deffn

@anchor{carlson_rj}
@deffn {Function} carlson_rj (@var{x}, @var{y}, @var{z}, @var{p})
Carlson's RJ integral is defined by

m4_displaymath(
<<<R_J(x,y,z) = \frac{1}{2} \int_0^{\infty} \frac{1}{\sqrt{t+x}\sqrt{t+y}\sqrt{t+z}\,(t+p)}\, dt>>>
,
<<<
@math{R_J(x,y,z) = 1/2*integrate(1/(sqrt(t+x)*sqrt(t+y)*sqrt(t+z)*(t+p)), t, 0, inf)}
>>>)

@opencatbox{Categories:}
@category{Elliptic integrals}
@closecatbox
@end deffn

