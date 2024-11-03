(
var notes;

SynthDef(\blip, { |out, freq = 440, amp = 0.5, gate = 1|
	var env, sig;
	env = Env.adsr(0.01, 0.3, 0.6, 0.5);
	sig = PMOsc.ar(freq, freq * [1.99, 2.01], 0.3 * EnvGen.kr(env), 0.0, amp)
	* EnvGen.kr(env, gate, doneAction: Done.freeSelf);
	Out.ar(out, sig);
}).add;

TempoClock.default.tempo = 240/60;

notes = [60, 61, 60, 60, 60, 61, 68, 60, 58, 70];


p = Pbind(\instrument, \blip,
	\midinote, Pseq(notes, inf, [0, 3, 8]),
	\legato, 0.3).play(quant: 1);

q = Pbind(\instrument, \blip,
	\midinote, Pseq(notes + 12, inf, [2, 9]),
	\legato, 0.3).play(quant: 1);
)

p.stop
q.stop

p.play(quant: 1)
q.play(quant: 1)
