# Study Notes

This document records the lessons learned while developing this project. They are short notes meant to clarify a concept or to remember a procedure for future projects.

## Block diagram

Once I was clear on all the functions my design had to perform, such as counting, decoding and multiplexing, I still wasn't sure where in the code each process should be described. Organizing everything as a block diagram helped a lot: each block had one specific function, and I could see the connections between them. After the functional decomposition of a system, a block diagram is practically a mandatory step. Besides bringing clarity to the whole design, I find it very helpful when connecting the blocks that were designed separately: you can use it to keep track of which connections have already been described and which ones are still missing.
