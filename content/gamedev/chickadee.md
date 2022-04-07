title=Chickadee
tags=gamedev, lisp
summary=A game development toolkit for Guile Scheme.
~~~~~~

[Website](https://dthompson.us/projects/chickadee.html) | [Source](https://git.dthompson.us/chickadee.git)

Examples:

```
(define (draw alpha)
  (draw-text "Hello, world!" (vec2 260.0 240.0)))
```
![](https://dthompson.us/images/chickadee/screenshot-hello-world.png)

```
(use-modules (chickadee graphics sprite))

(define sprite (load-image "chickadee.png"))

(define (draw alpha)
  (draw-sprite sprite (vec2 256.0 176.0)))
```
![](https://dthompson.us/images/chickadee/screenshot-sprite.png)

```
(use-modules (chickadee graphics path))

(define gradient
  (radial-gradient #:start-color tango-light-sky-blue
                   #:end-color tango-dark-sky-blue
                   #:radius 240.0
                   #:origin (vec2 240.0 240.0)))

(define painter
  (let ((filled-circle (with-style ((fill-color gradient))
                         (fill (circle (vec2 240.0 240.0) 240.0)))))
    (translate (vec2 80.0 0.0) (corner-split filled-circle 4))))

(define canvas (make-canvas painter))

(define (draw alpha)
  (draw-canvas canvas))
```
![](https://dthompson.us/images/chickadee/screenshot-vector-path.png)

```
(define model (load-gltf "Suzanne.gltf"))
(define camera-position (vec3 0.0 0.0 3.0))
(define world (make-identity-matrix4))
(define view (look-at camera-position (vec3 0.0 0.0 0.0) (vec3 0.0 1.0 0.0)))
(define projection (perspective-projection (/ pi 3.0) (/ 4.0 3.0) 0.1 5.0))
(define skybox
  (make-skybox
   (load-cube-map #:right "right.jpg"
                  #:left "left.jpg"
                  #:top "top.jpg"
                  #:bottom "bottom.jpg"
                  #:front "front.jpg"
                  #:back "back.jpg")))

(define (draw alpha)
  (with-projection projection
    (draw-skybox skybox view)
    (draw-model model
                #:model-matrix world
                #:view-matrix view
                #:camera-position camera-position
                #:skybox skybox)))
```
![](https://dthompson.us/images/chickadee/screenshot-3d.png)

