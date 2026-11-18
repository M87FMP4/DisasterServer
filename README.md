# DisasterServer

Required:
- CMake
- Visual Studio
- vcpkg

## Compiling
Without UI:

```bash
cmake -B build -S .
cmake --build build --config Release
```

With UI:

```bash
cmake -B build-ui -S . -DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake -DVCPKG_TARGET_TRIPLET=x64-windows -DBUILD_UI=ON
cmake --build build-ui --config Release
```
