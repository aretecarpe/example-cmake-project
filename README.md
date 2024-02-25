# example-cmake-project

An example project utilizing the [cmake build wrapper](https://github.com/mkmemy/example-cmake-project). The repo can either be pulled down once and placed within a developers environment, or it could be a submodule that can be setup with the users repo.

## Usage

### Build Instructions
There are two ways to build this project, below both are listed.

#### CMake Tools
Using the CMake Tools extension: first choose your preset then configure the project, once it is configured simply hit the build button.

#### Command Line
At the minumum all you'll need to write to build the project is listed below.

```
cmake -DCMAKE_PATH={path_to_cmake} ..
cmake --build . --target install --parallel {number of cores}
```

The above command will build and install the project.