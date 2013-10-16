---
layout: post
title:  "Math and Music in Javascript"
date:   2013-10-16 00:30:51
categories: javascript
---

Once upon a time I was walking around the top of my table. My cat maga approached me with a woeful look and meowed. I meowed back. Just then, the door burst open and in walked Pia and Appachu bearing gifts from New York. There was chocolate and this book by Leon Harkleroad the mathman.

I laughed and ate chocalate and started to look at the book. Then I decided to read it later and instead start doing some stuff with this new webAudio API.

This series of articles is me deciphering the logic in music and working my way around this webAudioAPI.

I am also pleased to report that I am very happy today because the night is still young and I am nicely buzzed.

### A place to play

So this webAudioAPI gives us `AudioContext`. This is the studio. This is the guitar. The piano. The context in which we handle audio. This is where we play hide and seek with sound. Now I am going to rant. haha if you thought it has all been a rant till now, wait till you finish reading this.

Bloody major browsers seem to do whatever they want with this prefixing shit. Yesterday it was `msie` Today it is `-webkit`, tomorrow it is `-mybum`. We poor and sleepy developers have to suffer with these prefixes and these whims and fanicies.

So to avoid this mess. we just do this:

{% highlight javascript %}
window.AudioContext = window.AudioContext || window.webkitAudioContext;
{% endhighlight %}


NOW lets start.

`AudioContext` gives us studiospace. It has machines that generate signals. It has other machines and pedals that manipulate these signals. It has machines that makes sound. And it has cabling.

We shall create this space. Let there be space:

{% highlight javascript %}
var studio = new AudioContext();
{% endhighlight %}

So what is this signal machine you ask? I answer with a booming yet husky voice "AN OSCILLATOR! AN OSCILLATOR!!"

So lets get that oscillator going.

{% highlight javascript %}
var osc = studio.createOscillator();
// this makes sure we are working with a sine
// you can set SAWTOOTH or SQAURE as well
osc.type = osc.SINE;
osc.frequency.value = 440;
osc.start(0); // Get that signal started
{% endhighlight %}

Lets get something to manipulate the sound, like an amplifier.

{% highlight javascript %}
var amp = studio.createGain();
amp.gain.value = 0;  // setting the volume
{% endhighlight %}


And a cable out and connect the two.

{% highlight javascript %}
osc.connect(amp);
{% endhighlight %}

All thats left is to connect your computers speakers. Here they are called `studio.destination`. So lets wire that up as well.

{% highlight javascript %}
amp.connect(studio.destination);
{% endhighlight %}

What no sound yet? Well you remember when we got that amp going? We had the gain set as zero. Go ahead and set it to something like zero point five.

{% highlight javascript %}
amp.gain.value = 0.5;
{% endhighlight %}

Nice, safe and stable comes that sound. A. 440 hertz. Great, I feel another rant coming up.

See my cat Maga. She makes sound. Lots and lots of it. She has a friend Ponky who makes more sound than her. Sometimes when they meet in the night they sing beautiful arias on rooftops. Why, last night they started to sing Mozart's queen of the night. If you don't know what that is, you should. [Here is Diana Damrau][damrau], the most mindblowng performer in the history of the universe, singing it. Ms Damrau reminds me of Maga sometimes.

.

{% youtube DvuKxL4LOqc 640 360 %}

Both Maga and Diana Damrau make sounds. And we have a relable playground to make sound. So lets make more sounds.

[damrau]:    http://www.youtube.com/watch?v=UXOYcd6KZ0E
