# Roadmap

Actually not a roadmap, but something similar:

* [ ] **math:**
    * [x] matrix
        * [x] basic matrix operations
    * [x] vector
    * [x] quaternion
    * [ ] spline
* [ ] **graphics:**
    * [ ] *textures:*
        * [ ] texture 2d
          * [x] generate mipmaps
          * [ ] load mipmaps
        * [ ] texture cube
          * [x] generate mipmaps
          * [ ] load mipmaps
        * [ ] texture array
        * [ ] texture 3d
        * [ ] texture compression
        * [ ] srgb
    * [ ] *shaders:*
        * [x] shader permutations
        * [ ] shader hot reload
        * [ ] shader reflection (parse glsl and extract uniforms)
        * [ ] shader uniform binding in gui
    * [ ] *rendering:*
        * [ ] physically based renderer
            * [x] kronos implementation
                * [ ] debug
            * [x] diffuse irradiance
            * [x] specular irradiance
            * [x] hdr maps
            * [ ] custom brdf
            * [ ] realtime cubemap
        * [x] normal map
        * [x] emmissive map
        * [x] occlusion map
        * [x] output scene depth in a texture
        * [x] multiple render targets
        * [x] order independent transparency
        * [ ] particles
          * [ ] moving emitters
        * [ ] anti aliasing
        * [ ] atmospheric scattering
        * [ ] terrain
* [ ] **audio:**
    * [x] wav 8bps/16bps
    * [ ] wav f32/f64
    * [ ] 3d audio
    * [ ] audio streaming:
    * [ ] compressed audio
* [ ] **phycics:**
    * [ ] collision/intersection/response
      * [ ] ellipsoid/triangle
      * [ ] ellipsoid/ellipsoid
      * [ ] ray/ellipsoid
      * [ ] ray/OBB
      * [ ] ray/AABB
    * [x] gravity
    * [ ] torque
* [ ] **cameras:**
    * [x] free camera
    * [x] first person camera
    * [x] third person camera
    * [x] smooth motions
    * [ ] cinematic camera
* [ ] **gltf support (loader/renderer/exporter):**
    * [x] flat mesh
    * [x] textured mesh
    * [x] hierarchical mesh
    * [x] pbr materials
    * [x] skinning
    * [x] animations
    * [ ] cameras
    * [ ] lights
    * [ ] exporter
* [ ] **2d gui toolkit:**
    * [x] game screens
    * [x] label
    * [x] picture
    * [x] scrollbar
    * [x] list
    * [ ] json serialization
* [ ] **application:**
    * [x] resize events
    * [x] toggle fullscreen
    * [ ] cli
    * [ ] *mobile:*
        * [ ] virtual keyboard
        * [ ] ios
        * [x] android
* [ ] **skycoin:**
    * [ ] cxo
    * [ ] cxchains