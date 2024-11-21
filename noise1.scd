(
SynthDef(\noise1, { |out, cutoff, res=6, mod_freq=20, mod_depth=0, pregain=600, pan=0|
	var lfo = mod_depth * SinOsc.kr(mod_freq),
	sig = (RLPF.ar(WhiteNoise.ar(), cutoff + lfo, res) * pregain).clip2(1.0);
	Out.ar(out, Pan2.ar((sig * 0.9), pan))
}).add;
)

(
Pmono(\noise1,
	\cutoff, Pseq([1, 2, 10, 3] * 440, inf),
	\res, Pseq([5, 20], inf),
	\mod_freq, Pseq([1, 100, 1000], inf),
	\mod_depth, Pseq([1000, 10000], inf),
	\pregain, Pseq([20, 5000, 10000], inf),
	\pan, Pseq([-0.3, 0.0, 0.3, 0.0, 0.0, 0.0], inf),
	\delta, Pseq([1, 0.5, 0.2, 0.1, 2], inf)
).play;
// s.record(duration: 20);
)

(
Pmono(\noise1,
	\cutoff, Pwhite(10.0, 10000.0),
	\mod_freq, Pwhite(0.0, 100.0),
	\mod_depth, Pwhite(1000.0, 10000.0),
	\pregain, Pwhite(1.0, 100000.0),
	\delta, Pwhite(0.01, 0.8),
	\pan, Pwhite(-0.6, 0.6)
).play;
)
