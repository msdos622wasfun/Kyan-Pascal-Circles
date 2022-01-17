# Kyan-Pascal-Circles
 A simple graphics demo for the Apple II.

Hello all.  For whatever reason, lately I've rekindled a love affair with the Pascal programming language.  I found this really nice compiler for the Apple II called "Kyan," and decided to undertake some retro coding.

In the end I ended up making a little graphics demo that draws circles.  I actually borrowed the algorithm from something I found on a totally different website, since Pascal has no built-in functions for drawing shapes like that.  I know this might sound a little boring, but I think you'll like the end result anyway.

The main thing I find fascinating is that even though the program is compiled (and not interpreted), the circle drawing routine still executes very slowly, even on my 2.8 MHz Apple //gs.  I remember typing in programs in BASIC in my youth that drew circles at pretty much the same speed.  I can only assume that the math routines necessary to do this require extremely large amounts of overhead, which results in extremely slow program execution on old machines like the Apple II series.

If you want to actually compile the code, you'll need Kyan Pascal.  Start by visiting this website: http://www.appleoldies.ca/kix/

If you want to see the origin of the algorithms that draw the circles, visit this web page: http://www.hoist-point.com/applesoft_basic_tutorial.htm