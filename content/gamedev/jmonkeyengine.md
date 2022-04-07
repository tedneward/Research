title=jMonkeyEngine
tags=gamedev, library, jvm
summary=A modern developer friendly game engine written primarily in Java.
~~~~~~

[Website](https://jmonkeyengine.org/) | [Source](https://github.com/jMonkeyEngine/jmonkeyengine)

### [Getting Started](https://jmonkeyengine.org/start/)

Dependencies (as of 3/9/2022): 
```
repositories {
    mavenCentral()
}

dependencies {
    implementation "org.jmonkeyengine:jme3-core:3.3.2-stable"
    implementation "org.jmonkeyengine:jme3-desktop:3.3.2-stable"
    implementation "org.jmonkeyengine:jme3-lwjgl:3.3.2-stable" 
}
```

Hello, jMonkeyEngine:
```
package my.game;
 
import com.jme3.app.SimpleApplication;
import com.jme3.material.Material;
import com.jme3.math.ColorRGBA;
import com.jme3.scene.Geometry;
import com.jme3.scene.shape.Box;
import com.jme3.system.AppSettings;
 
public class Main extends SimpleApplication {
 
    public static void main(String[] args) {
 
        Main app = new Main();
 
        AppSettings settings = new AppSettings(true);
        settings.setTitle("My Awesome Game");
        app.setSettings(settings);
 
        app.start();
 
    }
 
    @Override
    public void simpleInitApp() {
 
        Box b = new Box(1, 1, 1);
        Geometry geom = new Geometry("Box", b);
 
        Material mat = new Material(assetManager, "Common/MatDefs/Misc/Unshaded.j3md");
        mat.setColor("Color", ColorRGBA.Blue);
        geom.setMaterial(mat);
 
        rootNode.attachChild(geom);
 
    }
 
    @Override
    public void simpleUpdate(float tpf) {
        //TODO: add update code
    }
 
}
```

