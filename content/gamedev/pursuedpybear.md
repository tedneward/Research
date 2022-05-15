title=PursuedPyBear
tags=gamedev, python
summary=
~~~~~~

[Website](https://ppb.dev/) | [Source](https://github.com/ppb/pursuedpybear)

Install: `pip install ppb`

To make a very simple game, make a directory and add an image file called ship.png to it. Then add the following to a python file and run it.

        import ppb
        from ppb.features.default_sprites import TargetSprite


        class Ship(TargetSprite):
            target = ppb.Vector(0, 40)


        def setup(scene):
            scene.add(Ship(pos=(0, -7)))


        ppb.run(setup=setup)

