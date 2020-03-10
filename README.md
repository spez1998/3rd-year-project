# Sujit's 3rd Year Project - "Exploring and Combining different Motional Feedback Techniques for a Loudspeaker"
What started off as a simple backup and sync repository has now become a showcase for my work, aimed at the casual observer who may not have a background in electrical and electronic engineering.

## Milestones
I plan to try and make the repository into a complete showcase for all the work that I will conduct over the coming year. Expect MATLAB and LTspice simulations, build pictures, circuit boards, and hopefully a better understanding of acoustical engineering!

## Introduction
For a more technical introduction, along with recommendations for further reading, please read my [project initialisation document.](https://spez1998.github.io/3rd-year-project/Deliverables/PID/PID_ela17sm.pdf)

## Where to start?
It's best to start this project off by consolidating the background theory of loudspeakers, in order to understand the various electrical and mechanical effects and how they are related.
A loudspeaker can be represented as a transformer linking an electrical circuit (which is just the voice coil), along with an equivalent mechanical circuit, linked to the electrical circuit through the loudspeaker's magnet's force-constant. Transferring mechanical properties into the electrical domain is a standard procedure conducted by using dimensional analysis and is described in literature.
Subwoofers have one job: produce good quality bass. What is good quality bass? I think it consists of two things:
1. Lots of bass frequencies. Good sounding bass is equally felt as well as heard, and it's the feeling that makes us respond viscerally and with emotion.
2. Fast and accurate response. Good sounding bass will respond in time with the rest of the audio system so that a kick drum won't appear as if it's lagging behind the other instruments, and won't produce any additional frequencies that muddy the rest of the sound.
The for the project is to try and make a cheap subwoofer sound as good as an expensive one, by using electronics. I chose the Pyle PLPW6D as the subwoofer to use for this project due to its affordability, and also because it has two voice coils. This is great for versatility, not just in how I wire the subwoofer to its amplifier, but also allowing me to implement control circuitry creatively.
