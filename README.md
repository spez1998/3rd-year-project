# Sujit's 3rd Year Project - "Exploring and Combining different Motional Feedback Techniques for a Loudspeaker"
What started off as a simple backup and sync repository has now become a showcase for my work, aimed at the casual observer who may not have a background in electrical and electronic engineering.

## Milestones
I plan to try and make the repository into a complete showcase for all the work that I will conduct over the coming year. Expect MATLAB and LTspice simulations, build pictures, circuit boards, and hopefully a better understanding of acoustical engineering!

## Introduction
For a more technical introduction, along with recommendations for further reading, please read my [project initialisation document.](https://spez1998.github.io/3rd-year-project/Deliverables/PID/PID_ela17sm.pdf)

The ultimate aim of all equipment used to reproduce audio is that whatever has been recorded should be played exactly as it was recorded. This is a difficult task to achieve, since nothing that currently exists responds completely evenly across all of the frequencies that it's expected to operate in. This phenomenon of even response across a frequency range is known as **linearity**. Careful design allows us to come close to linearity - one of the mathematical techniques used is to model the equipment as abstract systems with **transfer functions** that describe the way the system performs across a frequency range. The art of an engineer building this equipment is to **control** the system effectively. Controlling the system is the process of feeding a portion of the output back to the input, in order to compensate for errors that have occurred, are currently occurring, and will occur. This is known as creating a **closed-loop** circuit or system.

Loudspeakers, especially subwoofers, aren't very linear - and even worse, they are never controlled in the manner described above (apart from experimental demonstrations). This means that only very expensive models will ever be close to linear, and cheaper systems that we commonly use in our daily lives don't perform well at all.

Thus, the goal of this project is to investigate different methods of controlling loudspeakers that have been conducted experimentally, combine as many of them as possible, and build an inexpensive subwoofer system that responds as well as an expensive model.

## Open-Loop Subwoofer Analysis
All loudspeakers have certain inherent mechanical and electrical properties which won't change. These properties and given to us by the manufacturer in a datasheet. Using them, the setup of a loudspeaker in some theoretical box can be modelled entirely as an equivalent electrical circuit. A good place to start this project would therefore be to simulate my choice of subwoofer in LTspice. I chose the Pyle PLPW6D dual voice-coil (DVC) subwoofer. Have a look at its frequency response between 10 and 100Hz:

<!--- Basic response graph --->

That looks pretty awful. The response is rolling off towards lower frequencies, with a 7dB difference in sensitivity between low and high frequencies. A nasty resonant peak has also formed at 82Hz. Let's try boosting the low-frequency response:

<!--- Both Linkwitz Transforms without notch graph --->

We now have more of a response in the lowest frequencies, with a peak at 20Hz and rolling off slightly towards higher frequencies. The resonant peak still exists, though. Let's use a notch filter to remove it:

<!--- Both Linkwitz Transform filters plus notch filter graph --->

The result is pretty good. We have a noticeably smoother and more powerful response in the low frequencies, slightly rolling off as we approach 100Hz. The effect of the notch filter is slightly noticeable, but unavloidable. Here's a graph to compare all three responses:

<!--- Comparison graphs --->

What I've done is used some filters to improve the open-loop response of the subwoofer by changing the input signal to accommodate its electrical and mechanical properties. **I have not yet introduced any form of control** because I'm not measuring what the subwoofer is currently doing, I'm simply using information that describes what it will always do to any signal, and making some circuitry that fights against that.

>What is the point in doing this if you're going to control it anyway?

The point in doing this is to make it easier for the control circuitry to do its job, since it shouldn't need to control against some property that is always going to be there, and that will not change in nature. By modifying the input signal to the subwoofer in the way that I've done, I'm effectively "changing" those electrical and mechanical properties such that the response becomes flatter.

>Why are you simulating the subwoofer instead of using a real one?

It costs nothing in parts to simulate something - I'd rather make any mistakes now, when they're easy to rectify. A simulation with these electrical and mechanical parameters will get you pretty close to the subwoofer's actual behaviour, so it's not a waste of time. All I need to do now when I actually buy the subwoofer is validate the numbers I already have with real-life measurements of the subwoofer's properties.
