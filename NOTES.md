# Study Notes

This document records the lessons learned while developing this project. They are short notes meant to clarify a concept or to remember a procedure for future projects.

## Block diagram

Once I was clear on all the functions my design had to perform, such as counting, decoding and multiplexing, I still wasn't sure where in the code each process should be described. Organizing everything as a block diagram helped a lot: each block had one specific function, and I could see the connections between them. After the functional decomposition of a system, a block diagram is practically a mandatory step. Besides bringing clarity to the whole design, I find it very helpful when connecting the blocks that were designed separately: you can use it to keep track of which connections have already been described and which ones are still missing.

## Clock network with a PLL

This part gave me a hard time, because even the "hello world" of VHDL (blinking an LED) needs a clock feeding the board. The problem was that I tried to drive the system directly from one of the oscillators built into the board, and only after tinkering for a while did I realize that the pin I was using as input (and others: D4, M16 and L7) were reserved as PLL inputs. In other words, on this particular board (where all the oscillators are wired to dedicated PLL input pins) the clock always has to go through a PLL instance first. PLLs are generally used to divide or multiply the frequency of the original clock. This requires the vendor's IP library, where you can configure the PLL to get a specific output frequency, among other options.

While dealing with this same problem, I also learned that the FPGA has a global clock distribution network, which delivers the clock to every logic element with no skew (or as little as possible). This is one of the reasons not to create extra clocks with combinational logic and feed different components with different clocks.
