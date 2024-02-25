#include "example_lib/example.h"

#include <iostream>

namespace ex = example;

int main(int argc, char** argv) {
	std::cout << "cmake build wrapper" << std::endl;
	std::cout << "function from example_lib: " << ex::example_fn() << std::endl;
}