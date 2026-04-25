<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works
This design implements a power line interference canceller using a harmonic generator and an LMS adaptive filter.

The harmonic generator produces multiple harmonic components (60Hz, 120Hz, 180Hz, 240Hz equivalents in discrete domain) using optimized arithmetic blocks such as squarers and compressors.

The LMS adaptive filter uses these harmonic references to adaptively estimate and cancel interference from the input signal.

## How to test
Provide input signal x_in through ui_in and desired signal d_in through uio_in.

Observe the output y_out on uo_out and error signal e_out on uio_out.

Test cases include:
- Linear relation (d = 2x)
- Harmonic inputs
- Noise cancellation scenarios

## External hardware

List external hardware used in your project (e.g. PMOD, LED display, etc), if any
