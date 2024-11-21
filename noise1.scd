(
SynthDef(\noise1, { |out, cutoff, res=6, mod_freq=20, mod_depth=0, pregain=600|
	var lfo = mod_depth * SinOsc.kr(mod_freq),
	sig = (RLPF.ar(WhiteNoise.ar(), cutoff + lfo, res) * pregain).clip2(1.0);
	Out.ar(out, (sig * 0.9) ! 2)
}).add;
)

(
Pmono(\noise1,
	\cutoff, Pseq([1, 2, 10, 3] * 440, inf),
	\res, Pseq([5, 20], inf),
	\mod_freq, Pseq([1, 100, 1000], inf),
	\mod_depth, Pseq([1000, 10000], inf),
	\pregain, Pseq([20, 5000, 10000], inf),
	\delta, Pseq([1, 0.5, 0.2, 0.1, 2], inf)
).play;
s.record(duration: 20);
)