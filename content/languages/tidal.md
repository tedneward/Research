title=Tidal (TidalCycles)
tags=language, presentation
summary=A free/OSS that allows you to make (musical) patterns with code, whether live coding music at algoraves or composing in the studio.
~~~~~~

[Website](https://tidalcycles.org/) | [Source](https://codeberg.org/uzu/tidal)

Installation requires a "SuperDirt synthesizer" which I think is a software package?

---

# Tutorial

## Creating Rhymic Sequences

### Play a Single Sample
Tidal provides 16 'connections' to the SuperDirt synthesiser, named from d1 to d16. Here’s a minimal example, that plays a kick drum every cycle:
```
 d1 $ sound "bd"
```

Evaluate the above code in the Atom (or Emacs) editor by pressing Ctrl+Enter. If you want to stop the sound again, look ahead to the section on silence.

In the code above, sound tells us we’re making a pattern of sound samples, and "bd" is a pattern that contains a single sound. bd is a sample of a kick drum. Samples live inside the Dirt-Samples folder which came with SuperDirt, and each sub-folder under that corresponds to a sample name (like bd).

To find the SuperDirt samples on your system, in the SuperCollider IDE select the File > Open User Support Directory menu item. From there, open downloaded-quarks and finally Dirt-Samples in there. You should find a lot of folders, each one is a sample bank containing standard wav files. Feel free to make new folders and add your own sounds to it, see the Custom Samples userbase page for more info.

We can pick a different sample in the bd folder by adding a colon (:) then a number. For example, this picks the fourth kick drum (it counts from zero, so :3 gives you the fourth sound in the folder):

```
 d1 $ sound "bd:3"
```

If you specify a number greater than the number of samples in a folder, then Tidal just “wraps” around back to the first sample again (it starts counting at zero, e.g. in a folder with five samples, “bd:5” would play “bd:0”).

It’s also possible to specify the sample number separately:

```
d1 $ sound "bd" # n "3"
```
